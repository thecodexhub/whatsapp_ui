import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:whatsappui/main.dart';

class CameraScreen extends StatefulWidget {
  final bool needScaffold;

  CameraScreen({this.needScaffold = false});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _cameraIndex = 0;
  bool _cameraNotAvailable = false;
  CameraController _cameraController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    _showSnackBar("Error: ${e.code}\n${e.description}");
  }

  void _initCamera(int index) async {
    super.initState();
    if (_cameraController != null) {
      await _cameraController.dispose();
    }
    _cameraController = CameraController(cameras[index], ResolutionPreset.high);

    _cameraController.addListener(() {
      if (mounted) setState(() {});
      if (_cameraController.value.hasError) {
        _showSnackBar(
            "Camera error ${_cameraController.value.errorDescription}");
      }
    });

    try {
      await _cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (cameras == null || cameras.isEmpty) {
      setState(() {
        _cameraNotAvailable = true;
      });
    }
    _initCamera(_cameraIndex);
  }

  Widget _buildGalleryBar() {
    return Container(
      height: 90.0,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Container(
              color: Colors.grey[200],
              height: 70.0,
              width: 70.0,
              child: Center(child: Text("Image")),
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.flash_off,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.6)),
        ),
        IconButton(
          icon: Icon(
            Icons.switch_camera,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraNotAvailable) {
      final center = Center(
        child: Text("Camera not avaialable"),
      );

      if (widget.needScaffold) {
        return Scaffold(
          appBar: AppBar(),
          body: center,
        );
      }

      return center;
    }

    final stack = Stack(
      children: <Widget>[
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
          child: Center(
            child: _cameraController.value.isInitialized
                ? Container(
              height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_cameraController),
                  )
                : Text(
                    "loading camera...",
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
                size: 26.0,
              ),
            ),
            _buildGalleryBar(),
            _buildControlBar(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(
                  "Tap for Photo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );

    if (widget.needScaffold) {
      return Scaffold(body: stack);
    }

    return stack;
  }

  @override
  void dispose() {
    super.dispose();
    if (_cameraController != null) {
      _cameraController.dispose();
    }
  }
}

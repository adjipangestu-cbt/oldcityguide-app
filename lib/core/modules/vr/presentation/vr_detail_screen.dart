import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class VRDetailContent extends StatefulWidget {
  final String title;
  final String imageUrl;
  const VRDetailContent({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  State<VRDetailContent> createState() => _VRDetailContentState();
}

class _VRDetailContentState extends State<VRDetailContent> {
  bool isLandscape = false;
  bool eyeGlassesMode = false;
  final leftController = PanoramaController();
  final rightController = PanoramaController();
  bool _isSyncingView = false;

  Future<void> _setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    setState(() => isLandscape = true);
  }

  Future<void> _setPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    setState(() => isLandscape = false);
  }

  @override
  void dispose() {
    leftController.dispose();
    rightController.dispose();
    super.dispose();
  }

  void _syncView({
    required PanoramaController source,
    required PanoramaController target,
    required double latitude,
    required double longitude,
  }) {
    if (_isSyncingView) return;
    _isSyncingView = true;
    target.setView(latitude, longitude);
    Future.delayed(const Duration(milliseconds: 50), () {
      _isSyncingView = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body: Stack(
        children: [
          Center(
            child: Visibility(
              visible: eyeGlassesMode,
              replacement: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: PanoramaViewer(
                  panoramaController: leftController,
                  sensorControl: SensorControl.orientation,
                  child: Image.network(widget.imageUrl),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: PanoramaViewer(
                        panoramaController: leftController,
                        sensorControl: SensorControl.none,
                        onViewChanged: (longitude, latitude, zoom) {
                          _syncView(
                            source: leftController,
                            target: rightController,
                            latitude: latitude,
                            longitude: longitude,
                          );
                        },
                        child: Image.network(widget.imageUrl),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: PanoramaViewer(
                        panoramaController: rightController,
                        sensorControl: SensorControl.none,
                        onViewChanged: (longitude, latitude, zoom) {
                          _syncView(
                            source: rightController,
                            target: leftController,
                            latitude: latitude,
                            longitude: longitude,
                          );
                        },
                        child: Image.network(widget.imageUrl),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 24,
            top: 24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      eyeGlassesMode = !eyeGlassesMode;
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.vrCardboard,
                    color: eyeGlassesMode ? null : Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    isLandscape ? _setPortrait() : _setLandscape();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.rotate,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

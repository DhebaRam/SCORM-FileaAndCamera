import 'package:flutter/material.dart';
import 'package:nfc_demo/website/locator.dart';
import 'package:nfc_demo/website/views/layout_template/layout_template.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: const LayoutTemplate(),
    );
  }
}


// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// // import 'dart:async';
// // import 'dart:io';
//
// // import 'package:camera/camera.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:isolate';
// import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
//
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
//
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter/services.dart';
// // import 'package:gradient_colored_slider/gradient_colored_slider.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
//
// // // enum CameraLensDirection { back, front, external}
// // CameraLensDirection selectDirection = CameraLensDirection.back;
// //
// // class CameraExampleHome extends StatefulWidget {
// //   /// Default Constructor
// //   const CameraExampleHome({super.key});
// //
// //   @override
// //   State<CameraExampleHome> createState() {
// //     return _CameraExampleHomeState();
// //   }
// // }
// //
// // /// Returns a suitable camera icon for [direction].
// // IconData getCameraLensIcon(CameraLensDirection direction) {
// //   switch (direction) {
// //     case CameraLensDirection.back:
// //       return Icons.camera_rear;
// //     case CameraLensDirection.front:
// //       return Icons.camera_front;
// //     case CameraLensDirection.external:
// //       return Icons.camera;
// //   }
// //   // This enum is from a different package, so a new value could be added at
// //   // any time. The example should keep working if that happens.
// //   // ignore: dead_code
// //   return Icons.camera;
// // }
// //
// // void _logError(String code, String? message) {
// //   // ignore: avoid_print
// //   print('Error: $code${message == null ? '' : '\nError Message: $message'}');
// // }
// //
// // class _CameraExampleHomeState extends State<CameraExampleHome>
// //     with WidgetsBindingObserver, TickerProviderStateMixin {
// //   CameraController? controller;
// //   XFile? imageFile;
// //   XFile? videoFile;
// //   String selectedType = 'Camera';
// //   double _currentSliderValue = 0.0;
// //
// //   // VideoPlayerController? videoController;
// //   VoidCallback? videoPlayerListener;
// //   bool enableAudio = true;
// //   double _minAvailableExposureOffset = 0.0;
// //   double _maxAvailableExposureOffset = 0.0;
// //   double _currentExposureOffset = 0.0;
// //   late AnimationController _flashModeControlRowAnimationController;
// //   late Animation<double> _flashModeControlRowAnimation;
// //   late AnimationController _exposureModeControlRowAnimationController;
// //   late Animation<double> _exposureModeControlRowAnimation;
// //   late AnimationController _focusModeControlRowAnimationController;
// //   late Animation<double> _focusModeControlRowAnimation;
// //   double _minAvailableZoom = 1.0;
// //   double _maxAvailableZoom = 1.0;
// //   double _currentScale = 1.0;
// //   double _baseScale = 1.0;
// //
// //   // Counting pointers (number of user fingers on screen)
// //   int _pointers = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //
// //     _flashModeControlRowAnimationController = AnimationController(
// //       duration: const Duration(milliseconds: 300),
// //       vsync: this,
// //     );
// //     _flashModeControlRowAnimation = CurvedAnimation(
// //       parent: _flashModeControlRowAnimationController,
// //       curve: Curves.easeInCubic,
// //     );
// //     _exposureModeControlRowAnimationController = AnimationController(
// //       duration: const Duration(milliseconds: 300),
// //       vsync: this,
// //     );
// //     _exposureModeControlRowAnimation = CurvedAnimation(
// //       parent: _exposureModeControlRowAnimationController,
// //       curve: Curves.easeInCubic,
// //     );
// //     _focusModeControlRowAnimationController = AnimationController(
// //       duration: const Duration(milliseconds: 300),
// //       vsync: this,
// //     );
// //     _focusModeControlRowAnimation = CurvedAnimation(
// //       parent: _focusModeControlRowAnimationController,
// //       curve: Curves.easeInCubic,
// //     );
// //     openCamera();
// //   }
// //
// //   void openCamera() {
// //     if (_cameras.isEmpty) {
// //       SchedulerBinding.instance.addPostFrameCallback((_) async {
// //         showInSnackBar('No camera found.');
// //       });
// //     } else {
// //       if (controller != null) {
// //         controller!.setDescription(const CameraDescription(
// //             name: '0',
// //             lensDirection: CameraLensDirection.back,
// //             sensorOrientation: 90));
// //       } else {
// //         _initializeCameraController(const CameraDescription(
// //             name: '0',
// //             lensDirection: CameraLensDirection.back,
// //             sensorOrientation: 90));
// //       }
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     WidgetsBinding.instance.removeObserver(this);
// //     _flashModeControlRowAnimationController.dispose();
// //     _exposureModeControlRowAnimationController.dispose();
// //     super.dispose();
// //   }
// //
// //   // #docregion AppLifecycle
// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {
// //     final CameraController? cameraController = controller;
// //
// //     // App state changed before we got the chance to initialize.
// //     if (cameraController == null || !cameraController.value.isInitialized) {
// //       return;
// //     }
// //
// //     if (state == AppLifecycleState.inactive) {
// //       cameraController.dispose();
// //     } else if (state == AppLifecycleState.resumed) {
// //       _initializeCameraController(cameraController.description);
// //     }
// //   }
// //
// //   // #enddocregion AppLifecycle
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.black,
// //                 border: Border.all(
// //                   color:
// //                       controller != null && controller!.value.isRecordingVideo
// //                           ? Colors.redAccent
// //                           : Colors.grey,
// //                   width: 3.0,
// //                 ),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(1.0),
// //                 child: Center(
// //                   child: _cameraPreviewWidget(),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           // _captureControlRowWidget(),
// //           GradientColoredSlider(
// //             value: _currentSliderValue,
// //             gradientColors: const [Colors.black38, Colors.black],
// //             onChanged: (double value) async {
// //               setState(() {
// //                 _currentSliderValue = value;
// //               });
// //               await controller!.setZoomLevel(1 + (value * 9));
// //             },
// //           ),
// //           // _modeControlRowWidget(),
// //           Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 10),
// //               child: _modeControlRowWidget1()),
// //           Padding(
// //             padding: const EdgeInsets.all(5.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: <Widget>[
// //                 _thumbnailWidget(),
// //                 _captureControlRowWidget1(),
// //                 _cameraTogglesRowWidget(),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   /// Display the preview from the camera (or a message if the preview is not available).
// //   Widget _cameraPreviewWidget() {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isInitialized) {
// //       return const Text(
// //         'Tap a camera',
// //         style: TextStyle(
// //           color: Colors.white,
// //           fontSize: 24.0,
// //           fontWeight: FontWeight.w900,
// //         ),
// //       );
// //     } else {
// //       return Listener(
// //         onPointerDown: (_) => _pointers++,
// //         onPointerUp: (_) => _pointers--,
// //         child: CameraPreview(
// //           controller!,
// //           child: LayoutBuilder(
// //               builder: (BuildContext context, BoxConstraints constraints) {
// //             return GestureDetector(
// //               behavior: HitTestBehavior.opaque,
// //               onScaleStart: _handleScaleStart,
// //               onScaleUpdate: _handleScaleUpdate,
// //               onTapDown: (TapDownDetails details) =>
// //                   onViewFinderTap(details, constraints),
// //             );
// //           }),
// //         ),
// //       );
// //     }
// //   }
// //
// //   void _handleScaleStart(ScaleStartDetails details) {
// //     _baseScale = _currentScale;
// //   }
// //
// //   Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
// //     // When there are not exactly two fingers on screen don't scale
// //     if (controller == null || _pointers != 2) {
// //       return;
// //     }
// //
// //     _currentScale = (_baseScale * details.scale)
// //         .clamp(_minAvailableZoom, _maxAvailableZoom);
// //     await controller!.setZoomLevel(_currentScale);
// //   }
// //
// //   /// Display the thumbnail of the captured image or video.
// //   Widget _thumbnailWidget() {
// //     //   final VideoPlayerController? localVideoController = videoController;
// //
// //     return Align(
// //         alignment: Alignment.centerLeft,
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             // if (localVideoController == null && imageFile == null)
// //             if (imageFile == null)
// //               Container(
// //                 width: 64.0,
// //                 height: 64.0,
// //                 margin: const EdgeInsets.only(left: 15),
// //                 decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     borderRadius: BorderRadius.circular(10)),
// //               )
// //             else
// //               Container(
// //                   width: 64.0,
// //                   height: 64.0,
// //                   margin: const EdgeInsets.only(left: 15),
// //                   decoration:
// //                       BoxDecoration(borderRadius: BorderRadius.circular(10)),
// //                   child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(8.0),
// //                       child:
// //                           // (localVideoController == null)
// //                           //     ? (
// //                           // The captured image on the web contains a network-accessible URL
// //                           // pointing to a location within the browser. It may be displayed
// //                           // either with Image.network or Image.memory after loading the image
// //                           // bytes to memory.
// //                           kIsWeb
// //                               ? Image.network(imageFile!.path)
// //                               : Image.file(
// //                                   File(imageFile!.path),
// //                                   fit: BoxFit.cover,
// //                                 ))
// //                   //     : Container(
// //                   //   decoration: BoxDecoration(
// //                   //       border: Border.all(color: Colors.pink)),
// //                   //   child: Center(
// //                   //     child: AspectRatio(
// //                   //         aspectRatio:
// //                   //         localVideoController.value.aspectRatio,
// //                   //         child: VideoPlayer(localVideoController)),
// //                   //   ),
// //                   // ),
// //                   ),
// //           ],
// //         ));
// //   }
// //
// //   /// Display a bar with buttons to change the flash and exposure modes
// //   Widget _modeControlRowWidget() {
// //     return Column(
// //       children: <Widget>[
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: <Widget>[
// //             IconButton(
// //               icon: const Icon(Icons.flash_on),
// //               color: Colors.blue,
// //               onPressed: controller != null ? onFlashModeButtonPressed : null,
// //             ),
// //             // The exposure and focus mode are currently not supported on the web.
// //             ...!kIsWeb
// //                 ? <Widget>[
// //                     IconButton(
// //                       icon: const Icon(Icons.exposure),
// //                       color: Colors.blue,
// //                       onPressed: controller != null
// //                           ? onExposureModeButtonPressed
// //                           : null,
// //                     ),
// //                     IconButton(
// //                       icon: const Icon(Icons.filter_center_focus),
// //                       color: Colors.blue,
// //                       onPressed:
// //                           controller != null ? onFocusModeButtonPressed : null,
// //                     )
// //                   ]
// //                 : <Widget>[],
// //             IconButton(
// //               icon: Icon(enableAudio ? Icons.volume_up : Icons.volume_mute),
// //               color: Colors.blue,
// //               onPressed: controller != null ? onAudioModeButtonPressed : null,
// //             ),
// //             IconButton(
// //               icon: Icon(controller?.value.isCaptureOrientationLocked ?? false
// //                   ? Icons.screen_lock_rotation
// //                   : Icons.screen_rotation),
// //               color: Colors.blue,
// //               onPressed: controller != null
// //                   ? onCaptureOrientationLockButtonPressed
// //                   : null,
// //             ),
// //           ],
// //         ),
// //         _flashModeControlRowWidget(),
// //         _exposureModeControlRowWidget(),
// //         _focusModeControlRowWidget(),
// //       ],
// //     );
// //   }
// //
// //   Widget _modeControlRowWidget1() {
// //     final CameraController? cameraController = controller;
// //     return Column(
// //       children: <Widget>[
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: <Widget>[
// //             headerWidget(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedType = 'Camera';
// //                   });
// //                   selectDirection = CameraLensDirection.back;
// //                   onNewCameraSelected(const CameraDescription(
// //                       name: '0',
// //                       lensDirection: CameraLensDirection.back,
// //                       sensorOrientation: 90));
// //                 },
// //                 title: 'Camera',
// //                 isSelected: selectedType),
// //             headerWidget(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedType = 'Pano';
// //                   });
// //                 },
// //                 title: 'Pano',
// //                 isSelected: selectedType),
// //             headerWidget(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedType = 'Portrait';
// //                   });
// //                   _setPortraitMode();
// //                 },
// //                 title: 'Portrait',
// //                 isSelected: selectedType),
// //             headerWidget(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedType = 'Video';
// //                   });
// //                 },
// //                 title: 'Video',
// //                 isSelected: selectedType),
// //             headerWidget(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedType = 'Cinematic';
// //                   });
// //                 },
// //                 title: 'Cinematic',
// //                 isSelected: selectedType)
// //           ],
// //         ),
// //         _flashModeControlRowWidget(),
// //         _exposureModeControlRowWidget(),
// //         _focusModeControlRowWidget(),
// //       ],
// //     );
// //   }
// //
// //   Widget _flashModeControlRowWidget() {
// //     return SizeTransition(
// //       sizeFactor: _flashModeControlRowAnimation,
// //       child: ClipRect(
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: <Widget>[
// //             IconButton(
// //               icon: const Icon(Icons.flash_off),
// //               color: controller?.value.flashMode == FlashMode.off
// //                   ? Colors.orange
// //                   : Colors.blue,
// //               onPressed: controller != null
// //                   ? () => onSetFlashModeButtonPressed(FlashMode.off)
// //                   : null,
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.flash_auto),
// //               color: controller?.value.flashMode == FlashMode.auto
// //                   ? Colors.orange
// //                   : Colors.blue,
// //               onPressed: controller != null
// //                   ? () => onSetFlashModeButtonPressed(FlashMode.auto)
// //                   : null,
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.flash_on),
// //               color: controller?.value.flashMode == FlashMode.always
// //                   ? Colors.orange
// //                   : Colors.blue,
// //               onPressed: controller != null
// //                   ? () => onSetFlashModeButtonPressed(FlashMode.always)
// //                   : null,
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.highlight),
// //               color: controller?.value.flashMode == FlashMode.torch
// //                   ? Colors.orange
// //                   : Colors.blue,
// //               onPressed: controller != null
// //                   ? () => onSetFlashModeButtonPressed(FlashMode.torch)
// //                   : null,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _exposureModeControlRowWidget() {
// //     final ButtonStyle styleAuto = TextButton.styleFrom(
// //       foregroundColor: controller?.value.exposureMode == ExposureMode.auto
// //           ? Colors.orange
// //           : Colors.blue,
// //     );
// //     final ButtonStyle styleLocked = TextButton.styleFrom(
// //       foregroundColor: controller?.value.exposureMode == ExposureMode.locked
// //           ? Colors.orange
// //           : Colors.blue,
// //     );
// //
// //     return SizeTransition(
// //       sizeFactor: _exposureModeControlRowAnimation,
// //       child: ClipRect(
// //         child: ColoredBox(
// //           color: Colors.grey.shade50,
// //           child: Column(
// //             children: <Widget>[
// //               const Center(
// //                 child: Text('Exposure Mode'),
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: <Widget>[
// //                   TextButton(
// //                     style: styleAuto,
// //                     onPressed: controller != null
// //                         ? () =>
// //                             onSetExposureModeButtonPressed(ExposureMode.auto)
// //                         : null,
// //                     onLongPress: () {
// //                       if (controller != null) {
// //                         controller!.setExposurePoint(null);
// //                         showInSnackBar('Resetting exposure point');
// //                       }
// //                     },
// //                     child: const Text('AUTO'),
// //                   ),
// //                   TextButton(
// //                     style: styleLocked,
// //                     onPressed: controller != null
// //                         ? () =>
// //                             onSetExposureModeButtonPressed(ExposureMode.locked)
// //                         : null,
// //                     child: const Text('LOCKED'),
// //                   ),
// //                   TextButton(
// //                     style: styleLocked,
// //                     onPressed: controller != null
// //                         ? () => controller!.setExposureOffset(0.0)
// //                         : null,
// //                     child: const Text('RESET OFFSET'),
// //                   ),
// //                 ],
// //               ),
// //               const Center(
// //                 child: Text('Exposure Offset'),
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: <Widget>[
// //                   Text(_minAvailableExposureOffset.toString()),
// //                   Slider(
// //                     value: _currentExposureOffset,
// //                     min: _minAvailableExposureOffset,
// //                     max: _maxAvailableExposureOffset,
// //                     label: _currentExposureOffset.toString(),
// //                     onChanged: _minAvailableExposureOffset ==
// //                             _maxAvailableExposureOffset
// //                         ? null
// //                         : setExposureOffset,
// //                   ),
// //                   Text(_maxAvailableExposureOffset.toString()),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _focusModeControlRowWidget() {
// //     final ButtonStyle styleAuto = TextButton.styleFrom(
// //       foregroundColor: controller?.value.focusMode == FocusMode.auto
// //           ? Colors.orange
// //           : Colors.blue,
// //     );
// //     final ButtonStyle styleLocked = TextButton.styleFrom(
// //       foregroundColor: controller?.value.focusMode == FocusMode.locked
// //           ? Colors.orange
// //           : Colors.blue,
// //     );
// //
// //     return SizeTransition(
// //       sizeFactor: _focusModeControlRowAnimation,
// //       child: ClipRect(
// //         child: ColoredBox(
// //           color: Colors.grey.shade50,
// //           child: Column(
// //             children: <Widget>[
// //               const Center(
// //                 child: Text('Focus Mode'),
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: <Widget>[
// //                   TextButton(
// //                     style: styleAuto,
// //                     onPressed: controller != null
// //                         ? () => onSetFocusModeButtonPressed(FocusMode.auto)
// //                         : null,
// //                     onLongPress: () {
// //                       if (controller != null) {
// //                         controller!.setFocusPoint(null);
// //                       }
// //                       showInSnackBar('Resetting focus point');
// //                     },
// //                     child: const Text('AUTO'),
// //                   ),
// //                   TextButton(
// //                     style: styleLocked,
// //                     onPressed: controller != null
// //                         ? () => onSetFocusModeButtonPressed(FocusMode.locked)
// //                         : null,
// //                     child: const Text('LOCKED'),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   /// Display the control bar with buttons to take pictures and record videos.
// //   Widget _captureControlRowWidget() {
// //     final CameraController? cameraController = controller;
// //
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       children: <Widget>[
// //         // IconButton(
// //         //   icon: const Icon(Icons.camera_alt),
// //         //   color: Colors.blue,
// //         //   onPressed: cameraController != null &&
// //         //           cameraController.value.isInitialized &&
// //         //           !cameraController.value.isRecordingVideo
// //         //       ? onTakePictureButtonPressed
// //         //       : null,
// //         // ),
// //         // IconButton(
// //         //   icon: const Icon(Icons.videocam),
// //         //   color: Colors.blue,
// //         //   onPressed: cameraController != null &&
// //         //           cameraController.value.isInitialized &&
// //         //           !cameraController.value.isRecordingVideo
// //         //       ? onVideoRecordButtonPressed
// //         //       : null,
// //         // ),
// //         Visibility(
// //             visible: cameraController?.value.isRecordingVideo ?? false,
// //             child: IconButton(
// //               icon: cameraController != null &&
// //                       cameraController.value.isRecordingPaused
// //                   ? const Icon(Icons.play_arrow)
// //                   : const Icon(Icons.pause),
// //               color: Colors.blue,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       cameraController.value.isRecordingVideo
// //                   ? (cameraController.value.isRecordingPaused)
// //                       ? onResumeButtonPressed
// //                       : onPauseButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController?.value.isRecordingVideo ?? false,
// //             child: IconButton(
// //               icon: const Icon(Icons.stop),
// //               color: Colors.red,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       cameraController.value.isRecordingVideo
// //                   ? onStopButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController != null &&
// //                 cameraController.value.isInitialized &&
// //                 cameraController.value.isRecordingVideo,
// //             child: IconButton(
// //               icon: const Icon(Icons.pause_presentation),
// //               color: cameraController?.value.isPreviewPaused ?? false
// //                   ? Colors.red
// //                   : Colors.blue,
// //               onPressed:
// //                   cameraController == null ? null : onPausePreviewButtonPressed,
// //             )),
// //       ],
// //     );
// //   }
// //
// //   Widget _captureControlRowWidget1() {
// //     final CameraController? cameraController = controller;
// //     if (kDebugMode) {
// //       print('controller -- > $cameraController');
// //       print('controller -- > ${cameraController?.value.isRecordingVideo}');
// //     }
// //     return Row(
// //       children: <Widget>[
// //         Visibility(
// //             visible: cameraController != null &&
// //                     !cameraController.value.isRecordingVideo &&
// //                     selectedType == 'Camera' ||
// //                 selectedType == 'Portrait',
// //             child: IconButton(
// //               icon: const Icon(Icons.camera_alt),
// //               color: Colors.blue,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       !cameraController.value.isRecordingVideo
// //                   ? onTakePictureButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController != null &&
// //                 !cameraController.value.isRecordingVideo &&
// //                 selectedType == 'Video',
// //             child: IconButton(
// //               icon: const Icon(Icons.videocam),
// //               color: Colors.blue,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       !cameraController.value.isRecordingVideo
// //                   ? onVideoRecordButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController?.value.isRecordingVideo ?? false,
// //             child: IconButton(
// //               icon: cameraController != null &&
// //                       cameraController.value.isRecordingPaused
// //                   ? const Icon(Icons.play_arrow)
// //                   : const Icon(Icons.pause),
// //               color: Colors.blue,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       cameraController.value.isRecordingVideo
// //                   ? (cameraController.value.isRecordingPaused)
// //                       ? onResumeButtonPressed
// //                       : onPauseButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController?.value.isRecordingVideo ?? false,
// //             child: IconButton(
// //               icon: const Icon(Icons.stop),
// //               color: Colors.red,
// //               onPressed: cameraController != null &&
// //                       cameraController.value.isInitialized &&
// //                       cameraController.value.isRecordingVideo
// //                   ? onStopButtonPressed
// //                   : null,
// //             )),
// //         Visibility(
// //             visible: cameraController != null &&
// //                 cameraController.value.isInitialized &&
// //                 cameraController.value.isRecordingVideo,
// //             child: IconButton(
// //               icon: const Icon(Icons.pause_presentation),
// //               color: cameraController?.value.isPreviewPaused ?? false
// //                   ? Colors.red
// //                   : Colors.blue,
// //               onPressed:
// //                   cameraController == null ? null : onPausePreviewButtonPressed,
// //             )),
// //         // Visibility(
// //         //     visible: cameraController!.value.isRecordingVideo ?? false,
// //         //     child: IconButton(
// //         //       icon: cameraController != null &&
// //         //               cameraController.value.isRecordingPaused
// //         //           ? const Icon(Icons.play_arrow)
// //         //           : const Icon(Icons.pause),
// //         //       color: Colors.blue,
// //         //       onPressed: cameraController != null &&
// //         //               cameraController.value.isInitialized &&
// //         //               cameraController.value.isRecordingVideo
// //         //           ? (cameraController.value.isRecordingPaused)
// //         //               ? onResumeButtonPressed
// //         //               : onPauseButtonPressed
// //         //           : null,
// //         //     )),
// //         // Visibility(
// //         //     visible: cameraController!.value.isRecordingVideo ?? false,
// //         //     child: IconButton(
// //         //       icon: const Icon(Icons.stop),
// //         //       color: Colors.red,
// //         //       onPressed: cameraController != null &&
// //         //               cameraController.value.isInitialized &&
// //         //               cameraController.value.isRecordingVideo
// //         //           ? onStopButtonPressed
// //         //           : null,
// //         //     )),
// //         // Visibility(
// //         //     visible: cameraController!.value.isRecordingVideo ?? false,
// //         //     child: IconButton(
// //         //       icon: const Icon(Icons.pause_presentation),
// //         //       color: cameraController != null &&
// //         //               cameraController.value.isPreviewPaused
// //         //           ? Colors.red
// //         //           : Colors.blue,
// //         //       onPressed:
// //         //           cameraController == null ? null : onPausePreviewButtonPressed,
// //         //     )),
// //       ],
// //     );
// //   }
// //
// //   /// Display a row of toggle to select the camera (or a message if no camera is available).
// //   Widget _cameraTogglesRowWidget() {
// //     final List<Widget> toggles = <Widget>[];
// //
// //     void onChanged(CameraDescription? description) {
// //       if (description == null) {
// //         return;
// //       }
// //
// //       onNewCameraSelected(description);
// //     }
// //
// //     if (_cameras.isEmpty) {
// //       SchedulerBinding.instance.addPostFrameCallback((_) async {
// //         showInSnackBar('No camera found.');
// //       });
// //       return const Text('None');
// //     } else {
// //       for (final CameraDescription cameraDescription in _cameras) {
// //         if (kDebugMode) {
// //           print('cameraDescription---> $cameraDescription');
// //         }
// //         toggles.add(
// //           SizedBox(
// //             width: 70.0,
// //             child: RadioListTile<CameraDescription>(
// //               title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
// //               groupValue: controller?.description,
// //               value: cameraDescription,
// //               onChanged: onChanged,
// //             ),
// //           ),
// //         );
// //       }
// //     }
// //
// //     return IconButton(
// //         onPressed: () {
// //           if (selectDirection == CameraLensDirection.back) {
// //             selectDirection = CameraLensDirection.front;
// //             onNewCameraSelected(const CameraDescription(
// //                 name: '1',
// //                 lensDirection: CameraLensDirection.front,
// //                 sensorOrientation: 270));
// //           } else {
// //             selectDirection = CameraLensDirection.back;
// //             onNewCameraSelected(const CameraDescription(
// //                 name: '0',
// //                 lensDirection: CameraLensDirection.back,
// //                 sensorOrientation: 90));
// //           }
// //           setState(() {});
// //         },
// //         icon: Icon(getCameraLensIcon(selectDirection)));
// //   }
// //
// //   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
// //
// //   void showInSnackBar(String message) {
// //     ScaffoldMessenger.of(context)
// //         .showSnackBar(SnackBar(content: Text(message)));
// //   }
// //
// //   void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
// //     if (controller == null) {
// //       return;
// //     }
// //
// //     final CameraController cameraController = controller!;
// //
// //     final Offset offset = Offset(
// //       details.localPosition.dx / constraints.maxWidth,
// //       details.localPosition.dy / constraints.maxHeight,
// //     );
// //     cameraController.setExposurePoint(offset);
// //     cameraController.setFocusPoint(offset);
// //   }
// //
// //   Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
// //     if (controller != null) {
// //       return controller!.setDescription(cameraDescription);
// //     } else {
// //       return _initializeCameraController(cameraDescription);
// //     }
// //   }
// //
// //   Future<void> _initializeCameraController(
// //       CameraDescription cameraDescription) async {
// //     final CameraController cameraController = CameraController(
// //       cameraDescription,
// //       kIsWeb ? ResolutionPreset.max : ResolutionPreset.high,
// //       enableAudio: enableAudio,
// //       imageFormatGroup: ImageFormatGroup.jpeg,
// //     );
// //
// //     controller = cameraController;
// //
// //     // If the controller is updated then update the UI.
// //     cameraController.addListener(() {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       if (cameraController.value.hasError) {
// //         showInSnackBar(
// //             'Camera error ${cameraController.value.errorDescription}');
// //       }
// //     });
// //
// //     try {
// //       await cameraController.initialize();
// //       await Future.wait(<Future<Object?>>[
// //         // The exposure mode is currently not supported on the web.
// //         ...!kIsWeb
// //             ? <Future<Object?>>[
// //                 cameraController.getMinExposureOffset().then(
// //                     (double value) => _minAvailableExposureOffset = value),
// //                 cameraController
// //                     .getMaxExposureOffset()
// //                     .then((double value) => _maxAvailableExposureOffset = value)
// //               ]
// //             : <Future<Object?>>[],
// //         cameraController
// //             .getMaxZoomLevel()
// //             .then((double value) => _maxAvailableZoom = value),
// //         cameraController
// //             .getMinZoomLevel()
// //             .then((double value) => _minAvailableZoom = value),
// //       ]);
// //     } on CameraException catch (e) {
// //       switch (e.code) {
// //         case 'CameraAccessDenied':
// //           showInSnackBar('You have denied camera access.');
// //         case 'CameraAccessDeniedWithoutPrompt':
// //           // iOS only
// //           showInSnackBar('Please go to Settings app to enable camera access.');
// //         case 'CameraAccessRestricted':
// //           // iOS only
// //           showInSnackBar('Camera access is restricted.');
// //         case 'AudioAccessDenied':
// //           showInSnackBar('You have denied audio access.');
// //         case 'AudioAccessDeniedWithoutPrompt':
// //           // iOS only
// //           showInSnackBar('Please go to Settings app to enable audio access.');
// //         case 'AudioAccessRestricted':
// //           // iOS only
// //           showInSnackBar('Audio access is restricted.');
// //         default:
// //           _showCameraException(e);
// //           break;
// //       }
// //     }
// //
// //     if (mounted) {
// //       setState(() {});
// //     }
// //   }
// //
// //   void onTakePictureButtonPressed() {
// //     takePicture().then((XFile? file) {
// //       if (mounted) {
// //         setState(() {
// //           imageFile = file;
// //           // videoController?.dispose();
// //           // videoController = null;
// //         });
// //         if (file != null) {
// //           showInSnackBar('Picture saved to ${file.path}');
// //         }
// //       }
// //     });
// //   }
// //
// //   void onFlashModeButtonPressed() {
// //     if (_flashModeControlRowAnimationController.value == 1) {
// //       _flashModeControlRowAnimationController.reverse();
// //     } else {
// //       _flashModeControlRowAnimationController.forward();
// //       _exposureModeControlRowAnimationController.reverse();
// //       _focusModeControlRowAnimationController.reverse();
// //     }
// //   }
// //
// //   void onExposureModeButtonPressed() {
// //     if (_exposureModeControlRowAnimationController.value == 1) {
// //       _exposureModeControlRowAnimationController.reverse();
// //     } else {
// //       _exposureModeControlRowAnimationController.forward();
// //       _flashModeControlRowAnimationController.reverse();
// //       _focusModeControlRowAnimationController.reverse();
// //     }
// //   }
// //
// //   void onFocusModeButtonPressed() {
// //     if (_focusModeControlRowAnimationController.value == 1) {
// //       _focusModeControlRowAnimationController.reverse();
// //     } else {
// //       _focusModeControlRowAnimationController.forward();
// //       _flashModeControlRowAnimationController.reverse();
// //       _exposureModeControlRowAnimationController.reverse();
// //     }
// //   }
// //
// //   void onAudioModeButtonPressed() {
// //     enableAudio = !enableAudio;
// //     if (controller != null) {
// //       onNewCameraSelected(controller!.description);
// //     }
// //   }
// //
// //   Future<void> onCaptureOrientationLockButtonPressed() async {
// //     try {
// //       if (controller != null) {
// //         final CameraController cameraController = controller!;
// //         if (cameraController.value.isCaptureOrientationLocked) {
// //           await cameraController.unlockCaptureOrientation();
// //           showInSnackBar('Capture orientation unlocked');
// //         } else {
// //           await cameraController.lockCaptureOrientation();
// //           showInSnackBar(
// //               'Capture orientation locked to ${cameraController.value.lockedCaptureOrientation.toString().split('.').last}');
// //         }
// //       }
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //     }
// //   }
// //
// //   void onSetFlashModeButtonPressed(FlashMode mode) {
// //     setFlashMode(mode).then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
// //     });
// //   }
// //
// //   void onSetExposureModeButtonPressed(ExposureMode mode) {
// //     setExposureMode(mode).then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       showInSnackBar('Exposure mode set to ${mode.toString().split('.').last}');
// //     });
// //   }
// //
// //   void onSetFocusModeButtonPressed(FocusMode mode) {
// //     setFocusMode(mode).then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       showInSnackBar('Focus mode set to ${mode.toString().split('.').last}');
// //     });
// //   }
// //
// //   void onVideoRecordButtonPressed() {
// //     startVideoRecording().then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //     });
// //   }
// //
// //   void onStopButtonPressed() {
// //     stopVideoRecording().then((XFile? file) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       if (file != null) {
// //         showInSnackBar('Video recorded to ${file.path}');
// //         videoFile = file;
// //         // _startVideoPlayer();
// //       }
// //     });
// //   }
// //
// //   Future<void> onPausePreviewButtonPressed() async {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isInitialized) {
// //       showInSnackBar('Error: select a camera first.');
// //       return;
// //     }
// //
// //     if (cameraController.value.isPreviewPaused) {
// //       await cameraController.resumePreview();
// //     } else {
// //       await cameraController.pausePreview();
// //     }
// //
// //     if (mounted) {
// //       setState(() {});
// //     }
// //   }
// //
// //   void onPauseButtonPressed() {
// //     pauseVideoRecording().then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       showInSnackBar('Video recording paused');
// //     });
// //   }
// //
// //   void onResumeButtonPressed() {
// //     resumeVideoRecording().then((_) {
// //       if (mounted) {
// //         setState(() {});
// //       }
// //       showInSnackBar('Video recording resumed');
// //     });
// //   }
// //
// //   Future<void> startVideoRecording() async {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isInitialized) {
// //       showInSnackBar('Error: select a camera first.');
// //       return;
// //     }
// //
// //     if (cameraController.value.isRecordingVideo) {
// //       // A recording is already started, do nothing.
// //       return;
// //     }
// //
// //     try {
// //       await cameraController.startVideoRecording();
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       return;
// //     }
// //   }
// //
// //   Future<XFile?> stopVideoRecording() async {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isRecordingVideo) {
// //       return null;
// //     }
// //
// //     try {
// //       return cameraController.stopVideoRecording();
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       return null;
// //     }
// //   }
// //
// //   Future<void> pauseVideoRecording() async {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isRecordingVideo) {
// //       return;
// //     }
// //
// //     try {
// //       await cameraController.pauseVideoRecording();
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> resumeVideoRecording() async {
// //     final CameraController? cameraController = controller;
// //
// //     if (cameraController == null || !cameraController.value.isRecordingVideo) {
// //       return;
// //     }
// //
// //     try {
// //       await cameraController.resumeVideoRecording();
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> setFlashMode(FlashMode mode) async {
// //     if (controller == null) {
// //       return;
// //     }
// //
// //     try {
// //       await controller!.setFlashMode(mode);
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> setExposureMode(ExposureMode mode) async {
// //     if (controller == null) {
// //       return;
// //     }
// //
// //     try {
// //       await controller!.setExposureMode(mode);
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> setExposureOffset(double offset) async {
// //     if (controller == null) {
// //       return;
// //     }
// //
// //     setState(() {
// //       _currentExposureOffset = offset;
// //     });
// //     try {
// //       offset = await controller!.setExposureOffset(offset);
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> setFocusMode(FocusMode mode) async {
// //     if (controller == null) {
// //       return;
// //     }
// //
// //     try {
// //       await controller!.setFocusMode(mode);
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       rethrow;
// //     }
// //   }
// //
// //   // Future<void> _startVideoPlayer() async {
// //   //   if (videoFile == null) {
// //   //     return;
// //   //   }
// //   //
// //   //   final VideoPlayerController vController = kIsWeb
// //   //       ? VideoPlayerController.networkUrl(Uri.parse(videoFile!.path))
// //   //       : VideoPlayerController.file(File(videoFile!.path));
// //   //
// //   //   videoPlayerListener = () {
// //   //     if (videoController != null) {
// //   //       // Refreshing the state to update video player with the correct ratio.
// //   //       if (mounted) {
// //   //         setState(() {});
// //   //       }
// //   //       videoController!.removeListener(videoPlayerListener!);
// //   //     }
// //   //   };
// //   //   vController.addListener(videoPlayerListener!);
// //   //   await vController.setLooping(true);
// //   //   await vController.initialize();
// //   //   await videoController?.dispose();
// //   //   if (mounted) {
// //   //     setState(() {
// //   //       imageFile = null;
// //   //       videoController = vController;
// //   //     });
// //   //   }
// //   //   await vController.play();
// //   // }
// //
// //   Future<XFile?> takePicture() async {
// //     final CameraController? cameraController = controller;
// //     if (cameraController == null || !cameraController.value.isInitialized) {
// //       showInSnackBar('Error: select a camera first.');
// //       return null;
// //     }
// //
// //     if (cameraController.value.isTakingPicture) {
// //       // A capture is already pending, do nothing.
// //       return null;
// //     }
// //
// //     try {
// //       final XFile file = await cameraController.takePicture();
// //       return file;
// //     } on CameraException catch (e) {
// //       _showCameraException(e);
// //       return null;
// //     }
// //   }
// //
// //   void _showCameraException(CameraException e) {
// //     _logError(e.code, e.description);
// //     showInSnackBar('Error: ${e.code}\n${e.description}');
// //   }
// //
// //   headerWidget(
// //       {required void Function() onTap, required String title, isSelected}) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Text(title,
// //           style: TextStyle(
// //               fontSize: isSelected == title ? 17 : 15,
// //               fontWeight:
// //                   isSelected == title ? FontWeight.w700 : FontWeight.w500)),
// //     );
// //   }
// //
// //   Future<void> _setPortraitMode() async {
// //     try{
// //       await SystemChrome.setPreferredOrientations([
// //         DeviceOrientation.portraitUp,
// //         DeviceOrientation.portraitDown,
// //       ]);
// //
// //       // Dispose and reinitialize the CameraController to apply orientation changes
// //       controller?.dispose();
// //
// //       _initializeCameraController(const CameraDescription(
// //           name: '0',
// //           lensDirection: CameraLensDirection.back,
// //           sensorOrientation: 90));
// //       print('_setPortraitMode ---- > ${controller?.initialize()}');
// //     }catch(e){
// //       print('_setPortraitMode Catch ---- > ${e.toString()}');
// //     }
// //   }
// // }
// //
// // /// CameraApp is the Main Application.
// // class CameraApp extends StatelessWidget {
// //   /// Default Constructor
// //   const CameraApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       home: CameraExampleHome(),
// //     );
// //   }
// // }
// //
// // List<CameraDescription> _cameras = <CameraDescription>[];
// //
// // Future<void> main() async {
// //   // Fetch the available cameras before initializing the app.
// //   try {
// //     WidgetsFlutterBinding.ensureInitialized();
// //     _cameras = await availableCameras();
// //   } on CameraException catch (e) {
// //     _logError(e.code, e.description);
// //   }
// //   runApp(const CameraApp());
// // }
//
// // void main() {//https://example.com/path-to-your-scorm-package/index.html
// //   runApp(MyApp());
// // }
//
// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// // ignore_for_file: public_member_api_docs
//
// // #enddocregion platform_imports
//
// class AnimationDemoScreen extends StatefulWidget {
//   const AnimationDemoScreen({super.key});
//
//   @override
//   _AnimationDemoScreenState createState() => _AnimationDemoScreenState();
// }
//
// class _AnimationDemoScreenState extends State<AnimationDemoScreen> {
//   bool _animate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Animation Demos'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildAnimatedContainer(),
//           const SizedBox(height: 20),
//           _buildAnimatedOpacity(),
//           const SizedBox(height: 20),
//           _buildAnimatedAlign(),
//           const SizedBox(height: 20),
//           _buildAnimatedPadding(),
//           const SizedBox(height: 20),
//           _buildAnimatedPositioned(),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _animate = !_animate;
//           });
//         },
//         child: const Icon(Icons.play_arrow),
//       ),
//     );
//   }
//
//   Widget _buildAnimatedContainer() {
//     return Column(
//       children: [
//         const Text('AnimatedContainer', style: TextStyle(fontSize: 20)),
//         AnimatedContainer(
//           duration: const Duration(seconds: 1),
//           width: _animate ? 200 : 100,
//           height: _animate ? 200 : 100,
//           color: _animate ? Colors.blue : Colors.red,
//           curve: Curves.easeInOut,
//           child: const Center(child: Text('Tap Play')),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAnimatedOpacity() {
//     return Column(
//       children: [
//         const Text('AnimatedOpacity', style: TextStyle(fontSize: 20)),
//         AnimatedOpacity(
//           opacity: _animate ? 1.0 : 0.0,
//           duration: const Duration(seconds: 1),
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.green,
//             child: const Center(child: Text('Tap Play')),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAnimatedAlign() {
//     return Column(
//       children: [
//         const Text('AnimatedAlign', style: TextStyle(fontSize: 20)),
//         Container(
//           width: 200,
//           height: 200,
//           color: Colors.yellow.shade100,
//           child: AnimatedAlign(
//             alignment: _animate ? Alignment.topRight : Alignment.bottomLeft,
//             duration: const Duration(seconds: 1),
//             curve: Curves.easeInOut,
//             child: const FlutterLogo(size: 50),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAnimatedPadding() {
//     return Column(
//       children: [
//         const Text('AnimatedPadding', style: TextStyle(fontSize: 20)),
//         AnimatedPadding(
//           padding:
//               _animate ? const EdgeInsets.all(50) : const EdgeInsets.all(10),
//           duration: const Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           child: Container(
//             color: Colors.purple,
//             child: const Center(child: Text('Tap Play')),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAnimatedPositioned() {
//     return Column(
//       children: [
//         const Text('AnimatedPositioned', style: TextStyle(fontSize: 20)),
//         Container(
//           width: 200,
//           height: 200,
//           color: Colors.orange.shade100,
//           child: Stack(
//             children: [
//               AnimatedPositioned(
//                 duration: const Duration(seconds: 1),
//                 left: _animate ? 100 : 0,
//                 top: _animate ? 100 : 0,
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   color: Colors.orange,
//                   child: const Center(child: Text('Tap Play')),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// void backgroundTask(SendPort sendPort) async {
//   // Perform some background processing
//   await Future.delayed(const Duration(seconds: 30));
//   sendPort.send('Background task completed');
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Isolate Example')),
//         body: Center(
//           child: ElevatedButton(
//             child: const Text('Start Background Task'),
//             onPressed: () async {
//               ReceivePort receivePort = ReceivePort();
//               await Isolate.spawn(backgroundTask, receivePort.sendPort);
//
//               receivePort.listen((message) {
//                 print(message); // Output: Background task completed
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // void main() => runApp(MaterialApp(home: MyApp()));
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => FirstScreen(),
// //         '/second': (context) => SecondScreen(),
// //         '/third': (context) => ThirdScreen(),
// //         '/four': (context) => FourScreen(),
// //         '/five': (context) => FiveScreen(),
// //         '/six': (context) => SixScreen(),
// //         // Define routes for all screens
// //       },
// //     );
// //   }
// // }
//
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('First Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Next'),
//           onPressed: () {
//             Navigator.pushNamed(context, '/second');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Second Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Next'),
//           onPressed: () {
//             Navigator.pushNamed(context, '/third');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class ThirdScreen extends StatelessWidget {
//   const ThirdScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Third Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Complete'),
//           onPressed: () {
//             // Remove all screens and navigate to the first screen
//             Navigator.pushNamed(context, '/four');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class FourScreen extends StatelessWidget {
//   const FourScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Third Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Complete'),
//           onPressed: () {
//             // Remove all screens and navigate to the first screen
//             Navigator.pushNamed(context, '/five');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class FiveScreen extends StatelessWidget {
//   const FiveScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Third Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Complete'),
//           onPressed: () {
//             // Remove all screens and navigate to the first screen
//             Navigator.pushNamed(context, '/six');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SixScreen extends StatelessWidget {
//   const SixScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Six Screen')),
//       body: Center(
//         child: TextButton(
//           child: const Text('Complete'),
//           onPressed: () {
//             // Remove all screens and navigate to the first screen
//             Navigator.popAndPushNamed(context, '/four');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// const String kNavigationExamplePage = '''
// <!DOCTYPE html><html>
// <head><title>Navigation Delegate Example</title></head>
// <body>
// <p>
// The navigation delegate is set to block navigation to the youtube website.
// </p>
// <ul>
// <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
// <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
// </ul>
// </body>
// </html>
// ''';
//
// const String kLocalExamplePage = '''
// <!DOCTYPE html>
// <html lang="en">
// <head>
// <title>Load file or HTML string example</title>
// </head>
// <body>
//
// <h1>Local demo page</h1>
// <p>
//   This is an example page used to demonstrate how to load a local file or HTML
//   string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
//   webview</a> plugin.
// </p>
//
// </body>
// </html>
// ''';
//
// const String kTransparentBackgroundPage = '''
//   <!DOCTYPE html>
//   <html>
//   <head>
//     <title>Transparent background test</title>
//   </head>
//   <style type="text/css">
//     body { background: transparent; margin: 0; padding: 0; }
//     #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
//     #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
//     p { text-align: center; }
//   </style>
//   <body>
//     <div id="container">
//       <p>Transparent background test</p>
//       <div id="shape"></div>
//     </div>
//   </body>
//   </html>
// ''';
//
// const String kLogExamplePage = '''
// <!DOCTYPE html>
// <html lang="en">
// <head>
// <title>Load file or HTML string example</title>
// </head>
// <body onload="console.log('Logging that the page is loading.')">
//
// <h1>Local demo page</h1>
// <p>
//   This page is used to test the forwarding of console logs to Dart.
// </p>
//
// <style>
//     .btn-group button {
//       padding: 24px; 24px;
//       display: block;
//       width: 25%;
//       margin: 5px 0px 0px 0px;
//     }
// </style>
//
// <div class="btn-group">
//     <button onclick="console.error('This is an error message.')">Error</button>
//     <button onclick="console.warn('This is a warning message.')">Warning</button>
//     <button onclick="console.info('This is a info message.')">Info</button>
//     <button onclick="console.debug('This is a debug message.')">Debug</button>
//     <button onclick="console.log('This is a log message.')">Log</button>
// </div>
//
// </body>
// </html>
// ''';
//
// class WebViewExample extends StatefulWidget {
//   const WebViewExample({super.key});
//
//   @override
//   State<WebViewExample> createState() => _WebViewExampleState();
// }
//
// class _WebViewExampleState extends State<WebViewExample> {
//   late final WebViewController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     try {
//       // Enable hybrid composition for WebView on Android
//       WebViewPlatform.instance ??= WebKitWebViewPlatform();
//
//       // #docregion platform_features
//       late final PlatformWebViewControllerCreationParams params;
//       if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//         params = WebKitWebViewControllerCreationParams(
//           allowsInlineMediaPlayback: true,
//           mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//         );
//       } else {
//         params = const PlatformWebViewControllerCreationParams();
//       }
//
//       final WebViewController controller =
//           WebViewController.fromPlatformCreationParams(params);
//       // #enddocregion platform_features
//
//       controller
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..setBackgroundColor(const Color(0x00000000))
//         ..setNavigationDelegate(
//           NavigationDelegate(
//             onProgress: (int progress) {
//               debugPrint('WebView is loading (progress : $progress%)');
//             },
//             onPageStarted: (String url) {
//               debugPrint('Page started loading: $url');
//             },
//             onPageFinished: (String url) {
//               debugPrint('Page finished loading: $url');
//             },
//             onWebResourceError: (WebResourceError error) {
//               debugPrint('''
// Page resource error:
//   code: ${error.errorCode}
//   description: ${error.description}
//   errorType: ${error.errorType}
//   isForMainFrame: ${error.isForMainFrame}
//           ''');
//             },
//             onNavigationRequest: (NavigationRequest request) {
//               if (request.url.startsWith(
//                   'https://example.com/path-to-your-scorm-package/index.html')) {
//                 debugPrint('blocking navigation to ${request.url}');
//                 return NavigationDecision.prevent;
//               }
//               debugPrint('allowing navigation to ${request.url}');
//               return NavigationDecision.navigate;
//             },
//             onHttpError: (HttpResponseError error) {
//               debugPrint(
//                   'Error occurred on page: ${error.response?.statusCode}');
//             },
//             onUrlChange: (UrlChange change) {
//               debugPrint('url change to ${change.url}');
//             },
//             onHttpAuthRequest: (HttpAuthRequest request) {
//               openDialog(request);
//             },
//           ),
//         )
//         ..addJavaScriptChannel(
//           'Toaster',
//           onMessageReceived: (JavaScriptMessage message) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(message.message)),
//             );
//           },
//         )
//         ..loadRequest(Uri.parse(
//             'https://example.com/path-to-your-scorm-package/index.html'));
//
//       // #docregion platform_features
//       if (controller.platform is AndroidWebViewController) {
//         AndroidWebViewController.enableDebugging(true);
//         (controller.platform as AndroidWebViewController)
//             .setMediaPlaybackRequiresUserGesture(false);
//       }
//       // #enddocregion platform_features
//
//       _controller = controller;
//     } catch (e) {
//       print('Catch ---- > ${e.toString()}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         title: const Text('Flutter WebView example'),
//         // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
//         actions: <Widget>[
//           NavigationControls(webViewController: _controller),
//           SampleMenu(webViewController: _controller),
//         ],
//       ),
//       body: WebViewWidget(controller: _controller),
//       floatingActionButton: favoriteButton(),
//     );
//   }
//
//   Widget favoriteButton() {
//     return FloatingActionButton(
//       onPressed: () async {
//         final String? url = await _controller.currentUrl();
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Favorited $url')),
//           );
//         }
//       },
//       child: const Icon(Icons.favorite),
//     );
//   }
//
//   Future<void> openDialog(HttpAuthRequest httpRequest) async {
//     final TextEditingController usernameTextController =
//         TextEditingController();
//     final TextEditingController passwordTextController =
//         TextEditingController();
//
//     return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('${httpRequest.host}: ${httpRequest.realm ?? '-'}'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextField(
//                   decoration: const InputDecoration(labelText: 'Username'),
//                   autofocus: true,
//                   controller: usernameTextController,
//                 ),
//                 TextField(
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   controller: passwordTextController,
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             // Explicitly cancel the request on iOS as the OS does not emit new
//             // requests when a previous request is pending.
//             TextButton(
//               onPressed: () {
//                 httpRequest.onCancel();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 httpRequest.onProceed(
//                   WebViewCredential(
//                     user: usernameTextController.text,
//                     password: passwordTextController.text,
//                   ),
//                 );
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Authenticate'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// enum MenuOptions {
//   showUserAgent,
//   listCookies,
//   clearCookies,
//   addToCache,
//   listCache,
//   clearCache,
//   navigationDelegate,
//   doPostRequest,
//   loadLocalFile,
//   loadFlutterAsset,
//   loadHtmlString,
//   transparentBackground,
//   setCookie,
//   logExample,
//   basicAuthentication,
// }
//
// class SampleMenu extends StatelessWidget {
//   SampleMenu({
//     super.key,
//     required this.webViewController,
//   });
//
//   final WebViewController webViewController;
//   late final WebViewCookieManager cookieManager = WebViewCookieManager();
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<MenuOptions>(
//       key: const ValueKey<String>('ShowPopupMenu'),
//       onSelected: (MenuOptions value) {
//         switch (value) {
//           case MenuOptions.showUserAgent:
//             _onShowUserAgent();
//           case MenuOptions.listCookies:
//             _onListCookies(context);
//           case MenuOptions.clearCookies:
//             _onClearCookies(context);
//           case MenuOptions.addToCache:
//             _onAddToCache(context);
//           case MenuOptions.listCache:
//             _onListCache();
//           case MenuOptions.clearCache:
//             _onClearCache(context);
//           case MenuOptions.navigationDelegate:
//             _onNavigationDelegateExample();
//           case MenuOptions.doPostRequest:
//             _onDoPostRequest();
//           case MenuOptions.loadLocalFile:
//             _onLoadLocalFileExample();
//           case MenuOptions.loadFlutterAsset:
//             _onLoadFlutterAssetExample();
//           case MenuOptions.loadHtmlString:
//             _onLoadHtmlStringExample();
//           case MenuOptions.transparentBackground:
//             _onTransparentBackground();
//           case MenuOptions.setCookie:
//             _onSetCookie();
//           case MenuOptions.logExample:
//             _onLogExample();
//           case MenuOptions.basicAuthentication:
//             _promptForUrl(context);
//         }
//       },
//       itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.showUserAgent,
//           child: Text('Show user agent'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.listCookies,
//           child: Text('List cookies'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.clearCookies,
//           child: Text('Clear cookies'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.addToCache,
//           child: Text('Add to cache'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.listCache,
//           child: Text('List cache'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.clearCache,
//           child: Text('Clear cache'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.navigationDelegate,
//           child: Text('Navigation Delegate example'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.doPostRequest,
//           child: Text('Post Request'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.loadHtmlString,
//           child: Text('Load HTML string'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.loadLocalFile,
//           child: Text('Load local file'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.loadFlutterAsset,
//           child: Text('Load Flutter Asset'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           key: ValueKey<String>('ShowTransparentBackgroundExample'),
//           value: MenuOptions.transparentBackground,
//           child: Text('Transparent background example'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.setCookie,
//           child: Text('Set cookie'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.logExample,
//           child: Text('Log example'),
//         ),
//         const PopupMenuItem<MenuOptions>(
//           value: MenuOptions.basicAuthentication,
//           child: Text('Basic Authentication Example'),
//         ),
//       ],
//     );
//   }
//
//   Future<void> _onShowUserAgent() {
//     // Send a message with the user agent string to the Toaster JavaScript channel we registered
//     // with the WebView.
//     return webViewController.runJavaScript(
//       'Toaster.postMessage("User Agent: " + navigator.userAgent);',
//     );
//   }
//
//   Future<void> _onListCookies(BuildContext context) async {
//     final String cookies = await webViewController
//         .runJavaScriptReturningResult('document.cookie') as String;
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Text('Cookies:'),
//             _getCookieList(cookies),
//           ],
//         ),
//       ));
//     }
//   }
//
//   Future<void> _onAddToCache(BuildContext context) async {
//     await webViewController.runJavaScript(
//       'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";',
//     );
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Added a test entry to cache.'),
//       ));
//     }
//   }
//
//   Future<void> _onListCache() {
//     return webViewController.runJavaScript('caches.keys()'
//         // ignore: missing_whitespace_between_adjacent_strings
//         '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
//         '.then((caches) => Toaster.postMessage(caches))');
//   }
//
//   Future<void> _onClearCache(BuildContext context) async {
//     await webViewController.clearCache();
//     await webViewController.clearLocalStorage();
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Cache cleared.'),
//       ));
//     }
//   }
//
//   Future<void> _onClearCookies(BuildContext context) async {
//     final bool hadCookies = await cookieManager.clearCookies();
//     String message = 'There were cookies. Now, they are gone!';
//     if (!hadCookies) {
//       message = 'There are no cookies.';
//     }
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(message),
//       ));
//     }
//   }
//
//   Future<void> _onNavigationDelegateExample() {
//     final String contentBase64 = base64Encode(
//       const Utf8Encoder().convert(kNavigationExamplePage),
//     );
//     return webViewController.loadRequest(
//       Uri.parse('data:text/html;base64,$contentBase64'),
//     );
//   }
//
//   Future<void> _onSetCookie() async {
//     await cookieManager.setCookie(
//       const WebViewCookie(
//         name: 'foo',
//         value: 'bar',
//         domain: 'httpbin.org',
//         path: '/anything',
//       ),
//     );
//     await webViewController.loadRequest(Uri.parse(
//       'https://example.com/path-to-your-scorm-package/index.html',
//     ));
//   }
//
//   Future<void> _onDoPostRequest() {
//     return webViewController.loadRequest(
//       Uri.parse('https://example.com/path-to-your-scorm-package/index.html'),
//       method: LoadRequestMethod.post,
//       headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
//       body: Uint8List.fromList('Test Body'.codeUnits),
//     );
//   }
//
//   Future<void> _onLoadLocalFileExample() async {
//     final String pathToIndex = await _prepareLocalFile();
//     await webViewController.loadFile(pathToIndex);
//   }
//
//   Future<void> _onLoadFlutterAssetExample() {
//     return webViewController.loadRequest(
//         Uri.parse('https://example.com/path-to-your-scorm-package/index.html'));
//   }
//
//   Future<void> _onLoadHtmlStringExample() {
//     return webViewController.loadHtmlString(kLocalExamplePage);
//   }
//
//   Future<void> _onTransparentBackground() {
//     return webViewController.loadHtmlString(kTransparentBackgroundPage);
//   }
//
//   Widget _getCookieList(String cookies) {
//     if (cookies == '""') {
//       return Container();
//     }
//     final List<String> cookieList = cookies.split(';');
//     final Iterable<Text> cookieWidgets =
//         cookieList.map((String cookie) => Text(cookie));
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: cookieWidgets.toList(),
//     );
//   }
//
//   static Future<String> _prepareLocalFile() async {
//     final String tmpDir = (await getTemporaryDirectory()).path;
//     final File indexFile = File(
//         <String>{tmpDir, 'www', 'index.html'}.join(Platform.pathSeparator));
//
//     await indexFile.create(recursive: true);
//     await indexFile.writeAsString(kLocalExamplePage);
//
//     return indexFile.path;
//   }
//
//   Future<void> _onLogExample() {
//     webViewController
//         .setOnConsoleMessage((JavaScriptConsoleMessage consoleMessage) {
//       debugPrint(
//           '== JS == ${consoleMessage.level.name}: ${consoleMessage.message}');
//     });
//
//     return webViewController.loadHtmlString(kLogExamplePage);
//   }
//
//   Future<void> _promptForUrl(BuildContext context) {
//     final TextEditingController urlTextController = TextEditingController();
//
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Input URL to visit'),
//           content: TextField(
//             decoration: const InputDecoration(labelText: 'URL'),
//             autofocus: true,
//             controller: urlTextController,
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 if (urlTextController.text.isNotEmpty) {
//                   final Uri? uri = Uri.tryParse(urlTextController.text);
//                   if (uri != null && uri.scheme.isNotEmpty) {
//                     webViewController.loadRequest(uri);
//                     Navigator.pop(context);
//                   }
//                 }
//               },
//               child: const Text('Visit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class NavigationControls extends StatelessWidget {
//   const NavigationControls({super.key, required this.webViewController});
//
//   final WebViewController webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () async {
//             if (await webViewController.canGoBack()) {
//               await webViewController.goBack();
//             } else {
//               if (context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('No back history item')),
//                 );
//               }
//             }
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.arrow_forward_ios),
//           onPressed: () async {
//             if (await webViewController.canGoForward()) {
//               await webViewController.goForward();
//             } else {
//               if (context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('No forward history item')),
//                 );
//               }
//             }
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.replay),
//           onPressed: () => webViewController.reload(),
//         ),
//       ],
//     );
//   }
// }
//
// /*
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SCORM Course',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const ScormScreen(),
//     );
//   }
// }
//
// class ScormScreen extends StatefulWidget {
//   const ScormScreen({super.key});
//
//   @override
//   _ScormScreenState createState() => _ScormScreenState();
// }
//
// class _ScormScreenState extends State<ScormScreen> {
//   late WebViewController _controller;
//   bool initialization = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // _webViewController
//     //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     //   ..loadRequest(Uri.parse('http://10.0.2.2:8000/my_scorm_package/index.html'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("SCORM Course")),
//       body: WebView(
//           allowsInlineMediaPlayback: true,
//           gestureNavigationEnabled: true,
//           initialUrl:
//               "https://example.com/path-to-your-scorm-package/index.html",
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller = webViewController;
//           }),
//     );
//   }
// }
// */

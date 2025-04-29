// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import '../utils/image_loader.dart';
//
// class DualImagePreview extends StatefulWidget {
//   final File fabricFile;
//   final String overlayAsset;
//   final double tileScale;
//
//   const DualImagePreview({
//     super.key,
//     required this.fabricFile,
//     required this.overlayAsset,
//     required this.tileScale,
//   });
//
//   @override
//   _DualImagePreviewState createState() => _DualImagePreviewState();
// }
//
// class _DualImagePreviewState extends State<DualImagePreview> {
//   ui.Image? _fabricImage;
//   ui.Image? _overlayImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImages();
//   }
//
//   @override
//   void didUpdateWidget(DualImagePreview oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.fabricFile != widget.fabricFile ||
//         oldWidget.overlayAsset != widget.overlayAsset ||
//         oldWidget.tileScale != widget.tileScale) {
//       _loadImages();
//     }
//   }
//
//   Future<void> _loadImages() async {
//     _fabricImage = await ImageLoader.loadImageFromFile(widget.fabricFile);
//     _overlayImage = await ImageLoader.loadImageFromAssets(widget.overlayAsset);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRect(
//       child: CustomPaint(
//         painter: _DualImagePainter(
//           fabricImage: _fabricImage,
//           overlayImage: _overlayImage,
//           tileScale: widget.tileScale,
//         ),
//         size: const Size(300, 500),
//       ),
//     );
//   }
// }
//
// class _DualImagePainter extends CustomPainter {
//   final ui.Image? fabricImage;
//   final ui.Image? overlayImage;
//   final double tileScale;
//
//   _DualImagePainter({
//     required this.fabricImage,
//     required this.overlayImage,
//     required this.tileScale,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (fabricImage == null) return;
//
//     final paint = Paint();
//
//     // Compute tile size based on scale
//     final double baseTileWidth = fabricImage!.width.toDouble();
//     final double baseTileHeight = fabricImage!.height.toDouble();
//
//     // Map _tileScale to proper range (100 tiles at min, 5x zoom at max)
//     final double tileWidth = (baseTileWidth * tileScale).clamp(size.width / 100, baseTileWidth * 5);
//     final double tileHeight = (baseTileHeight * tileScale).clamp(size.height / 100, baseTileHeight * 5);
//
//     for (double x = 0; x < size.width; x += tileWidth) {
//       for (double y = 0; y < size.height; y += tileHeight) {
//         final destRect = Rect.fromLTWH(x, y, tileWidth, tileHeight);
//         canvas.drawImageRect(
//           fabricImage!,
//           Rect.fromLTWH(0, 0, fabricImage!.width.toDouble(), fabricImage!.height.toDouble()),
//           destRect,
//           paint,
//         );
//       }
//     }
//
//     // Draw overlay, keeping it inside bounds
//     if (overlayImage != null) {
//       final overlayRect = Rect.fromLTWH(0, 0, size.width, size.height);
//       canvas.drawImageRect(
//         overlayImage!,
//         Rect.fromLTWH(0, 0, overlayImage!.width.toDouble(), overlayImage!.height.toDouble()),
//         overlayRect,
//         paint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

































//Final


//
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import '../utils/image_loader.dart';
//
// class DualImagePreview extends StatefulWidget {
//   final File fabricFile;
//   final String overlayAsset;
//   final double tileScale;
//   final Color? tintColor; // New property for tinting
//
//   const DualImagePreview({
//     super.key,
//     required this.fabricFile,
//     required this.overlayAsset,
//     required this.tileScale,
//     this.tintColor,
//   });
//
//   @override
//   _DualImagePreviewState createState() => _DualImagePreviewState();
// }
//
// class _DualImagePreviewState extends State<DualImagePreview> {
//   ui.Image? _fabricImage;
//   ui.Image? _overlayImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImages();
//   }
//
//   @override
//   void didUpdateWidget(DualImagePreview oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.fabricFile != widget.fabricFile ||
//         oldWidget.overlayAsset != widget.overlayAsset ||
//         oldWidget.tileScale != widget.tileScale ||
//         oldWidget.tintColor != widget.tintColor) { // Check tintColor change
//       _loadImages();
//     }
//   }
//
//   Future<void> _loadImages() async {
//     _fabricImage = await ImageLoader.loadImageFromFile(widget.fabricFile);
//     _overlayImage = await ImageLoader.loadImageFromAssets(widget.overlayAsset);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRect(
//       child: CustomPaint(
//         painter: _DualImagePainter(
//           fabricImage: _fabricImage,
//           overlayImage: _overlayImage,
//           tileScale: widget.tileScale,
//           tintColor: widget.tintColor, // Pass tintColor
//         ),
//         size: const Size(300, 500),
//       ),
//     );
//   }
// }
//
// class _DualImagePainter extends CustomPainter {
//   final ui.Image? fabricImage;
//   final ui.Image? overlayImage;
//   final double tileScale;
//   final Color? tintColor; // New field for tinting
//
//   _DualImagePainter({
//     required this.fabricImage,
//     required this.overlayImage,
//     required this.tileScale,
//     this.tintColor,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (fabricImage == null) return;
//
//     // Paint for fabric with optional tint
//     final fabricPaint = Paint();
//     if (tintColor != null) {
//       fabricPaint.colorFilter = ColorFilter.mode(tintColor!, BlendMode.multiply);
//     }
//
//     final double baseTileWidth = fabricImage!.width.toDouble();
//     final double baseTileHeight = fabricImage!.height.toDouble();
//
//     final double tileWidth = (baseTileWidth * tileScale).clamp(size.width / 100, baseTileWidth * 5);
//     final double tileHeight = (baseTileHeight * tileScale).clamp(size.height / 100, baseTileHeight * 5);
//
//     // Draw tiled fabric with tint
//     for (double x = 0; x < size.width; x += tileWidth) {
//       for (double y = 0; y < size.height; y += tileHeight) {
//         canvas.drawImageRect(
//           fabricImage!,
//           Rect.fromLTWH(0, 0, baseTileWidth, baseTileHeight),
//           Rect.fromLTWH(x, y, tileWidth, tileHeight),
//           fabricPaint,
//         );
//       }
//     }
//
//     // Draw overlay without tint
//     if (overlayImage != null) {
//       final overlayPaint = Paint(); // Default paint, no color filter
//       canvas.drawImageRect(
//         overlayImage!,
//         Rect.fromLTWH(0, 0, overlayImage!.width.toDouble(), overlayImage!.height.toDouble()),
//         Rect.fromLTWH(0, 0, size.width, size.height),
//         overlayPaint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
//}



//working///////////////////////////////////
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/image_loader.dart';

class DualImagePreview extends StatefulWidget {
  final File fabricFile;
  final String overlayAsset;
  final double tileScale;
  final Color? tintColor;

  const DualImagePreview({
    super.key,
    required this.fabricFile,
    required this.overlayAsset,
    required this.tileScale,
    this.tintColor,
  });

  @override
  DualImagePreviewState createState() => DualImagePreviewState();
}

class DualImagePreviewState extends State<DualImagePreview> {
  ui.Image? _fabricImage;
  ui.Image? _overlayImage;
  final GlobalKey _repaintBoundaryKey = GlobalKey(); // Key for capturing

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  @override
  void didUpdateWidget(DualImagePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fabricFile != widget.fabricFile ||
        oldWidget.overlayAsset != widget.overlayAsset ||
        oldWidget.tileScale != widget.tileScale ||
        oldWidget.tintColor != widget.tintColor) {
      _loadImages();
    }
  }

  Future<void> _loadImages() async {
    _fabricImage = await ImageLoader.loadImageFromFile(widget.fabricFile);
    _overlayImage = await ImageLoader.loadImageFromAssets(widget.overlayAsset);
    setState(() {});
  }

  // Future<File?> captureImage() async {
  //   try {
  //     RenderRepaintBoundary boundary =
  //     _repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0); // High quality
  //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     if (byteData == null) return null;
  //
  //     final buffer = byteData.buffer.asUint8List();
  //     final directory = await getTemporaryDirectory();
  //     final file = File('${directory.path}/fabric_preview_${DateTime.now().millisecondsSinceEpoch}.png');
  //     await file.writeAsBytes(buffer);
  //     return file;
  //   } catch (e) {
  //     print('Error capturing image: $e');
  //     return null;
  //   }
  // }
  //
  // Future<File?> captureImage() async {
  //   try {
  //     RenderRepaintBoundary boundary =
  //     _repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0); // High quality
  //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  //     if (byteData == null) return null;
  //
  //     final int width = image.width;
  //     final int height = image.height;
  //
  //     // Create a new image with a flipped Y-axis without cropping
  //     final recorder = ui.PictureRecorder();
  //     final canvas = Canvas(recorder);
  //     final paint = Paint();
  //
  //     // Corrected transformation: Move canvas down before flipping
  //     canvas.translate(0, height.toDouble());
  //     canvas.scale(1, -1); // Flip along Y-axis
  //
  //     // Draw the original image onto the canvas
  //     canvas.drawImage(image, Offset(0, 0), paint);
  //
  //     // End recording and create new flipped image
  //     ui.Image flippedImage = await recorder.endRecording().toImage(width, height);
  //
  //     // Convert to PNG and save
  //     ByteData? flippedByteData = await flippedImage.toByteData(format: ui.ImageByteFormat.png);
  //     if (flippedByteData == null) return null;
  //
  //     final buffer = flippedByteData.buffer.asUint8List();
  //     final directory = await getTemporaryDirectory();
  //     final file = File('${directory.path}/fabric_preview_${DateTime.now().millisecondsSinceEpoch}.png');
  //     await file.writeAsBytes(buffer);
  //
  //     return file;
  //   } catch (e) {
  //     print('Error capturing image: $e');
  //     return null;
  //   }
  // }

  Future<File?> captureImage() async {
    try {
      RenderRepaintBoundary boundary =
      _repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // High quality
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final buffer = byteData.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/fabric_preview_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(buffer);

      return file;
    } catch (e) {
      print('Error capturing image: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: RepaintBoundary(
        key: _repaintBoundaryKey, // Assign key for capture
        child: CustomPaint(
          painter: _DualImagePainter(
            fabricImage: _fabricImage,
            overlayImage: _overlayImage,
            tileScale: widget.tileScale,
            tintColor: widget.tintColor,
          ),
          size: const Size(300, 500),
        ),
      ),
    );
  }
}
//
// class _DualImagePainter extends CustomPainter {
//   final ui.Image? fabricImage;
//   final ui.Image? overlayImage;
//   final double tileScale;
//   final Color? tintColor;
//
//   _DualImagePainter({
//     required this.fabricImage,
//     required this.overlayImage,
//     required this.tileScale,
//     this.tintColor,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (fabricImage == null) return;
//
//     final fabricPaint = Paint();
//     if (tintColor != null) {
//       fabricPaint.colorFilter = ColorFilter.mode(tintColor!, BlendMode.multiply);
//     }
//
//     final double baseTileWidth = fabricImage!.width.toDouble();
//     final double baseTileHeight = fabricImage!.height.toDouble();
//
//     final double tileWidth = (baseTileWidth * tileScale).clamp(size.width / 100, baseTileWidth * 5);
//     final double tileHeight = (baseTileHeight * tileScale).clamp(size.height / 100, baseTileHeight * 5);
//
//     for (double x = 0; x < size.width; x += tileWidth) {
//       for (double y = 0; y < size.height; y += tileHeight) {
//         canvas.drawImageRect(
//           fabricImage!,
//           Rect.fromLTWH(0, 0, baseTileWidth, baseTileHeight),
//           Rect.fromLTWH(x, y, tileWidth, tileHeight),
//           fabricPaint,
//         );
//       }
//     }
//
//     if (overlayImage != null) {
//       final overlayPaint = Paint();
//       canvas.drawImageRect(
//         overlayImage!,
//         Rect.fromLTWH(0, 0, overlayImage!.width.toDouble(), overlayImage!.height.toDouble()),
//         Rect.fromLTWH(0, 0, size.width, size.height),
//         overlayPaint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

class _DualImagePainter extends CustomPainter {
  final ui.Image? fabricImage;
  final ui.Image? overlayImage;
  final double tileScale;
  final Color? tintColor;

  _DualImagePainter({
    required this.fabricImage,
    required this.overlayImage,
    required this.tileScale,
    this.tintColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (fabricImage == null) return;

    final fabricPaint = Paint();
    if (tintColor != null && tintColor!.alpha > 0) {
      fabricPaint.colorFilter = ColorFilter.mode(tintColor!, BlendMode.multiply);
    }

    final double baseTileWidth = fabricImage!.width.toDouble();
    final double baseTileHeight = fabricImage!.height.toDouble();

    final double tileWidth = (baseTileWidth * tileScale).clamp(size.width / 100, baseTileWidth * 5);
    final double tileHeight = (baseTileHeight * tileScale).clamp(size.height / 100, baseTileHeight * 5);

    for (double x = 0; x < size.width; x += tileWidth) {
      for (double y = 0; y < size.height; y += tileHeight) {
        canvas.drawImageRect(
          fabricImage!,
          Rect.fromLTWH(0, 0, baseTileWidth, baseTileHeight),
          Rect.fromLTWH(x, y, tileWidth, tileHeight),
          fabricPaint,
        );
      }
    }

    if (overlayImage != null) {
      final overlayPaint = Paint();
      canvas.drawImageRect(
        overlayImage!,
        Rect.fromLTWH(0, 0, overlayImage!.width.toDouble(), overlayImage!.height.toDouble()),
        Rect.fromLTWH(0, 0, size.width, size.height),
        overlayPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
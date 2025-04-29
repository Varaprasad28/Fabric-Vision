// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//
//   Future<void> _pickFabricImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _fabricFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Fabric Pattern Tiler')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SizedBox(
//                 width: 300,
//                 height: 500,
//                 child: DualImagePreview(
//                   fabricFile: _fabricFile!,
//                   overlayAsset: _selectedOverlay,
//                   tileScale: _tileScale,
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01, // Adjusted to avoid extreme small values
//               max: 5.0,  // Zooms up to 5x
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//             ),
//             ElevatedButton(
//               onPressed: _pickFabricImage,
//               child: const Text('Upload Fabric Texture'),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//
//   Future<void> _pickAndCropFabricImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Fabric Pattern Tiler')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SizedBox(
//                 width: 300,
//                 height: 500,
//                 child: DualImagePreview(
//                   fabricFile: _fabricFile!,
//                   overlayAsset: _selectedOverlay,
//                   tileScale: _tileScale,
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//             ),
//             ElevatedButton(
//               onPressed: _pickAndCropFabricImage,
//               child: const Text('Upload & Crop Fabric Texture'),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


















//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FabricVision')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SizedBox(
//                 width: 300,
//                 height: 500,
//                 child: DualImagePreview(
//                   fabricFile: _fabricFile!,
//                   overlayAsset: _selectedOverlay,
//                   tileScale: _tileScale,
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



















//rbg



//
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//   Color? _selectedColor; // State variable for selected color
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FabricVision')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 300,
//                     height: 500,
//                     child: DualImagePreview(
//                       fabricFile: _fabricFile!,
//                       overlayAsset: _selectedOverlay,
//                       tileScale: _tileScale,
//                       tintColor: _selectedColor, // Pass selected color
//                     ),
//                   ),
//                   Container(
//                     width: 100,
//                     child: ColorPaletteWidget(
//                       selectedColor: _selectedColor,
//                       onColorSelected: (color) {
//                         setState(() {
//                           _selectedColor = color;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
























///RGB
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png';
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FabricVision')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 300,
//                       height: 500,
//                       child: DualImagePreview(
//                         fabricFile: _fabricFile!,
//                         overlayAsset: _selectedOverlay,
//                         tileScale: _tileScale,
//                         tintColor: _selectedColor,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextButton(
//                             onPressed: () => setState(() => _selectedColor = null),
//                             child: const Text('Reset Color'),
//                           ),
//                           ColorPicker(
//                             height: 300, // Match preview height for consistency
//                             onColorChanged: (color) => setState(() => _selectedColor = color),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



























// //working
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png';
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FabricVision')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 300,
//                       height: 500,
//                       child: DualImagePreview(
//                         fabricFile: _fabricFile!,
//                         overlayAsset: _selectedOverlay,
//                         tileScale: _tileScale,
//                         tintColor: _selectedColor,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () => setState(() => _selectedColor = null),
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png', label: 'Male Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png', label: 'Female Shirt', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png', label: 'Trouser', onPressed: _setOverlayImage),
//                 OverlayButton(asset: 'Suit.png', label: 'Suit', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png', label: 'Female Kurthi', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png', label: 'Nehru Jacket', onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png', label: 'Female Dress', onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart'; // Import share_plus
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png';
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   final _previewKey = GlobalKey<DualImagePreviewState>(); // Add GlobalKey
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FabricVision')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: DualImagePreview(
//                             key: _previewKey, // Assign the key
//                             fabricFile: _fabricFile!,
//                             overlayAsset: _selectedOverlay,
//                             tileScale: _tileScale,
//                             tintColor: _selectedColor,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: IconButton(
//                             icon: const Icon(Icons.share, color: Colors.black),
//                             onPressed: () async {
//                               final state = _previewKey.currentState;
//                               if (state != null) {
//                                 final file = await state.captureImage();
//                                 if (file != null) {
//                                   await Share.shareFiles(
//                                     [file.path],
//                                     text: 'Check out this fabric preview!',
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () => setState(() => _selectedColor = null),
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
// import 'favorites_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png';
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//
//   Future<void> _saveToFavorites() async {
//     if (_fabricFile != null) {
//       final favorite = FavoriteDesign(
//         fabricPath: _fabricFile!.path,
//         overlayAsset: _selectedOverlay,
//       );
//       await _favoritesService.saveFavorite(favorite);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Saved to Favorites!')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Select fabric first')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen(favorites: [],)),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: DualImagePreview(
//                             key: _previewKey,
//                             fabricFile: _fabricFile!,
//                             overlayAsset: _selectedOverlay,
//                             tileScale: _tileScale,
//                             tintColor: _selectedColor,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: IconButton(
//                             icon: const Icon(Icons.share, color: Colors.black),
//                             onPressed: () async {
//                               final state = _previewKey.currentState;
//                               if (state != null) {
//                                 final file = await state.captureImage();
//                                 if (file != null) {
//                                   await Share.shareFiles(
//                                     [file.path],
//                                     text: 'Check out this fabric preview!',
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () => setState(() => _selectedColor = null),
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage),
//               ],
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: _saveToFavorites,
//               icon: const Icon(Icons.favorite, color: Colors.red),
//               label: const Text('Save to Favorites'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
// import 'favorites_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png';
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   bool _isFavorite = false;
//   FavoriteDesign? _currentFavorite;
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//         });
//       }
//     }
//   }
//
//   Future<void> _toggleFavorite() async {
//     if (_isFavorite) {
//       // Remove from favorites
//       if (_currentFavorite != null) {
//         await _favoritesService.removeFavorite(_currentFavorite!); // Your service to remove favorites
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Removed from Favorites')),
//         );
//       }
//     } else {
//       // Save to favorites
//       if (_fabricFile != null) {
//         final state = _previewKey.currentState;
//         if (state != null) {
//           final tempFile = await state.captureImage(); // Capture the current preview
//           if (tempFile != null) {
//             final appDir = await getApplicationDocumentsDirectory();
//             final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//             final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//             await tempFile.copy(thumbnailPath);
//             await tempFile.delete();
//
//             final favorite = FavoriteDesign(
//               fabricPath: _fabricFile!.path,
//               overlayAsset: _selectedOverlay,
//               thumbnailPath: thumbnailPath,
//               tileScale: _tileScale,
//               tintColor: _selectedColor,
//             );
//             await _favoritesService.saveFavorite(favorite); // Your service to save favorites
//             setState(() {
//               _isFavorite = true;
//               _currentFavorite = favorite;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Saved to Favorites!')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Select fabric first')),
//         );
//       }
//     }
//   }
//
//
//   Color? get selectedColor => _selectedColor;
//   set selectedColor(Color? value) {
//     if (_selectedColor != value) {
//       _selectedColor = value;
//       if (_isFavorite) {
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//       }
//     }
//   }
//
//
//   double get tileScale => _tileScale;
//   set tileScale(double value) {
//     if (_tileScale != value) {
//       _tileScale = value;
//       if (_isFavorite) {
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//       }
//     }
//   }
//
//
//   String get selectedOverlay => _selectedOverlay;
//   set selectedOverlay(String value) {
//     if (_selectedOverlay != value) {
//       _selectedOverlay = value;
//       if (_isFavorite) {
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//       }
//     }
//   }
//
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//     });
//   }
//   Future<void> _saveToFavorites() async {
//     if (_fabricFile != null) {
//       final state = _previewKey.currentState;
//       if (state != null) {
//         // Capture the combined image from the preview widget
//         final tempFile = await state.captureImage();
//         if (tempFile != null) {
//           // Save the thumbnail to the app's documents directory
//           final appDir = await getApplicationDocumentsDirectory();
//           final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//           final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//           await tempFile.copy(thumbnailPath);
//           await tempFile.delete(); // Clean up temporary file
//
//           // Create the FavoriteDesign object with all data
//           final favorite = FavoriteDesign(
//             fabricPath: _fabricFile!.path,
//             overlayAsset: _selectedOverlay,
//             thumbnailPath: thumbnailPath,
//             tileScale: _tileScale,      // Include current scale
//             tintColor: _selectedColor,  // Include current color
//           );
//
//           // Save to favorites via service
//           await _favoritesService.saveFavorite(favorite);
//
//           // Show confirmation
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Saved to Favorites!')),
//           );
//         }
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a fabric first')),
//       );
//     }
//   }
//   // Future<void> _saveToFavorites() async {
//   //   if (_fabricFile != null) {
//   //     final state = _previewKey.currentState; // Assuming _previewKey is a GlobalKey<DualImagePreviewState>
//   //     if (state != null) {
//   //       // Capture the combined image from DualImagePreview
//   //       final tempFile = await state.captureImage();
//   //       if (tempFile != null) {
//   //         // Get the app's documents directory for persistent storage
//   //         final appDir = await getApplicationDocumentsDirectory();
//   //         final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//   //         final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//   //
//   //         // Copy the temporary file to the documents directory
//   //         await tempFile.copy(thumbnailPath);
//   //         await tempFile.delete(); // Clean up the temporary file
//   //
//   //         // Create and save the favorite design
//   //         final favorite = FavoriteDesign(
//   //           fabricPath: _fabricFile!.path,
//   //           overlayAsset: _selectedOverlay,
//   //           thumbnailPath: thumbnailPath,
//   //         );
//   //         await _favoritesService.saveFavorite(favorite);
//   //
//   //         // Show success message
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           const SnackBar(content: Text('Saved to Favorites!')),
//   //         );
//   //       }
//   //     }
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Select fabric first')),
//   //     );
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border), // Button to open favorites
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               ).then((selectedFavorite) {
//                 if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
//                   setState(() {
//                     _fabricFile = File(selectedFavorite.fabricPath);
//                     _selectedOverlay = selectedFavorite.overlayAsset;
//                     _tileScale = selectedFavorite.tileScale;
//                     _selectedColor = selectedFavorite.tintColor;
//                     _isFavorite = true; // Show red icon for loaded favorite
//                     _currentFavorite = selectedFavorite;
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: DualImagePreview(
//                             key: _previewKey,
//                             fabricFile: _fabricFile!,
//                             overlayAsset: _selectedOverlay,
//                             tileScale: _tileScale,
//                             tintColor: _selectedColor,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: IconButton(
//                             icon: const Icon(Icons.share, color: Colors.black),
//                             onPressed: () async {
//                               final state = _previewKey.currentState;
//                               if (state != null) {
//                                 final file = await state.captureImage();
//                                 if (file != null) {
//                                   await Share.shareFiles(
//                                     [file.path],
//                                     text: 'Check out this fabric preview!',
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () => setState(() => _selectedColor = null),
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) => setState(() => _tileScale = value),
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage),
//               ],
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: _saveToFavorites,
//               icon: const Icon(Icons.favorite, color: Colors.red),
//               label: const Text('Save to Favorites'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
// import 'favorites_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   final File? fabricFile;
//   const HomeScreen({super.key, this.fabricFile});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   bool _isFavorite = false; // Tracks if the current design is a favorite
//   FavoriteDesign? _currentFavorite; // Stores the current saved favorite design
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//
//
//
//   // Pick and crop fabric image
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//           _onDesignChanged(); // Reset favorite status if design changes
//         });
//       }
//     }
//   }
//
//   // Set overlay image and reset favorite status if changed
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//       _onDesignChanged();
//     });
//   }
//
//   // Save or remove design from favorites
//   Future<void> _toggleFavorite() async {
//     if (_isFavorite) {
//       // Remove from favorites
//       if (_currentFavorite != null) {
//         await _favoritesService.removeFavorite(_currentFavorite!);
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Removed from Favorites')),
//         );
//       }
//     } else {
//       // Save to favorites
//       if (_fabricFile != null) {
//         final state = _previewKey.currentState;
//         if (state != null) {
//           final tempFile = await state.captureImage();
//           if (tempFile != null) {
//             final appDir = await getApplicationDocumentsDirectory();
//             final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//             final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//             await tempFile.copy(thumbnailPath);
//             await tempFile.delete();
//
//             final favorite = FavoriteDesign(
//               fabricPath: _fabricFile!.path,
//               overlayAsset: _selectedOverlay,
//               thumbnailPath: thumbnailPath,
//               tileScale: _tileScale,
//               tintColor: _selectedColor,
//             );
//             await _favoritesService.saveFavorite(favorite);
//             setState(() {
//               _isFavorite = true;
//               _currentFavorite = favorite;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Saved to Favorites!')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Select fabric first')),
//         );
//       }
//     }
//   }
//
//   // Reset favorite status when design is modified
//   void _onDesignChanged() {
//     if (_isFavorite) {
//       setState(() {
//         _isFavorite = false;
//         _currentFavorite = null;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               ).then((selectedFavorite) {
//                 if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
//                   setState(() {
//                     _fabricFile = File(selectedFavorite.fabricPath);
//                     _selectedOverlay = selectedFavorite.overlayAsset;
//                     _tileScale = selectedFavorite.tileScale;
//                     _selectedColor = selectedFavorite.tintColor;
//                     _isFavorite = true; // Set to true when loading from favorites
//                     _currentFavorite = selectedFavorite;
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       alignment: Alignment.bottomRight, // Position button at bottom-right
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: DualImagePreview(
//                             key: _previewKey,
//                             fabricFile: _fabricFile!,
//                             overlayAsset: _selectedOverlay,
//                             tileScale: _tileScale,
//                             tintColor: _selectedColor,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.favorite,
//                               color: _isFavorite ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: _toggleFavorite,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: IconButton(
//                             icon: const Icon(Icons.share, color: Colors.black),
//                             onPressed: () async {
//                               final state = _previewKey.currentState;
//                               if (state != null) {
//                                 final file = await state.captureImage();
//                                 if (file != null) {
//                                   await Share.shareFiles(
//                                     [file.path],
//                                     text: 'Check out this fabric preview!',
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _selectedColor = null;
//                               _onDesignChanged();
//                             });
//                           },
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                               _onDesignChanged();
//                             });
//                           },
//                           currentColor: _selectedColor, // Sync with loaded favorite
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) {
//                 setState(() {
//                   _tileScale = value;
//                   _onDesignChanged();
//                 });
//               },
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   child: const Text('Upload from Gallery'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                   child: const Text('Capture from Camera'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import '../widgets/dual_image_preview.dart';
// import '../widgets/overlay_button.dart';
// import '../widgets/color_picker_widget.dart';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
// import 'favorites_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   final File? fabricFile;
//   const HomeScreen({super.key, this.fabricFile});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   bool _isFavorite = false; // Tracks if the current design is a favorite
//   FavoriteDesign? _currentFavorite; // Stores the current saved favorite design
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//
//   @override
//   void initState() {
//     super.initState();
//     _fabricFile = widget.fabricFile; // Initialize with the passed image
//   }
//
//   // Pick and crop fabric image
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//           _onDesignChanged(); // Reset favorite status if design changes
//         });
//       }
//     }
//   }
//
//   // Set overlay image and reset favorite status if changed
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//       _onDesignChanged();
//     });
//   }
//
//   // Save or remove design from favorites
//   Future<void> _toggleFavorite() async {
//     if (_isFavorite) {
//       // Remove from favorites
//       if (_currentFavorite != null) {
//         await _favoritesService.removeFavorite(_currentFavorite!);
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Removed from Favorites')),
//         );
//       }
//     } else {
//       // Save to favorites
//       if (_fabricFile != null) {
//         final state = _previewKey.currentState;
//         if (state != null) {
//           final tempFile = await state.captureImage();
//           if (tempFile != null) {
//             final appDir = await getApplicationDocumentsDirectory();
//             final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//             final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//             await tempFile.copy(thumbnailPath);
//             await tempFile.delete();
//
//             final favorite = FavoriteDesign(
//               fabricPath: _fabricFile!.path,
//               overlayAsset: _selectedOverlay,
//               thumbnailPath: thumbnailPath,
//               tileScale: _tileScale,
//               tintColor: _selectedColor,
//             );
//             await _favoritesService.saveFavorite(favorite);
//             setState(() {
//               _isFavorite = true;
//               _currentFavorite = favorite;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Saved to Favorites!')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Select fabric first')),
//         );
//       }
//     }
//   }
//
//   // Reset favorite status when design is modified
//   void _onDesignChanged() {
//     if (_isFavorite) {
//       setState(() {
//         _isFavorite = false;
//         _currentFavorite = null;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               ).then((selectedFavorite) {
//                 if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
//                   setState(() {
//                     _fabricFile = File(selectedFavorite.fabricPath);
//                     _selectedOverlay = selectedFavorite.overlayAsset;
//                     _tileScale = selectedFavorite.tileScale;
//                     _selectedColor = selectedFavorite.tintColor;
//                     _isFavorite = true; // Set to true when loading from favorites
//                     _currentFavorite = selectedFavorite;
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_fabricFile != null)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       alignment: Alignment.bottomRight, // Position button at bottom-right
//                       children: [
//                         SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: DualImagePreview(
//                             key: _previewKey,
//                             fabricFile: _fabricFile!,
//                             overlayAsset: _selectedOverlay,
//                             tileScale: _tileScale,
//                             tintColor: _selectedColor,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.favorite,
//                               color: _isFavorite ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: _toggleFavorite,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: IconButton(
//                             icon: const Icon(Icons.share, color: Colors.black),
//                             onPressed: () async {
//                               final state = _previewKey.currentState;
//                               if (state != null) {
//                                 final file = await state.captureImage();
//                                 if (file != null) {
//                                   await Share.shareFiles(
//                                     [file.path],
//                                     text: 'Check out this fabric preview!',
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _selectedColor = null;
//                               _onDesignChanged();
//                             });
//                           },
//                           child: const Text('Reset Color'),
//                         ),
//                         ColorPicker(
//                           height: 430,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _selectedColor = color;
//                               _onDesignChanged();
//                             });
//                           },
//                           currentColor: _selectedColor, // Sync with loaded favorite
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             Slider(
//               value: _tileScale,
//               min: 0.01,
//               max: 5.0,
//               divisions: 200,
//               onChanged: (value) {
//                 setState(() {
//                   _tileScale = value;
//                   _onDesignChanged();
//                 });
//               },
//               label: _tileScale.toStringAsFixed(2),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _gradientButton(
//                   text: 'Upload from Gallery',
//                   onPressed: () => _pickFabricImage(ImageSource.gallery),
//                 ),
//                 const SizedBox(width: 10),
//                 _gradientButton(
//                   text: 'Capture from Camera',
//                   onPressed: () => _pickFabricImage(ImageSource.camera),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage),
//                 OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _gradientButton({required String text, required VoidCallback onPressed}) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [Colors.pink, Colors.blue]),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import '../widgets/dual_image_preview.dart'; // Ensure this widget exists
// import '../widgets/overlay_button.dart';     // Ensure this widget exists
// import '../widgets/color_picker_widget.dart'; // Ensure this widget exists
// import '../services/favorites_service.dart';  // Ensure this service exists
// import '../models/favorite_design.dart';     // Ensure this model exists
// import 'favorites_screen.dart';             // Ensure this screen exists
//
// class HomeScreen extends StatefulWidget {
//   final File? fabricFile;
//   const HomeScreen({super.key, this.fabricFile});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   bool _isFavorite = false;
//   FavoriteDesign? _currentFavorite;
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _fabricFile = widget.fabricFile;
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // Pick and crop fabric image
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.deepPurple,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: true),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//           _onDesignChanged();
//           _animationController.forward(from: 0);
//         });
//       }
//     }
//   }
//
//   // Set overlay image
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//       _onDesignChanged();
//     });
//   }
//
//   // Toggle favorite status
//   Future<void> _toggleFavorite() async {
//     if (_isFavorite) {
//       if (_currentFavorite != null) {
//         await _favoritesService.removeFavorite(_currentFavorite!);
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Removed from Favorites')),
//         );
//       }
//     } else {
//       if (_fabricFile != null) {
//         final state = _previewKey.currentState;
//         if (state != null) {
//           final tempFile = await state.captureImage();
//           if (tempFile != null) {
//             final appDir = await getApplicationDocumentsDirectory();
//             final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//             final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//             await tempFile.copy(thumbnailPath);
//             await tempFile.delete();
//
//             final favorite = FavoriteDesign(
//               fabricPath: _fabricFile!.path,
//               overlayAsset: _selectedOverlay,
//               thumbnailPath: thumbnailPath,
//               tileScale: _tileScale,
//               tintColor: _selectedColor,
//             );
//             await _favoritesService.saveFavorite(favorite);
//             setState(() {
//               _isFavorite = true;
//               _currentFavorite = favorite;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Saved to Favorites!')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Select fabric first')),
//         );
//       }
//     }
//   }
//
//   // Reset favorite status on design change
//   void _onDesignChanged() {
//     if (_isFavorite) {
//       setState(() {
//         _isFavorite = false;
//         _currentFavorite = null;
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             color: Colors.white,
//             tooltip: 'View Favorites',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               ).then((selectedFavorite) {
//                 if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
//                   setState(() {
//                     _fabricFile = File(selectedFavorite.fabricPath);
//                     _selectedOverlay = selectedFavorite.overlayAsset;
//                     _tileScale = selectedFavorite.tileScale;
//                     _selectedColor = selectedFavorite.tintColor;
//                     _isFavorite = true;
//                     _currentFavorite = selectedFavorite;
//                     _animationController.forward(from: 0);
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.deepPurple.shade50, Colors.pink.shade50],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // New Row layout for preview and color picker
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Fabric Preview Section
//                   Expanded(
//                     flex: 3,
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: _fabricFile != null
//                           ? Container(
//                         height: screenSize.height * 0.5,
//
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.deepPurple, width: 2),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           alignment: Alignment.bottomRight,
//                           children: [
//                             DualImagePreview(
//                               key: _previewKey,
//                               fabricFile: _fabricFile!,
//                               overlayAsset: _selectedOverlay,
//                               tileScale: _tileScale,
//                               tintColor: _selectedColor,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.favorite,
//                                   color: _isFavorite ? Colors.red : Colors.grey,
//                                   size: 30,
//                                 ),
//                                 tooltip: _isFavorite ? 'Remove Favorite' : 'Add to Favorites',
//                                 onPressed: _toggleFavorite,
//                               ),
//                             ),
//                             Positioned(
//                               top: 10,
//                               right: 10,
//                               child: IconButton(
//                                 icon: const Icon(Icons.share, color: Colors.deepPurple),
//                                 tooltip: 'Share Design',
//                                 onPressed: () async {
//                                   final state = _previewKey.currentState;
//                                   if (state != null) {
//                                     final file = await state.captureImage();
//                                     if (file != null) {
//                                       await Share.shareFiles(
//                                         [file.path],
//                                         text: 'Check out my fabric design!',
//                                       );
//                                     }
//                                   }
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                           : Container(
//                         height: screenSize.height * 0.5,
//                         width: screenSize.width * 0.4,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Upload a fabric to start!',
//                             style: TextStyle(fontSize: 18, color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Color Picker and Reset Button Section
//                   if (_fabricFile != null)
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 30.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: double.infinity,
//                               height: screenSize.height * 0.4,
//                               child: ColorPicker(
//                                 height: screenSize.height * 0.6,
//                                 onColorChanged: (color) {
//                                   setState(() {
//                                     _selectedColor = color;
//                                     _onDesignChanged();
//                                   });
//                                 },
//                                 currentColor: _selectedColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             _gradientButton(
//                               text: 'Reset Color',
//                               onPressed: () {
//                                 setState(() {
//                                   _selectedColor = null;
//                                   _onDesignChanged();
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               // Tile Scale Slider
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Tile Scale:', style: TextStyle(fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     width: screenSize.width * 0.6,
//                     child: Slider(
//                       value: _tileScale,
//                       min: 0.01,
//                       max: 5.0,
//                       divisions: 200,
//                       activeColor: Colors.deepPurple,
//                       onChanged: (value) {
//                         setState(() {
//                           _tileScale = value;
//                           _onDesignChanged();
//                         });
//                       },
//                       label: _tileScale.toStringAsFixed(2),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Upload Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _gradientButton(
//                     text: 'Gallery',
//                     onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   ),
//                   const SizedBox(width: 20),
//                   _gradientButton(
//                     text: 'Camera',
//                     onPressed: () => _pickFabricImage(ImageSource.camera),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Overlay Buttons
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   // Custom Gradient Button Widget
//   Widget _gradientButton({required String text, required VoidCallback onPressed}) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Colors.deepPurple, Colors.pink],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import '../widgets/dual_image_preview.dart'; // Ensure this widget exists
// import '../widgets/overlay_button.dart';     // Ensure this widget exists
// import '../widgets/color_picker_widget.dart'; // Ensure this widget exists
// import '../services/favorites_service.dart';  // Ensure this service exists
// import '../models/favorite_design.dart';     // Ensure this model exists
// import 'favorites_screen.dart';             // Ensure this screen exists
//
// class HomeScreen extends StatefulWidget {
//   final File? fabricFile;
//   const HomeScreen({super.key, this.fabricFile});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   File? _fabricFile;
//   String _selectedOverlay = 'M_Shirt.png'; // Default overlay
//   double _tileScale = 1.0;
//   Color? _selectedColor;
//   bool _isFavorite = false;
//   FavoriteDesign? _currentFavorite;
//   final _previewKey = GlobalKey<DualImagePreviewState>();
//   final FavoritesService _favoritesService = FavoritesService();
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _fabricFile = widget.fabricFile;
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // Pick and crop fabric image
//   Future<void> _pickFabricImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: pickedFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.deepPurple,
//             toolbarWidgetColor: Colors.white,
//             lockAspectRatio: true,
//           ),
//           IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: true),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _fabricFile = File(croppedFile.path);
//           _onDesignChanged();
//           _animationController.forward(from: 0);
//         });
//       }
//     }
//   }
//
//   // Set overlay image
//   void _setOverlayImage(String overlay) {
//     setState(() {
//       _selectedOverlay = overlay;
//       _onDesignChanged();
//     });
//   }
//
//   // Toggle favorite status
//   Future<void> _toggleFavorite() async {
//     if (_isFavorite) {
//       if (_currentFavorite != null) {
//         await _favoritesService.removeFavorite(_currentFavorite!);
//         setState(() {
//           _isFavorite = false;
//           _currentFavorite = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Removed from Favorites')),
//         );
//       }
//     } else {
//       if (_fabricFile != null) {
//         final state = _previewKey.currentState;
//         if (state != null) {
//           final tempFile = await state.captureImage();
//           if (tempFile != null) {
//             final appDir = await getApplicationDocumentsDirectory();
//             final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
//             final thumbnailPath = '${appDir.path}/$thumbnailFileName';
//             await tempFile.copy(thumbnailPath);
//             await tempFile.delete();
//
//             final favorite = FavoriteDesign(
//               fabricPath: _fabricFile!.path,
//               overlayAsset: _selectedOverlay,
//               thumbnailPath: thumbnailPath,
//               tileScale: _tileScale,
//               tintColor: _selectedColor,
//             );
//             await _favoritesService.saveFavorite(favorite);
//             setState(() {
//               _isFavorite = true;
//               _currentFavorite = favorite;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Saved to Favorites!')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Select fabric first')),
//         );
//       }
//     }
//   }
//
//   // Reset favorite status on design change
//   void _onDesignChanged() {
//     if (_isFavorite) {
//       setState(() {
//         _isFavorite = false;
//         _currentFavorite = null;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FabricVision', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             color: Colors.white,
//             tooltip: 'View Favorites',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               ).then((selectedFavorite) {
//                 if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
//                   setState(() {
//                     _fabricFile = File(selectedFavorite.fabricPath);
//                     _selectedOverlay = selectedFavorite.overlayAsset;
//                     _tileScale = selectedFavorite.tileScale;
//                     _selectedColor = selectedFavorite.tintColor;
//                     _isFavorite = true;
//                     _currentFavorite = selectedFavorite;
//                     _animationController.forward(from: 0);
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.deepPurple.shade50!, Colors.pink.shade50!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // New Row layout for preview and color picker
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Fabric Preview Section
//                   Expanded(
//                     flex: 2,
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: _fabricFile != null
//                           ? Container(
//                         height: screenSize.height * 0.5,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.deepPurple, width: 2),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           alignment: Alignment.bottomRight,
//                           children: [
//                             DualImagePreview(
//                               key: _previewKey,
//                               fabricFile: _fabricFile!,
//                               overlayAsset: _selectedOverlay,
//                               tileScale: _tileScale,
//                               tintColor: _selectedColor,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: IconButton(
//                                 icon: Icon(
//                                   Icons.favorite,
//                                   color: _isFavorite ? Colors.red : Colors.grey,
//                                   size: 30,
//                                 ),
//                                 tooltip: _isFavorite ? 'Remove Favorite' : 'Add to Favorites',
//                                 onPressed: _toggleFavorite,
//                               ),
//                             ),
//                             Positioned(
//                               top: 10,
//                               right: 10,
//                               child: IconButton(
//                                 icon: const Icon(Icons.share, color: Colors.deepPurple),
//                                 tooltip: 'Share Design',
//                                 onPressed: () async {
//                                   final state = _previewKey.currentState;
//                                   if (state != null) {
//                                     final file = await state.captureImage();
//                                     if (file != null) {
//                                       await Share.shareFiles(
//                                         [file.path],
//                                         text: 'Check out my fabric design!',
//                                       );
//                                     }
//                                   }
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                           : Container(
//                         height: screenSize.height * 0.5,
//                         width: screenSize.width * 0.4,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Upload a fabric to start!',
//                             style: TextStyle(fontSize: 18, color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Color Picker and Reset Button Section
//                   if (_fabricFile != null)
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 30.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: double.infinity,
//                               height: screenSize.height * 0.4,
//                               child: ColorPicker(
//                                 height: screenSize.height * 0.6,
//                                 onColorChanged: (color) {
//                                   setState(() {
//                                     _selectedColor = color;
//                                     _onDesignChanged();
//                                   });
//                                 },
//                                 currentColor: _selectedColor,
//                               ),
//                             ),
//                             const SizedBox(height: 20), // Added space between color picker and reset button
//                             _gradientButton(
//                               text: 'Reset Color',
//                               onPressed: () {
//                                 setState(() {
//                                   _selectedColor = null;
//                                   _onDesignChanged();
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               // Tile Scale Slider
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Tile Scale:', style: TextStyle(fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     width: screenSize.width * 0.6,
//                     child: Slider(
//                       value: _tileScale,
//                       min: 0.01,
//                       max: 5.0,
//                       divisions: 200,
//                       activeColor: Colors.deepPurple,
//                       onChanged: (value) {
//                         setState(() {
//                           _tileScale = value;
//                           _onDesignChanged();
//                         });
//                       },
//                       label: _tileScale.toStringAsFixed(2),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Upload Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _gradientButton(
//                     text: 'Gallery',
//                     onPressed: () => _pickFabricImage(ImageSource.gallery),
//                   ),
//                   const SizedBox(width: 20),
//                   _gradientButton(
//                     text: 'Camera',
//                     onPressed: () => _pickFabricImage(ImageSource.camera),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Overlay Buttons
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   OverlayButton(
//                     asset: 'M_Shirt.png',
//                     label: 'Male Shirt',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_Shirt.png',
//                     label: 'Female Shirt',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Trouser.png',
//                     label: 'Trouser',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Suit.png',
//                     label: 'Suit',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_kurthi.png',
//                     label: 'Female Kurthi',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'Nehru_Jacket.png',
//                     label: 'Nehru Jacket',
//                     onPressed: _setOverlayImage,
//                   ),
//                   OverlayButton(
//                     asset: 'F_Dress.png',
//                     label: 'Female Dress',
//                     onPressed: _setOverlayImage,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Custom Gradient Button Widget
//   Widget _gradientButton({required String text, required VoidCallback onPressed}) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Colors.deepPurple, Colors.pink],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/dual_image_preview.dart'; // Ensure this widget exists
import '../widgets/overlay_button.dart';     // Ensure this widget exists
import '../widgets/color_picker_widget.dart'; // Ensure this widget exists
import '../services/favorites_service.dart';  // Ensure this service exists
import '../models/favorite_design.dart';     // Ensure this model exists
import 'favorites_screen.dart';             // Ensure this screen exists
import '../services/api_service.dart';
import 'recent_screen.dart';

class HomeScreen extends StatefulWidget {
  final File? fabricFile;
  const HomeScreen({super.key, this.fabricFile});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  File? _fabricFile;
  String _selectedOverlay = 'M_Shirt.png'; // Default overlay
  double _tileScale = 1.0;
  Color? _selectedColor;
  bool _isFavorite = false;
  FavoriteDesign? _currentFavorite;
  final _previewKey = GlobalKey<DualImagePreviewState>();
  final FavoritesService _favoritesService = FavoritesService();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> _garmentTypes = [
    {'label': 'Male Shirt', 'asset': 'M_Shirt.png'},
    {'label': 'Female Shirt', 'asset': 'F_Shirt.png'},
    {'label': 'Trouser', 'asset': 'Trouser.png'},
    {'label': 'Suit', 'asset': 'Suit.png'},
    {'label': 'Female Kurthi', 'asset': 'F_kurthi.png'},
    {'label': 'Nehru Jacket', 'asset': 'Nehru_Jacket.png'},
    {'label': 'Female Dress', 'asset': 'F_Dress.png'},
  ];
  @override
  void initState() {
    super.initState();
    _fabricFile = widget.fabricFile;
    saveToRecents(_fabricFile!);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Pick and crop fabric image
  Future<void> _pickFabricImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepPurple,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: true,
          ),
          IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: true),
        ],
      );
      if (croppedFile != null && mounted) {
        final newFile = File(croppedFile.path);
        setState(() {
          _fabricFile = newFile;
          _animationController.forward(from: 0);
        });
        await saveToRecents(newFile); // Save to Recents after updating
      }
    }
  }

  Future<void> _showPromptDialog(BuildContext context) async {
    final TextEditingController promptController = TextEditingController();
    String? selectedStyle;
    List<String> selectedColors = [];

    // Helper function to map color names to Flutter Colors
    Color _getColorFromName(String colorName) {
      switch (colorName.toLowerCase()) {
        case 'red': return Colors.red;
        case 'blue': return Colors.blue;
        case 'yellow': return Colors.yellow;
        case 'green': return Colors.green;
        case 'pink': return Colors.pink;
        case 'maroon': return Colors.red[900]!;
        case 'beige': return Colors.brown[100]!;
        case 'black': return Colors.black;
        case 'indigo': return Colors.indigo;
        case 'cream': return Colors.yellow[50]!;
        case 'turquoise': return Colors.teal;
        case 'orange': return Colors.orange;
        case 'mustard': return Colors.yellow[700]!;
        case 'gold': return Colors.amber;
        case 'purple': return Colors.purple;
        case 'white': return Colors.white;
        case 'brown': return Colors.brown;
        default: return Colors.grey;
      }
    }


    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Enter Your Prompt'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center, // Center all children horizontally
              children: [
                TextField(
                  controller: promptController,
                  decoration: const InputDecoration(
                    hintText: 'e.g., A pattern or color',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Select a Style:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 18,
                  runSpacing: 18,
                  children: stylePrompts.keys.map((style) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (selectedStyle == style) {
                                  selectedStyle = null;
                                  selectedColors.clear();
                                } else {
                                  selectedStyle = style;
                                  selectedColors.clear();
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: selectedStyle == style ? Colors.blue : null,
                            ),
                            child: Text(
                              style,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        if (selectedStyle == style) ...[
                          const SizedBox(height: 5),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: styleColors[style]!.map((color) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedColors.contains(color)) {
                                      selectedColors.remove(color);
                                    } else {
                                      selectedColors.add(color);
                                    }
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: _getColorFromName(color),
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                  ),
                                  child: selectedColors.contains(color)
                                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                                      : null,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    );
                  }).toList(),
                ),


              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (selectedStyle == null && promptController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a style or \n Enter the prompt')),
                  );
                  return;
                }
                Navigator.pop(context);
                _generateAndCropImage(promptController.text, selectedStyle ?? " ", selectedColors);
              },
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateAndCropImage(String userPrompt, String selectedStyle, List<String> selectedColors) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final generatedFile = await generateAIImage(userPrompt, selectedStyle, selectedColors);
      Navigator.pop(context);
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: generatedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (croppedFile != null && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(fabricFile: File(croppedFile.path)),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error generating image: $e')),
        );
      }
    }
  }


  Future<void> saveToRecents(File imageFile) async {
    // Get the app's documents directory for persistent storage
    final appDir = await getApplicationDocumentsDirectory();
    // Create a unique file name using a timestamp
    final fileName = 'recent_${DateTime.now().millisecondsSinceEpoch}.png';
    // Copy the image to the app's directory
    final savedFile = await imageFile.copy('${appDir.path}/$fileName');

    // Load the current list of recents from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList('recents') ?? [];
    // Add the new image path to the beginning of the list
    recents.insert(0, savedFile.path);
    // Limit the list to 20 images, removing and deleting the oldest if exceeded
    if (recents.length > 20) {
      final oldPath = recents.removeLast();
      await File(oldPath).delete();
    }
    // Save the updated list back to SharedPreferences
    await prefs.setStringList('recents', recents);
  }
  // Set overlay image
  void _setOverlayImage(String overlay) {
    setState(() {
      _selectedOverlay = overlay;
      _onDesignChanged();
    });
  }

  // Toggle favorite status
  Future<void> _toggleFavorite() async {
    if (_isFavorite) {
      if (_currentFavorite != null) {
        await _favoritesService.removeFavorite(_currentFavorite!);
        setState(() {
          _isFavorite = false;
          _currentFavorite = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Removed from Favorites')),
        );
      }
    } else {
      if (_fabricFile != null) {
        final state = _previewKey.currentState;
        if (state != null) {
          final tempFile = await state.captureImage();
          if (tempFile != null) {
            final appDir = await getApplicationDocumentsDirectory();
            final thumbnailFileName = 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.png';
            final thumbnailPath = '${appDir.path}/$thumbnailFileName';
            await tempFile.copy(thumbnailPath);
            await tempFile.delete();
            String generateUniqueId() {
              return DateTime.now().millisecondsSinceEpoch.toString();
            }
            final favorite = FavoriteDesign(
              id: generateUniqueId(),
              fabricPath: _fabricFile!.path,
              overlayAsset: _selectedOverlay,
              thumbnailPath: thumbnailPath,
              tileScale: _tileScale,
              tintColor: _selectedColor,
            );
            await _favoritesService.saveFavorite(favorite);
            setState(() {
              _isFavorite = true;
              _currentFavorite = favorite;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Saved to Favorites!')),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select fabric first')),
        );
      }
    }
  }

  // Reset favorite status on design change
  void _onDesignChanged() {
    if (_isFavorite) {
      setState(() {
        _isFavorite = false;
        _currentFavorite = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'FabricVision',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // This sets the text color to white
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.white,
            tooltip: 'View Favorites',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              ).then((selectedFavorite) {
                if (selectedFavorite != null && selectedFavorite is FavoriteDesign) {
                  setState(() {
                    _fabricFile = File(selectedFavorite.fabricPath);
                    _selectedOverlay = selectedFavorite.overlayAsset;
                    _tileScale = selectedFavorite.tileScale;
                    _selectedColor = selectedFavorite.tintColor;
                    _isFavorite = true;
                    _currentFavorite = selectedFavorite;
                    _animationController.forward(from: 0);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50!, Colors.pink.shade50!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // New Row layout for preview and color picker
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fabric Preview Section
                  Expanded(
                    flex: 2,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: _fabricFile != null
                          ? Container(
                        height: screenSize.height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple, width: 2),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            DualImagePreview(
                              key: _previewKey,
                              fabricFile: _fabricFile!,
                              overlayAsset: _selectedOverlay,
                              tileScale: _tileScale,
                              tintColor: _selectedColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: _isFavorite ? Colors.red : Colors.grey,
                                  size: 30,
                                ),
                                tooltip: _isFavorite ? 'Remove Favorite' : 'Add to Favorites',
                                onPressed: _toggleFavorite,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: IconButton(
                                icon: const Icon(Icons.zoom_out_map, color: Colors.deepPurple),
                                tooltip: 'Enlarge',
                                onPressed: () {
                                  if (_fabricFile != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullScreenImage(
                                          fabricFile: _fabricFile!,
                                          overlayAsset: _selectedOverlay,
                                          tileScale: _tileScale,
                                          tintColor: _selectedColor,
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please select a fabric first')),
                                    );
                                  }
                                },
                              ),
                            ),

                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: const Icon(Icons.share, color: Colors.deepPurple),
                                tooltip: 'Share Design',
                                onPressed: () async {
                                  final state = _previewKey.currentState;
                                  if (state != null) {
                                    final file = await state.captureImage();
                                    if (file != null) {
                                      await Share.shareFiles(
                                        [file.path],
                                        text: 'Check out my fabric design!',
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(
                        height: screenSize.height * 0.5,
                        width: screenSize.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Upload a fabric to start!',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Color Picker and Reset Button Section
                  if (_fabricFile != null)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: screenSize.height * 0.45, // Reduced height to constrain the ColorPicker
                              child: ColorPicker(
                                height: screenSize.height * 0.4,
                                onColorChanged: (color) {
                                  setState(() {
                                    _selectedColor = color;
                                    _onDesignChanged();
                                  });
                                },
                                currentColor: _selectedColor,
                              ),
                            ),
                            const SizedBox(height: 10), // Space between color picker and reset button
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                              ),
                              onPressed: () {
                                // Example action: Reset a color selection
                                setState(() {
                                  _selectedColor = null; // Replace with your variable
                                  _onDesignChanged();    // Replace with your callback
                                });
                              },
                              child: const Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              // Tile Scale Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tile Scale:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: screenSize.width * 0.6,
                    child: Slider(
                      value: _tileScale,
                      min: 0.01,
                      max: 5.0,
                      divisions: 200,
                      activeColor: Colors.deepPurple,
                      onChanged: (value) {
                        setState(() {
                          _tileScale = value;
                          _onDesignChanged();
                        });
                      },
                      label: _tileScale.toStringAsFixed(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Upload Buttons
              Wrap(
                spacing: 20.0, // Horizontal space between buttons
                runSpacing: 10.0, // Vertical space between lines
                alignment: WrapAlignment.center, // Center buttons within each line
                children: [
                  _gradientButton(
                    text: 'Gallery',
                    onPressed: () => _pickFabricImage(ImageSource.gallery),
                  ),
                  _gradientButton(
                    text: 'Camera',
                    onPressed: () => _pickFabricImage(ImageSource.camera),
                  ),
                  _gradientButton(
                    text: 'AI Gen',
                    onPressed: () => _showPromptDialog(context),
                  ),
                  _gradientButton(
                    text: 'Recent',
                    onPressed: () async {
                      final selectedPath = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecentsScreen()),
                      );
                      if (selectedPath != null) {
                        setState(() {
                          _fabricFile = File(selectedPath);
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Overlay Buttons
  //             Wrap(
  //               spacing: 12,
  //               runSpacing: 12,
  //               alignment: WrapAlignment.center,
  //               children: [
  //                 OverlayButton(
  //                   asset: 'M_Shirt.png',
  //                   label: 'Male Shirt',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'F_Shirt.png',
  //                   label: 'Female Shirt',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'Trouser.png',
  //                   label: 'Trouser',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'Suit.png',
  //                   label: 'Suit',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'F_kurthi.png',
  //                   label: 'Female Kurthi',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'Nehru_Jacket.png',
  //                   label: 'Nehru Jacket',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //                 OverlayButton(
  //                   asset: 'F_Dress.png',
  //                   label: 'Female Dress',
  //                   onPressed: _setOverlayImage,
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _garmentTypes.length,
                  itemBuilder: (context, index) {
                    final garment = _garmentTypes[index];
                    return GestureDetector(
                      onTap: () => _setOverlayImage(garment['asset']!),
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/${garment['asset']}', // Make sure to have the correct path
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              garment['label']!,
                              style: const TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

  // Custom Gradient Button Widget
  Widget _gradientButton({required String text, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


class FullScreenImage extends StatelessWidget {
  final File fabricFile;
  final String overlayAsset;
  final double tileScale;
  final Color? tintColor;

  const FullScreenImage({
    Key? key,
    required this.fabricFile,
    required this.overlayAsset,
    required this.tileScale,
    this.tintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: DualImagePreview(
                fabricFile: fabricFile,
                overlayAsset: overlayAsset,
                tileScale: tileScale,
                tintColor: tintColor,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
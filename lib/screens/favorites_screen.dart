// import 'package:flutter/material.dart';
// import 'dart:io';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final favoritesService = FavoritesService();
//     return Scaffold(
//       appBar: AppBar(title: const Text('Favorites')),
//       body: FutureBuilder<List<FavoriteDesign>>(
//         future: favoritesService.getFavorites(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           final favorites = snapshot.data!;
//           if (favorites.isEmpty) {
//             return const Center(child: Text('No favorites yet'));
//           }
//           return ListView.builder(
//             itemCount: favorites.length,
//             itemBuilder: (context, index) {
//               final design = favorites[index];
//               return ListTile(
//                 leading: Image.file(
//                   File(design.thumbnailPath),
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
//                 ),
//                 title: Text(design.overlayAsset.split('/').last.replaceAll('.png', '')),
//                 onTap: () {
//                   Navigator.pop(context, design);
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../services/favorites_service.dart';
// import '../models/favorite_design.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Favorites')),
//       body: FutureBuilder<List<FavoriteDesign>>(
//         future: FavoritesService().getFavorites(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           final favorites = snapshot.data!;
//           return ListView.builder(
//             itemCount: favorites.length,
//             itemBuilder: (context, index) {
//               final design = favorites[index];
//               return ListTile(
//                 // Display the thumbnail
//                 leading: Image.file(
//                   File(design.thumbnailPath),
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//                 // Extract a friendly name from overlayAsset (e.g., 'M_Shirt')
//                 title: Text(design.overlayAsset.split('/').last.replaceAll('.png', '')),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _removeFavorite(design, context),
//                 ),
//                 onTap: () {
//                   // Return the selected design to HomeScreen
//                   Navigator.pop(context, design);
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _removeFavorite(FavoriteDesign design, BuildContext context) async {
//     await FavoritesService().removeFavorite(design);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Removed from Favorites')),
//     );
//     // Refresh the screen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import '../services/favorites_service.dart';
import '../models/favorite_design.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<FavoriteDesign>> _future;

  @override
  void initState() {
    super.initState();
    _future = FavoritesService().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: FutureBuilder<List<FavoriteDesign>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final favorites = snapshot.data!;
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final design = favorites[index];
              return ListTile(
                leading: Image.file(
                  File(design.thumbnailPath),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(design.overlayAsset.split('/').last.replaceAll('.png', '')),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_forever_sharp, // Outline version of the delete icon
                    color: Colors.black,  // White color for the icon
                  ),
                  onPressed: () async {
                    final confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Image'),
                        content: Text(
                            'Are you sure you want to remove this image?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await _removeFavorite(design);
                    }
                  },
                ),
                onTap: () => Navigator.pop(context, design),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _removeFavorite(FavoriteDesign design) async {
    await FavoritesService().removeFavorite(design);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Removed from Favorites')),
    );
    // Refresh the favorites list
    setState(() {
      _future = FavoritesService().getFavorites();
    });
  }
}
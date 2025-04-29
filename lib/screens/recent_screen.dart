// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class RecentsScreen extends StatefulWidget {
//   @override
//   _RecentsScreenState createState() => _RecentsScreenState();
// }
//
// class _RecentsScreenState extends State<RecentsScreen> {
//   // List to store image file paths
//   List<String> recents = [];
//   // Parallel list to store last modified times for display
//   List<DateTime> lastModifiedList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadRecents();
//   }
//
//   /// Loads recent images, deletes those older than 30 days, and updates the state
//   Future<void> _loadRecents() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> storedRecents = prefs.getStringList('recents') ?? [];
//
//     final now = DateTime.now();
//     final thirtyDaysAgo = now.subtract(Duration(days: 30));
//
//     List<String> validRecents = [];
//     List<DateTime> validLastModified = [];
//
//     // Filter out images older than 30 days
//     for (var path in storedRecents) {
//       final file = File(path);
//       if (await file.exists()) {
//         final lastModified = await file.lastModified();
//         if (lastModified.isAfter(thirtyDaysAgo)) {
//           // Keep images less than 30 days old
//           validRecents.add(path);
//           validLastModified.add(lastModified);
//         } else {
//           // Delete images older than 30 days
//           await file.delete();
//         }
//       }
//       // If file doesn't exist, skip it (removed from list)
//     }
//
//     setState(() {
//       recents = validRecents;
//       lastModifiedList = validLastModified;
//     });
//
//     // Save the updated list to SharedPreferences
//     await prefs.setStringList('recents', validRecents);
//   }
//
//   /// Deletes an image at the specified index and updates storage
//   Future<void> _deleteRecent(int index) async {
//     final path = recents[index];
//     await File(path).delete();
//     setState(() {
//       recents.removeAt(index);
//       lastModifiedList.removeAt(index); // Keep lists in sync
//     });
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('recents', recents);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Recents')),
//       body: recents.isEmpty
//           ? Center(child: Text('No recent images yet.'))
//           : GridView.builder(
//         padding: EdgeInsets.all(8.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//         ),
//         itemCount: recents.length,
//         itemBuilder: (context, index) {
//           // Calculate days left until deletion
//           final lastModified = lastModifiedList[index];
//           final deletionDate = lastModified.add(Duration(days: 30));
//           final now = DateTime.now();
//           final daysLeft = deletionDate.difference(now).inDays;
//           final daysLeftText = daysLeft > 0
//               ? '$daysLeft days left'
//               : 'Will be deleted today';
//
//           return Stack(
//             children: [
//               // Image tile for selection
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context, recents[index]);
//                 },
//                 child: Image.file(
//                   File(recents[index]),
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: double.infinity,
//                 ),
//               ),
//               // Delete button
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.delete_forever_sharp, // Outline version of the delete icon
//                     color: Colors.black,  // White color for the icon
//                   ),
//                   onPressed: () async {
//                     final confirm = await showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text('Delete Image'),
//                         content: Text(
//                             'Are you sure you want to delete this image?'),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context, false),
//                             child: Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () => Navigator.pop(context, true),
//                             child: Text('Delete'),
//                           ),
//                         ],
//                       ),
//                     );
//                     if (confirm == true) {
//                       await _deleteRecent(index);
//                     }
//                   },
//                 ),
//               ),
//               // Display remaining days
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Container(
//                   color: Colors.black54,
//                   padding: EdgeInsets.all(4),
//                   child: Text(
//                     daysLeftText,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }





import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

class RecentsScreen extends StatefulWidget {
  static Future<void> addToRecents(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList('recents') ?? [];
    String normalizedPath = p.normalize(path);
    if (!recents.contains(normalizedPath)) {
      recents.add(normalizedPath);
      await prefs.setStringList('recents', recents);
    }
  }

  @override
  _RecentsScreenState createState() => _RecentsScreenState();
}

class _RecentsScreenState extends State<RecentsScreen> {
  List<String> recents = [];
  List<DateTime> lastModifiedList = [];

  @override
  void initState() {
    super.initState();
    _loadRecents();
  }

  Future<void> _loadRecents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedRecents = prefs.getStringList('recents') ?? [];
    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(Duration(days: 30));
    List<String> validRecents = [];
    List<DateTime> validLastModified = [];

    for (var path in storedRecents) {
      final file = File(path);
      if (await file.exists()) {
        final lastModified = await file.lastModified();
        if (lastModified.isAfter(thirtyDaysAgo)) {
          validRecents.add(path);
          validLastModified.add(lastModified);
        } else {
          await file.delete();
        }
      }
    }

    setState(() {
      recents = validRecents;
      lastModifiedList = validLastModified;
    });
    await prefs.setStringList('recents', validRecents);
  }

  Future<void> _deleteRecent(int index) async {
    final path = recents[index];
    await File(path).delete();
    setState(() {
      recents.removeAt(index);
      lastModifiedList.removeAt(index);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recents', recents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recents')),
      body: recents.isEmpty
          ? Center(child: Text('No recent images yet.'))
          : GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: recents.length,
        itemBuilder: (context, index) {
          final lastModified = lastModifiedList[index];
          final deletionDate = lastModified.add(Duration(days: 30));
          final now = DateTime.now();
          final daysLeft = deletionDate.difference(now).inDays;
          final daysLeftText = daysLeft > 0 ? '$daysLeft days left' : 'Will be deleted today';

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, recents[index]);
                },
                child: Image.file(
                  File(recents[index]),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.delete_forever_sharp, color: Colors.black),
                  onPressed: () async {
                    final confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Image'),
                        content: Text('Are you sure you want to delete this image?'),
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
                      await _deleteRecent(index);
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(4),
                  child: Text(
                    daysLeftText,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
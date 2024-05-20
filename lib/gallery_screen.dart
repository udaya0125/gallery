// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/image_screen.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override

  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<File> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery',
        textAlign: TextAlign.center,
        ),
        centerTitle: true,
      
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageScreen(image: _images[index]),
                ),
              );
            },
            child: Image.file(
              _images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
            tooltip: 'Take Photo',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            tooltip: 'Pick Image',
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
// class ImageScreen extends StatelessWidget {
//   final File image;

//   const ImageScreen({super.key, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image'),
//       ),
//       body: Center(
//         child: Image.file(image),
//       ),
//     );
//   }
// }

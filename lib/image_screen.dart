import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final File image;

  const ImageScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Image',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Image.file(image),
      ),
    );
  }
}

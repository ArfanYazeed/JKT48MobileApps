import 'package:flutter/material.dart';

class ImageViewerPage extends StatelessWidget {
  final String imagePath;

  const ImageViewerPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // tap untuk kembali
        child: Center(
          child: InteractiveViewer(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';

import '../button/pick_image_again_button.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({Key? key, required this.image, required this.pickImage}) : super(key: key);

  final File image;
  final Future<void> Function() pickImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.file(
            image,
            errorBuilder: ((context, error, stackTrace) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }),
          ),
          PickImageAgainButton(onTap: pickImage),
        ],
      ),
    );
  }
}

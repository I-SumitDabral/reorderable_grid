import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haicam/config/extensions/string_extensions.dart';
import 'package:haicam/models/image_model.dart';

class ImageCardWidget extends StatelessWidget {
  final ImageModel image;
  const ImageCardWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              child: image.image.contains('assets/images/')
                  ? Image.asset(
                      image.image,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.file(
                      File(
                        image.image,
                      ),
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(image.title.intelliTrimOfTitle),
          )
        ],
      ),
    );
  }
}

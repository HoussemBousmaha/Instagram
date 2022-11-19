import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../constants/post_constants.dart';

extension GetThumbnail on File {
  Uint8List get imageThumb {
    final originalImage = decodeImage(readAsBytesSync());

    // an error occurred decoding the image
    if (originalImage == null) return Uint8List(0);

    final thumbnailImage = copyResize(originalImage, width: PostConstants.thumbnailSize);

    final thumbnailAsList = encodeJpg(thumbnailImage);
    final thumbnailAsUint8List = Uint8List.fromList(thumbnailAsList);

    return thumbnailAsUint8List;
  }

  Future<Uint8List> get videoThumb async {
    final thumbnailAsUint8List = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: PostConstants.thumbnailSize,
    );

    if (thumbnailAsUint8List == null) return Uint8List(0);

    return thumbnailAsUint8List;
  }
}

extension GetImageAspectRatio on File {
  Future<double> get imageAspectRatio async {
    final originalImage = decodeImage(await readAsBytes());

    // an error occurred decoding the image
    if (originalImage == null) return 0;

    return originalImage.width / originalImage.height;
  }

  Future<double> get videoAspectRatio async {
    final videoPlayerController = VideoPlayerController.file(this);
    await videoPlayerController.initialize();

    final videoSize = videoPlayerController.value.size;

    return videoSize.width / videoSize.height;
  }
}

extension GetVideoAspectRatio on File {}

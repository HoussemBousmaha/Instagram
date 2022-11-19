import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram/features/posts/presentation/constants/enums.dart';

import '../extension/post_extensions.dart';
import '../provider/notifier/post_info_notifier_provider.dart';
import '../provider/notifier/post_notifier_provider.dart';
import 'preview_image.dart';

class PickImagePreview extends HookConsumerWidget {
  const PickImagePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final postNotifier = ref.read(postNotifierProvider.notifier);
    final postInfoNotifier = ref.watch(postInfoNotifierProvider(FileType.image).notifier);

    final imageNotifier = useState<File?>(null);
    final aspectRatioNotifier = useState<double>(1.5);
    final isLoading = useState<bool>(false);
    final isPicked = useState<bool>(false);

    Future<void> pickImage() async {
      isLoading.value = true;

      final image = await postNotifier.pickImage();
      if (image == null) {
        aspectRatioNotifier.value = 1.5;
        imageNotifier.value = null;
        isLoading.value = false;
        ref.invalidate(postInfoNotifierProvider);
        return;
      }
      imageNotifier.value = image;
      aspectRatioNotifier.value = await image.imageAspectRatio;
      postInfoNotifier.updateFile(image);
      postInfoNotifier.updateAspectRatio(aspectRatioNotifier.value);

      isPicked.value = true;
      isLoading.value = false;
    }

    return GestureDetector(
      onTap: isPicked.value ? null : pickImage,
      child: Container(
        width: size.width * .9,
        height: size.width * .9 / aspectRatioNotifier.value,
        decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: isLoading.value
            ? const CircularProgressIndicator.adaptive()
            : imageNotifier.value == null
                ? Icon(Icons.add_a_photo, size: size.width * .2)
                : ImagePreview(image: imageNotifier.value!, pickImage: pickImage),
      ),
    );
  }
}

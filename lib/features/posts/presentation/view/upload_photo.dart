import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/handler/loading_dialog_handler.dart';
import '../constants/enums.dart';
import '../handler/post_failure_handler.dart';
import '../widget/description_text_field.dart';
import '../widget/pick_image_preview.dart';
import '../button/upload_post_button.dart';

class UplaodImageView extends HookConsumerWidget {
  const UplaodImageView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoadingDialogHandler.handle(ref);
    PostFailureDialogHandler.handle(ref);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: () => context.go('/posts'),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: size.height * .05),
              const PickImagePreview(),
              SizedBox(height: size.height * 0.01),
              const DescriptionTextField(type: FileType.image),
              SizedBox(height: size.height * 0.1),
              const UploadPostButton(type: FileType.image),
              SizedBox(height: size.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}

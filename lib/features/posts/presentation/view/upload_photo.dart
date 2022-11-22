import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../button/upload_post_button.dart';
import '../constants/enums.dart';
import '../handler/post_failure_handler.dart';
import '../handler/post_loading_handler.dart';
import '../widget/card_post_settings.dart';
import '../widget/description_text_field.dart';
import '../widget/pick_image_preview.dart';

class UplaodImageView extends HookConsumerWidget {
  const UplaodImageView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostLoadingDialogHandler.handle(ref);
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
              SizedBox(height: size.height * 0.02),
              const PostSettingsCard(type: FileType.image),
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

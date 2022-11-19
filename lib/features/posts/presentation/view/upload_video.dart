import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/handler/loading_dialog_handler.dart';
import '../button/upload_post_button.dart';
import '../constants/enums.dart';
import '../handler/post_failure_handler.dart';
import '../widget/card_post_settings.dart';
import '../widget/description_text_field.dart';
import '../widget/pick_video_preview.dart';

class UploadVideoView extends HookConsumerWidget {
  const UploadVideoView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoadingDialogHandler.handle(ref);
    PostFailureDialogHandler.handle(ref);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Video'),
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
              const PickVideoPreview(),
              SizedBox(height: size.height * .01),
              const DescriptionTextField(type: FileType.video),
              SizedBox(height: size.height * .02),
              const PostSettingsCard(type: FileType.video),
              SizedBox(height: size.height * .1),
              const UploadPostButton(type: FileType.video),
              SizedBox(height: size.height * .2),
            ],
          ),
        ),
      ),
    );
  }
}

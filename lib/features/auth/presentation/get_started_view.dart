import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storefront/core/constants/app_colors.dart';
import 'package:storefront/core/extensions/build_context_extension.dart';
import 'package:storefront/features/auth/presentation/mixins/background_video_mixin.dart';
import 'package:storefront/localization/helper/bloc/language_bloc.dart';
import 'package:storefront/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:video_player/video_player.dart';
part 'widgets/background_video.dart';
part 'widgets/welcome_text.dart';
part 'widgets/get_started_body.dart';

final class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundVideo(),
        GetStartedBody(),
      ],
    );
  }
}

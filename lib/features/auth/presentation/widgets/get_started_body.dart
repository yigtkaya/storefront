part of '../get_started_view.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 120,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomElevatedButton(
              color: AppColors.kPrimary100,
              borderRadius: 16.r,
              textWidget: Text(
                context.l10n.logIn,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.kSecondary100,
                ),
              ),
              onPressed: () {
                // TODO
              },
            ),
            SizedBox(
              height: 48.h,
            ),
            WelcomeText(),
          ],
        ),
      ),
    );
  }
}

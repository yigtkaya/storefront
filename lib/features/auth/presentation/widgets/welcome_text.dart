part of '../get_started_view.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kBlack.withOpacity(
          .5,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.defaultPadding,
        vertical: context.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ev; vardigin yer degil, her yer kararirken isigini buldugun yerdir.",
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kWhite,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "- Pierce Brown",
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final Widget textWidget;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool isLoading;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.textWidget,
    this.borderRadius = 0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            color,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: isLoading
              ? SizedBox(
                  height: 24.r,
                  width: 24.r,
                  child: const CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : textWidget,
        ),
      ),
    );
  }
}

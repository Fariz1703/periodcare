import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonText, required this.func, this.svg});

  final String buttonText;

  final String? svg;

  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: func,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svg != null) ...[
                SvgPicture.asset(
                  svg!,
                  width: 12,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                buttonText,
                style: AppTypography.buttonLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

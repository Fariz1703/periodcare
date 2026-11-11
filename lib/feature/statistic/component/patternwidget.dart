import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:periodcare/core/theme/app_colors.dart";
import "package:periodcare/core/theme/app_text_style.dart";

class PatternWidget extends StatelessWidget {
  const PatternWidget({super.key, required this.data});

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pola Gejala",
          style: AppTypography.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Text(
          "Gejala Yang Sering Terjadi",
          style: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        ...List.generate(data.length, (index) {
          return Column(
            children: [
              PatternCard(image: data[index]["image"], title: data[index]["title"], count: data[index]["count"]),
              SizedBox(height: 8,)
            ],
          );
        }),
      ],
    );
  }
}

class PatternCard extends StatelessWidget {
  const PatternCard({
    super.key,
    required this.image,
    required this.title,
    required this.count,
  });

  final String image;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Colors.white,
                  boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],

        
      ),
      
      child: Row(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              CircleAvatar(backgroundColor: AppColors.secondary),
              SvgPicture.asset(
                "assets/images/$image",
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$count Kali",
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

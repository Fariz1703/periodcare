import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:flutter/widget_previews.dart';

class FeelingCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const FeelingCard({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected ? AppColors.primary : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                image,
                width: 12,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8),
              Text(
                title,
                style:
                    //  AppTextStyles.bodySmall.copyWith(
                    //   color: isSelected ?Colors.white: AppColors.primary,
                    // ),
                    AppTypography.bodySmall.copyWith(color: isSelected ? Colors.white : AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@Preview(name: 'Feeling Card')
Widget homeViewPreview() {
  return const MaterialApp(home: FeelingCardPreview());
}

class FeelingCardPreview extends StatefulWidget {
  const FeelingCardPreview({super.key});

  @override
  State<FeelingCardPreview> createState() => _FeelingCardPreviewState();
}

class _FeelingCardPreviewState extends State<FeelingCardPreview> {
  bool state = true;

  void test() {
    setState(() {
      state = !state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FeelingCard(
          title: 'Santai',
          image: 'assets/images/energy.svg',
          isSelected: state,
          onTap: test,
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:periodcare/core/theme/app_colors.dart';
// import 'package:periodcare/core/theme/app_text_style.dart';
// import 'package:flutter/widget_previews.dart';

// class FeelingCard extends StatefulWidget {
//   final String title;
//   final String image;


//   const FeelingCard({super.key, required this.title, required this.image});
//   @override
//   State<FeelingCard> createState() => _FeelingCardState();
// }

// class _FeelingCardState extends State<FeelingCard> {
//   bool isSelected = true;

  
//   @override
//   Widget build(BuildContext context) {
//     return 
//       GestureDetector(
//         onTap: () {
//           setState(() {
//             isSelected = !isSelected;
//           });
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           curve: Curves.easeInOut,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(32),
//             color: isSelected ?Colors.white: AppColors.primary  ,
//           ),
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: 
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//               SvgPicture.asset(
//                     widget.image,
//                     width: 12,
//                     fit: BoxFit.contain,
//                     colorFilter: ColorFilter.mode(
//                       isSelected ? AppColors.primary : Colors.white,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                   SizedBox(width: 8,),
//                  Text(
//                     widget.title,
//                     style: AppTextStyles.bodySmall.copyWith(
//                       color: isSelected ? AppColors.primary : Colors.white,
//                     ),
//                   ),
//               ],
//             )
//           ),
//         ),
//       );
//   }
// }

// @Preview(name: 'Feeling Card')
// Widget homeViewPreview() {
//   return const MaterialApp(
//     home: FeelingCard(title: "santai", image: 'assets/images/energy.svg'),
//   );
// }








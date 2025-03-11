import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({
    super.key, required this.imgPath, required this.title, required this.subtitle,
  });
  final String imgPath ;
  final String title ;
  final String subtitle ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imgPath , height: 180.h,),
            verticalSpace(12),
            Text(title, style: TextStyles.font16BlackSemiBold,),
            Text(subtitle, style: TextStyles.font14GrayRegular,),
          ],
        ),
      ),
    );
  }
}

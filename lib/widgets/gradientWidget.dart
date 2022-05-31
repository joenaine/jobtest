import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../consts/theme.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    Key? key,
    required this.textTheme,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.firstColor,
    required this.secondColor,
  }) : super(key: key);

  final TextTheme textTheme;
  final String icon;
  final String title;
  final String subtitle;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      width: 110,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [firstColor, secondColor])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: 12),
          Text(title,
              style: textTheme.headline1!
                  .copyWith(color: Apptheme.white, fontSize: 14)),
          SizedBox(height: 3),
          Text(subtitle,
              style: textTheme.subtitle1,
              maxLines: 3,
              overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}

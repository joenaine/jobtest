import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/theme.dart';

class CompleteIndicator extends StatelessWidget {
  const CompleteIndicator({
    Key? key,
    required this.textTheme,
    required this.title,
    required this.percent,
  }) : super(key: key);

  final TextTheme textTheme;
  final String title;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 20, 16),
        width: 300,
        height: 136,
        decoration: BoxDecoration(
            color: Apptheme.gray, borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Text(
              title,
              style: textTheme.headline1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 2,
            ),
            const SizedBox(height: 18),
            LinearProgressIndicator(
              value: percent,
              minHeight: 8,
              color: Apptheme.fadedBlue,
              backgroundColor: Apptheme.white,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const SizedBox(),
                const Spacer(),
                Text('Complete profile',
                    style: textTheme.headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
                SvgPicture.asset('assets/icons/arrow_right.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
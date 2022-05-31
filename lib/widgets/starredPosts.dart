import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/theme.dart';

class StarredPostsWidget extends StatelessWidget {
  const StarredPostsWidget({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
      height: 93,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Apptheme.gray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/stars.svg'),
          SizedBox(width: 16),
          Flexible(
            child: Text(
              'Posts that are extra relevant to you \ncan be marked with a star and will be shown here for easy access.',
              style: textTheme.bodyText2!.copyWith(fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/theme.dart';

class JobOffersWidget extends StatelessWidget {
  const JobOffersWidget({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
      height: 128,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Apptheme.gray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/todo_list.svg'),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                    'Job offers are shown here! \nKeep your profile updated to stay \nrelevant for new opportunities.',
                    style: textTheme.bodyText2!.copyWith(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3),
              ),
              Row(
                children: [
                  Text('Go to my profile', style: textTheme.headline2),
                  SvgPicture.asset('assets/icons/arrow_right.svg')
                ],
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

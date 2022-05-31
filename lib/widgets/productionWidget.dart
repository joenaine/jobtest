import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../consts/theme.dart';

class ProductionWidget extends StatelessWidget {
  const ProductionWidget({
    Key? key,
    required this.textTheme,
    required this.image,
    required this.title,
  }) : super(key: key);

  final TextTheme textTheme;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Apptheme.gray, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              child: Image.asset(
                image,
                height: 70,
              ),
            ),
            SizedBox(width: 16),
            Container(
              width: MediaQuery.of(context).size.width * .59,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: textTheme.headline2,
                      overflow: TextOverflow.ellipsis),
                  Text('Sweden' + '   ' + 'Jan 14, 2022 - Feb 23, 2023 ',
                      style: textTheme.bodyText2),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/arrow_right.svg'))
          ],
        ),
      ),
    );
  }
}

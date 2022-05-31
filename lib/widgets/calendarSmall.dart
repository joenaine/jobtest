import 'package:aqyr/helper/calendarTimeline.dart';
import 'package:flutter/material.dart';

import '../consts/theme.dart';

class CalendarSmallWidget extends StatelessWidget {
  CalendarSmallWidget({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  final CalendarTimeline dayTimline = CalendarTimeline();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Apptheme.black, borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                if (index == 0) Text('Today', style: textTheme.subtitle2),
                SizedBox(width: 2),
                Text(dayTimline.days[index].weekday,
                    style: textTheme.subtitle1),
              ],
            ),
            Row(
              children: [
                if (dayTimline.days[index].status == 'BUSY')
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 8,
                  )
                else if (dayTimline.days[index].status == 'FREE')
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 8,
                  )
                else
                  SizedBox(),
                SizedBox(width: 2),
                Text(
                    dayTimline.days[index].date +
                        ' ' +
                        dayTimline.days[index].month,
                    style: textTheme.subtitle1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

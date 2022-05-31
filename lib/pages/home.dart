import 'dart:ui';

import 'package:aqyr/helper/completeList.dart';
import 'package:aqyr/helper/gradientWidgetList.dart';
import 'package:aqyr/helper/productionList.dart';
import 'package:aqyr/consts/theme.dart';
import 'package:aqyr/widgets/calendarSmall.dart';
import 'package:aqyr/widgets/completeIndicator.dart';
import 'package:aqyr/widgets/gradientWidget.dart';
import 'package:aqyr/widgets/jobOffers.dart';
import 'package:aqyr/widgets/productionWidget.dart';
import 'package:aqyr/widgets/starredPosts.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

import '../helper/calendarTimeline.dart';

class Home extends StatefulWidget {
  final CalendarTimeline dayTimline = CalendarTimeline();
  final CompleteList completeList = CompleteList();
  final ProductionList productionList = ProductionList();
  final GradientWidgetList gradList = GradientWidgetList();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;
  bool _extendAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 100) {
        setState(() {
          _extendAppBar = true;
        });
      } else {
        setState(() {
          _extendAppBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: false,
      /*floatingActionButton: FloatingActionButton(onPressed: () {
        print(_scrollController.offset);
      }),*/
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: ClipRect(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                  ),
                )),
                foregroundColor: Colors.transparent,
                pinned: true,
                title: Text(
                  'My Availability',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.dayTimline.days
                            .asMap()
                            .map((i, item) => MapEntry(
                                i,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20.5),
                                    decoration: BoxDecoration(
                                        color: Apptheme.black,
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3,
                                              offset: Offset(0, 3),
                                              color: Colors.black54),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (i == 0)
                                          Text('TODAY',
                                              style: textTheme.subtitle2),
                                        SizedBox(height: 4),
                                        Text(item.weekday,
                                            style: textTheme.subtitle1!
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        SizedBox(height: 2),
                                        Text(item.month,
                                            style: textTheme.subtitle1),
                                        SizedBox(height: 2),
                                        Text(
                                          item.date,
                                          style: textTheme.subtitle1!.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        if (item.status == 'BUSY')
                                          Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                            size: 8,
                                          )
                                        else if (item.status == 'FREE')
                                          Icon(
                                            Icons.circle,
                                            color: Colors.blue,
                                            size: 8,
                                          )
                                        else
                                          SizedBox(),
                                      ],
                                    ),
                                  ),
                                )))
                            .values
                            .toList(),
                      ),
                    )),
              ),
              _extendAppBar
                  ? SliverPersistentHeader(
                      pinned: true,
                      delegate: PersistentHeader(
                        widget: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.dayTimline.days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CalendarSmallWidget(
                              textTheme: textTheme,
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  : SliverAppBar(
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 25,
                    ),
            ];
          },
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.completeList.completePercent.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CompleteIndicator(
                            textTheme: textTheme,
                            title: widget
                                .completeList.completePercent[index].title,
                            percent: widget
                                .completeList.completePercent[index].percent);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Today`s productions', style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.productionList.prodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductionWidget(
                          textTheme: textTheme,
                          image: widget.productionList.prodList[index].image,
                          title: widget.productionList.prodList[index].title);
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.gradList.gradList
                        .asMap()
                        .map((i, item) => MapEntry(
                            i,
                            GradientWidget(
                              icon: item.icon,
                              subtitle: item.subtitle,
                              title: item.title,
                              firstColor: item.firstColor,
                              secondColor: item.secondColor,
                              textTheme: textTheme,
                            )))
                        .values
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text('My job offers', style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  JobOffersWidget(textTheme: textTheme),
                  SizedBox(height: 20),
                  Text('Starred posts', style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  StarredPostsWidget(textTheme: textTheme),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Spring.slide(
      slideType: SlideType.slide_in_top,
      delay: Duration(milliseconds: 200),
      animDuration: Duration(milliseconds: 200),
      child: Container(
          width: double.infinity,
          height: 56.0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  color: Colors.white.withOpacity(0.7), child: widget),
            ),
          )),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

import 'package:aqyr/consts/theme.dart';
import 'package:aqyr/models/gradientModel.dart';

class GradientWidgetList {
  List<GradientModel> gradList = [
    GradientModel(
        icon: 'assets/icons/network.svg',
        title: 'My network',
        subtitle: 'Connect and grow your network',
        firstColor: Apptheme.blue,
        secondColor: Apptheme.lightBlue),
    GradientModel(
        icon: 'assets/icons/qyre.svg',
        title: 'Quick hire',
        subtitle: 'Hire someone quickly today',
        firstColor: Apptheme.orange,
        secondColor: Apptheme.lightOrange),
    GradientModel(
        icon: 'assets/icons/cv.svg',
        title: 'My CV',
        subtitle: 'Keep your CV updated to get the best offers',
        firstColor: Apptheme.purple,
        secondColor: Apptheme.lightPurple),
  ];
}

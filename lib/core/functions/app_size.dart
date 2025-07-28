import 'package:get/get.dart';

abstract class DeviceWidthHeight {
  static final double width = Get.width;
  static final double height = Get.height;

  static double perentageOfWidth(double wdt) {
    double percentageFromDesign = ((wdt * width) / DesignWidthHeight.width);
    return percentageFromDesign;
  }

  static double perentageOfHeight(double hei) {
    double percentageFromDesign = ((hei * height) / DesignWidthHeight.height);
    return percentageFromDesign;
  }
}

abstract class DesignWidthHeight {
  static const double width = 375;
  static const double height = 812;
}

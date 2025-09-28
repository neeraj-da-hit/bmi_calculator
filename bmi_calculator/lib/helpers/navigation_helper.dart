import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationHelper {
  static void to(Widget page, {bool fullscreenDialog = false}) {
    Get.to(() => page, fullscreenDialog: fullscreenDialog);
  }

  static void off(Widget page, {bool fullscreenDialog = false}) {
    Get.off(() => page, fullscreenDialog: fullscreenDialog);
  }

  static void offAll(Widget page, {bool fullscreenDialog = false}) {
    Get.offAll(() => page, fullscreenDialog: fullscreenDialog);
  }

  static void back<T extends Object?>([T? result]) {
    Get.back(result: result);
  }

  static Future<T?>? toNamed<T>(String route, {dynamic arguments}) {
    return Get.toNamed<T>(route, arguments: arguments);
  }

  static Future<T?>? offNamed<T>(String route, {dynamic arguments}) {
    return Get.offNamed<T>(route, arguments: arguments);
  }

  static Future<T?>? offAllNamed<T>(String route, {dynamic arguments}) {
    return Get.offAllNamed<T>(route, arguments: arguments);
  }
}

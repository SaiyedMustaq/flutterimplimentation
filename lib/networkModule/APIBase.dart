import 'package:flutter/foundation.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';

class APIBase {
  static String get callUrl {
    if (kReleaseMode) {
      return EndPoint.todos;
    } else {
      return EndPoint.todos;
    }
  }
}

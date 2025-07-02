import 'package:flutter/material.dart';
import '../custom/custom_webview.dart';
import 'package:tmchall/core/key/navigator_key.dart';

class WebViewNavigator {
  static void open(BuildContext context, String url, {String? title}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => CustomWebView(url: url, title: title ?? 'Visualização'),
      ),
    );
  }
}

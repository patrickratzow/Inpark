import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

import "ui/screen_app_bar.dart";

class CustomWebView extends StatelessWidget {
  final String title;
  final String url;

  const CustomWebView({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: title),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

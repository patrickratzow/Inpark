import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:webview_flutter/webview_flutter.dart";

import "screen.dart";
import "ui/screen_app_bar.dart";

class WebViewScreen extends HookWidget implements Screen {
  final String title;
  final String url;

  const WebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);

    return Scaffold(
      appBar: ScreenAppBar(title: title),
      body: Stack(
        children: [
          WebView(
            onPageFinished: ((url) => {isLoading.value = false}),
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
          ),
          if (isLoading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

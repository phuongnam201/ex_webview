import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Vr360Page extends StatefulWidget {
  final VoidCallback? onExit; // Callback function
  Vr360Page({super.key, this.onExit});

  @override
  State<Vr360Page> createState() => _Vr360PageState();
}

class _Vr360PageState extends State<Vr360Page> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse('https://babe360.kennatech.vn/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: Stack(children: [
        WebViewWidget(controller: controller),
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              _handleChange();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "stop loading",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Call onExit callback when exiting the page
    widget.onExit?.call();
    _handleChange();
  }

  void _handleChange() {
    print("exiting!");
    controller.loadRequest(Uri.parse('https://babe360.kennatech.vn/'));
  }
}

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with AutomaticKeepAliveClientMixin {
  bool _isVisible = false;
  bool _disposed = false; // Add a flag to track if the widget is disposed

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    print("_isVisible true");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the parent build method is called
    if (_disposed) {
      // If the widget is disposed, return a Text widget to indicate that it's disposed
      return Text("Widget disposed");
    } else {
      return Center(
        child: Container(
          child: Text("hello"),
        ),
      );
    }
  }

  @override
  void dispose() {
    _isVisible = false;
    if (!_disposed) {
      // Ensure dispose is called only once
      _disposed = true; // Set the flag to true when widget is disposed
      print("is visible in dispose: " + _isVisible.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("thoát khỏi view lỏd")));
    }
    super.dispose();
  }
}

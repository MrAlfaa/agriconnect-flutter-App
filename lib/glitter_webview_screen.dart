import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GlitterWebViewScreen extends StatefulWidget {
  const GlitterWebViewScreen({super.key});

  @override
  State<GlitterWebViewScreen> createState() => _GlitterWebViewScreenState();
}

class _GlitterWebViewScreenState extends State<GlitterWebViewScreen> {
  InAppWebViewController? _webViewController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriConnect Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: InAppWebView(
        initialFile: "assets/web/glitter.html",
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
          
          // Register handler for JavaScript to call Flutter
          controller.addJavaScriptHandler(
            handlerName: 'flutterCallback',
            callback: (args) {
              // Handle data from JavaScript
              print('From JavaScript: $args');
              return {'received': true};
            },
          );
        },
        onLoadStop: (controller, url) async {
          // You can execute JavaScript after the page is loaded
          await controller.evaluateJavascript(source: """
            // Additional JavaScript to execute after page load
            console.log('Dashboard loaded completely');
          """);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendDataToWebView,
        tooltip: 'Send Data',
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendDataToWebView() async {
    if (_webViewController != null) {
      // Send data to JavaScript
      await _webViewController!.evaluateJavascript(source: """
        // This will be received by the message event listener in the HTML
        window.postMessage(${{'message': 'Hello from Flutter', 'timestamp': DateTime.now().millisecondsSinceEpoch}},'*');
      """);
    }
  }
}

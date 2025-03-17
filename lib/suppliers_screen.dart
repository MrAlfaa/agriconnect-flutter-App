import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  int _selectedIndex = 0;
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agriconnect'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home tab - WebView
          InAppWebView(
            initialFile: "assets/web/glitter.html",
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
                mediaPlaybackRequiresUserGesture: false,
              ),
              android: AndroidInAppWebViewOptions(useHybridComposition: true),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;

              controller.addJavaScriptHandler(
                handlerName: 'flutterCallback',
                callback: (args) {
                  print('From JavaScript: $args');
                  return {'received': true};
                },
              );
            },
            onLoadStop: (controller, url) async {
              await controller.evaluateJavascript(
                source: """
                console.log('Dashboard loaded completely');
              """,
              );
            },
          ),

          // Market tab
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_cart, size: 100, color: Colors.green),
                SizedBox(height: 20),
                Text('Market', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),

          // Profile tab
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person, size: 100, color: Colors.green),
                SizedBox(height: 20),
                Text('Profile', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),

          // Settings tab
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.settings, size: 100, color: Colors.green),
                SizedBox(height: 20),
                Text('Settings', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Market',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

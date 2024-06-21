import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_app/services/template/template_api_error_handler.dart';

void main() {
  runApp(MyRouterTestApp());
}

class SimpleStateManager {
  static final SimpleStateManager instance = SimpleStateManager._internal();

  SimpleStateManager._internal();

  StreamController<bool> _controller = StreamController<bool>.broadcast();
  bool isWrapped = false;

  void setWrappedWithSafeArea(bool value) {
    isWrapped = value;
    _controller.add(isWrapped);
  }
}

class MyRouterTestApp extends StatelessWidget {
  // Define the routes
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => AboutPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: _safeAreaBuilder,
      routerConfig: _router,
    );
  }



  Widget _safeAreaBuilder(BuildContext context, Widget? child) {
    return StreamBuilder<Object>(
        stream: SimpleStateManager.instance._controller.stream,
        builder: (context, snapshot) {
          if (child == null) {
            return Container();
          }
          
          /// just because Container is not same as Padding, 
          /// Widget treee above MaterialApp.router is rebuilt
          /// Causing error "Location cannot be empty"
          /// Because we used context.pushReplacement('/about')
          /// Solution was to use GoRouter.of(context).go instead of context.go
          /// But we are losing returned value
          final isWrapped = SimpleStateManager.instance.isWrapped;
          if (isWrapped) {
            return Container(
              child: child,
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          );
        });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SimpleStateManager.instance.setWrappedWithSafeArea(
                  !SimpleStateManager.instance.isWrapped,
                );
              },
              child: Text('Wrap with Device Frame'),
            ),
            ElevatedButton(
              onPressed: () {
                final isCurrent = context.isCurrent;
                final isFirst = context.isFirst;
                print("About Page isCurrent: $isCurrent, isFirst: $isFirst");
                // context.pushReplacement('/about'); // uncomment this. Causing "Location cannot be empty" 
                context.go('/about');
              },
              child: Text('Go to About Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              SimpleStateManager.instance.setWrappedWithSafeArea(
                !SimpleStateManager.instance.isWrapped,
              );
            },
            child: Text('Wrap with Device Frame'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                final isCurrent = context.isCurrent;
                final isFirst = context.isFirst;
                print("Home Page isCurrent: $isCurrent, isFirst: $isFirst");
                // context.go('/');
                context.go('/');
              },
              child: Text('Go to Home Page'),
            ),
          ),
        ],
      ),
    );
  }
}

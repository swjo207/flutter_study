import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;

  const NestedScreen({super.key, required this.child});

  int getIndex(BuildContext context) {
    final location = GoRouterState.of(context).location;
    if (location == '/nested/a') {
      return 0;
    } else if (location == '/nested/b') {
      return 1;
    } else if (location == '/nested/c') {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('locaction: ${GoRouterState.of(context).location}'),
        ),
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: getIndex(context),
          onTap: (index) {
            if (index == 0) {
              context.go('/nested/a');
            } else if (index == 1) {
              context.go('/nested/b');
            } else if (index == 2) {
              context.go('/nested/c');
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ));
  }
}

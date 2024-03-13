import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/layout/default_layout.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.push('/basic');
            },
            child: Text('Push to Basic Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/basic');
              },
              child: Text('Go to Basic Screen')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Error Screen'),
        ),
        body: ListView(
          children: [
            Text(error),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Back Home'),
            ),
          ],
        ));
  }
}

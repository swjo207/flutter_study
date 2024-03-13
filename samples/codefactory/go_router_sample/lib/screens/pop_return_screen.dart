import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop('팝에서 리턴합니다. '); // Pop to PopBaseScreen
              },
              child: const Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
}

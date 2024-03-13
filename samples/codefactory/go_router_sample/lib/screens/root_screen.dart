import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                context.go('/basic');
              },
              child: const Text('Go to Basic Screen')),
          ElevatedButton(
              onPressed: () {
                context.goNamed('named_screen');
              },
              child: const Text('Go to Named Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/push');
              },
              child: const Text('Go to Push Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/pop');
              },
              child: const Text('Go to Pop Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/path_param/1234');
              },
              child: const Text('Go to Path Param Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/query_param?name=go_router&age=1');
              },
              child: const Text('Go to Query Param Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/nested/a');
              },
              child: const Text('Go to Nested Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Go to Login Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/login2');
              },
              child: const Text('Go to Login2 Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/transition');
              },
              child: const Text('Go to Transition Screen')),
          ElevatedButton(
              onPressed: () {
                context.go('/error');
              },
              child: const Text('Error Screen')),
        ],
      ),
    );
  }
}

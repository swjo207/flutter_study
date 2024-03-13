import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screens/basic_screen.dart';
import 'package:go_router_sample/screens/error_screen.dart';
import 'package:go_router_sample/screens/login_screen.dart';
import 'package:go_router_sample/screens/named_screen.dart';
import 'package:go_router_sample/screens/nested_child_screen.dart';
import 'package:go_router_sample/screens/nested_screen.dart';
import 'package:go_router_sample/screens/path_param_screen.dart';
import 'package:go_router_sample/screens/pop_base_creen.dart';
import 'package:go_router_sample/screens/pop_return_screen.dart';
import 'package:go_router_sample/screens/private_screen.dart';
import 'package:go_router_sample/screens/push_screen.dart';
import 'package:go_router_sample/screens/query_param_screen.dart';
import 'package:go_router_sample/screens/root_screen.dart';
import 'package:go_router_sample/screens/transition_screen_one.dart';
import 'package:go_router_sample/screens/transition_screen_two.dart';

// 로그인 되어 있는지 여부
// true : 로그인 되어 있음
// false : 로그인 되어 있지 않음
bool authState = false;

final router = GoRouter(
  // 전역 경로에 적용 됨.
  redirect: (context, state) {
    // return string(path) : 해당 경로로 이동(path)
    // return null : 원래 이동하려는 경로로 이동
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => const NamedScreen(),
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) => const PushScreen(),
        ),
        // /pop
        GoRoute(
          path: 'pop',
          builder: (context, state) => const PopBaseScreen(),
          routes: [
            // /pop/return
            GoRoute(
              path: 'return',
              builder: (context, state) => const PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) => const PathParamScreen(),
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) => const PathParamScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) => const QueryParamScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) => NestedScreen(child: child),
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) =>
                  const NestedChildScreen(routeName: '/nested/a'),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) =>
                  const NestedChildScreen(routeName: '/nested/b'),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) =>
                  const NestedChildScreen(routeName: '/nested/c'),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivateScreen(),
              // login2 하위 경로에 대해서만 적용 됨.
              redirect: (context, state) {
                if (authState) return null;
                return '/login2';
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) => const TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: TransitionScreenTwo(),
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    // rotation, scale, fade ...
                    return RotationTransition(
                      turns: animation,
                      child: child,
                    );
                  }),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
  debugLogDiagnostics: true,
);

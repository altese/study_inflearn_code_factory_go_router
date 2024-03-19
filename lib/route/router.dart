import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/screens/10_transition_screen_1.dart';
import 'package:study_inflearn_code_factory_go_router/screens/10_transition_screen_2.dart';
import 'package:study_inflearn_code_factory_go_router/screens/1_basic_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/2_named_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/3_push_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/4_pop_base_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/5_pop_return_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/6_path_param.dart';
import 'package:study_inflearn_code_factory_go_router/screens/7_query_param_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/8_nested_child_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/8_nested_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/9_login_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/9_private_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/root_screen.dart';

// 로그인 여부
bool authState = false;

final router = GoRouter(
  // redirect1: 모든 route에 적용됨
  redirect: (context, state) {
    // return string => 해당 path의 route로 이동
    // return null => 원래 이동하려던 route로 이동
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    // [ / ] => RootScreen
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      routes: [
        // [ /basic ] => BasicScreen
        // path로 이동
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
        // [ /named ] => NamedScreen
        // name으로 이동
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => const NamedScreen(),
        ),
        // [ /push ] => PushScreen
        GoRoute(
          path: 'push',
          builder: (context, state) => const PushScreen(),
        ),
        // [ /pop ] => PopBaseScreen
        GoRoute(
          path: 'pop',
          builder: (context, state) => const PopBaseScreen(),
          routes: [
            // [ /pop/return ] => PopReturnScreen
            // 데이터 전달 가능
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
          // NestedScreen: routes를 전부 감싸는 위젯
          // child: routes
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
              // redirect2: private로 이동하려고 할 때만 적용됨
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
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
                transitionDuration: const Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const TransitionScreenTwo(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

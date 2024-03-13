import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/screens/1_basic_screen.dart';
import 'package:study_inflearn_code_factory_go_router/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    // [ / ] -> RootScreen
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      routes: [
        // [ /basic ] -> BasicScreen
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        )
      ],
    )
  ],
);

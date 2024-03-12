import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    // home
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
    )
  ],
);

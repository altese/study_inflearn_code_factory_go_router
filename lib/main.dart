import 'package:flutter/material.dart';
import 'package:study_inflearn_code_factory_go_router/route/router.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    // ***
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

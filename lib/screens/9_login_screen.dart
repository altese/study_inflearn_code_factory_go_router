import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/layout/default_layout.dart';
import 'package:study_inflearn_code_factory_go_router/route/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Current Auth State: $authState'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(authState ? 'logout' : 'login'),
          ),
          ElevatedButton(
            onPressed: () {
              if (GoRouterState.of(context).location == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
            child: const Text('Go to Private Route'),
          )
        ],
      ),
    );
  }
}

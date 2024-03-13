import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/layout/default_layout.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          // 뒤로 가기 => 이전 페이지
          ElevatedButton(
            onPressed: () {
              context.push('/basic');
            },
            child: const Text('Push Screen'),
          ),
          // 뒤로 가기 => '/'
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text('Go Basic'),
          ),
        ],
      ),
    );
  }
}

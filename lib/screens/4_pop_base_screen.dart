import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/layout/default_layout.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await context.push('/pop/return');

              print(result);
            },
            child: const Text('Push Pop Return Screen'),
          )
        ],
      ),
    );
  }
}

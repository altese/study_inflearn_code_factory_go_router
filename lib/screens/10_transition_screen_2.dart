import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_inflearn_code_factory_go_router/layout/default_layout.dart';

class TransitionScreenTwo extends StatelessWidget {
  const TransitionScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('POP'),
            )
          ],
        ),
      ),
    );
  }
}

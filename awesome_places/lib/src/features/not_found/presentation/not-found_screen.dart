import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.abc),
          onTap: () {
            GoRouter.of(context).canPop();
          },
        ),
      ),
      body: Text('Not Found page'),
    );
  }
}

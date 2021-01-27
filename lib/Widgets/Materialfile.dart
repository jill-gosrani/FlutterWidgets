import 'package:flutter/material.dart';

import 'back.dart';

class LMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('MaterialApp'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,200,16,16),
              child: Column(
                children: [
                  Text('A convenience widget that '
                      'wraps a number of widgets that are '
                      'commonly required for applications '
                      'implementing Material Design.'),
                  SizedBox(height: 30),
                  Backk(),
                ],
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}

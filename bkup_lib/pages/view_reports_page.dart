import 'package:flutter/material.dart';

class ViewReportsPage extends StatelessWidget {
  const ViewReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: Center(child: Text('List of reports goes here')),
    );
  }
}

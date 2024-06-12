import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padang'),
      ),
      body: Center(
        child: Text('You tapped image ${index + 1}'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  CustomErrorWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
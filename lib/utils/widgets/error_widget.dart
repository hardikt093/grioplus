import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, required this.errorString});

  final String errorString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorString),
    );
  }
}

import 'package:flutter/material.dart';
import 'text_view.dart';

class PageHeading extends StatelessWidget {
  final String title;

  const PageHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: TextView(title,
          textStyle: Theme.of(context).textTheme.headlineMedium!),
    );
  }
}

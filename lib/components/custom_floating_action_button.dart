import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final BuildContext context;
  final Color? color;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.context,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color ?? Theme.of(context).primaryColor,
      onPressed: onPressed,
      tooltip: 'Add',
      child: const Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}

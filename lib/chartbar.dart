import 'package:flutter/material.dart';

class chartbar extends StatelessWidget {
  const chartbar({super.key, required this.fill});
  final double fill;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

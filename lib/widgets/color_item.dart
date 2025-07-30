import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.itemColor});

  final bool isPicked;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? CircleAvatar(
          backgroundColor: Colors.white,
          radius: 38,
          child: CircleAvatar(backgroundColor: itemColor, radius: 36),
        )
        : CircleAvatar(backgroundColor: itemColor, radius: 38);
  }
}

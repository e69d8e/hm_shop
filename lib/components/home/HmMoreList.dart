import 'package:flutter/material.dart';

class Hmmorelist extends StatefulWidget {
  const Hmmorelist({super.key});

  @override
  State<Hmmorelist> createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text('More Item $index'),
      ),
    );
  }
}

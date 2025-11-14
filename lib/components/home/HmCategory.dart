import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  const Hmcategory({super.key});

  @override
  State<Hmcategory> createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Container(
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text('Category $index'),
          ),
        ),
      ),
    );
  }
}

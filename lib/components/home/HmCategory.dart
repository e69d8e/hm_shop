import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmcategory extends StatefulWidget {
  final List<CategoryItem> categorys;
  const Hmcategory({super.key, required this.categorys});

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
        children: List.generate(widget.categorys.length, (index) {
          final category = widget.categorys[index];
          return Container(
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40),
                Text(category.name, style: TextStyle(
                  color: Colors.black
                ),),
              ],
            ),
          );
        }),
      ),
    );
  }
}

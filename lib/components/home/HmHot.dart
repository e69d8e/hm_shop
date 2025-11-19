import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmhot extends StatefulWidget {
  final SpecialRecommend data;
  final String type;

  const Hmhot({super.key, required this.data, required this.type});

  @override
  State<Hmhot> createState() => _HmhotState();
}

class _HmhotState extends State<Hmhot> {
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "hot" ? "爆款推荐" : "一站买全",
          style: TextStyle(
            color: const Color.fromARGB(255, 169, 49, 5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "hot" ? "最受欢迎" : "精心优选",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 230, 58, 58),
          ),
        ),
      ],
    );
  }

  List<Item> get items {
    if (widget.data.subTypes.isEmpty || 
      widget.data.subTypes.first.goodsItems.items.isEmpty) {
      return [];
    }
    return widget.data.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _buildItems() {
    return Expanded(
      child: Row(
        children: items.map((item) {
          return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                item.picture,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              width: 60,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              child: Text("¥ ${item.price}", style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        );
        }).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: widget.type == "hot" ? Color(0xFFCAE0ED) : Color(0xFFF9F4D8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildHeader(), SizedBox(height: 10), _buildItems()],
      ),
    );
  }
}

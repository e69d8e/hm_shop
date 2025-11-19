import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmsuggestion extends StatefulWidget {
  final SpecialRecommend specialRecommend;

  const Hmsuggestion({super.key, required this.specialRecommend});

  @override
  State<Hmsuggestion> createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  List<Item> _getDisplayItems() {
    if (widget.specialRecommend.subTypes.isEmpty ||
        widget.specialRecommend.subTypes.first.goodsItems.items.isEmpty)
      return [];
    return widget.specialRecommend.subTypes.first.goodsItems.items
        .take(3)
        .toList(); // 获取前3个商品
  }

  Widget _buildLeft() {
    return Image.asset("lib/assets/home_cmd_inner.png", width: 100);
  }

  Widget _buildRight() {
    List<Item> items = _getDisplayItems();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(items.length, (i) {
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
                items[i].picture,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              child: Text(
                "¥ ${items[i].price}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.green,
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                "lib/assets/home_cmd_title.png",
                width: 180,
                height: 30,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                SizedBox(width: 10),
                Expanded(child: _buildRight()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

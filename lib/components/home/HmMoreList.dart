import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmmorelist extends StatefulWidget {
  final List<GoodsDetailItem> recommendList;

  const Hmmorelist({super.key, required this.recommendList});

  @override
  State<Hmmorelist> createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  Widget _buildItem(int index) {
    if (index >= widget.recommendList.length) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget.recommendList[index].picture,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset("lib/assets/home_cmd_inner.png"),
            ),
          ),
          SizedBox(
            height: 40,
            child: Text(
              widget.recommendList[index].name,
              style: TextStyle(fontSize: 15),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "¥${widget.recommendList[index].price}",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "${widget.recommendList[index].payCount}人付款",
                style: TextStyle(
                  fontSize: 8,
                  color: const Color.fromARGB(255, 33, 33, 33),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => _buildItem(index),
    );
  }
}

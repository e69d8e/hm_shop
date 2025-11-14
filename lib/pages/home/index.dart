import 'package:flutter/material.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSliver.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _banners = [
    BannerItem(id: 1, imgUrl: 'https://i1.hdslb.com/bfs/bangumi/image/e5a05ff3038119e944b5dad65033cf8bbcde0831.png@564w_320h.webp'),
    BannerItem(id: 2, imgUrl: 'https://i1.hdslb.com/bfs/bangumi/image/e5a05ff3038119e944b5dad65033cf8bbcde0831.png@564w_320h.webp'),
    BannerItem(id: 3, imgUrl: 'https://i1.hdslb.com/bfs/bangumi/image/c555348a0a47f2ca1729526e1bb46efe5af3d341.png@564w_320h.webp'),
  ];

  List<Widget> getSlivers() {
    return [
      SliverToBoxAdapter(child: Hmsliver(banners: _banners,)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmsuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hmhot()),
              SizedBox(width: 10),
              Expanded(child: Hmhot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Hmmorelist()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomScrollView(slivers: getSlivers()));
  }
}

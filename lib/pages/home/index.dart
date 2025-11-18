import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
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
  List<BannerItem> _banners = [
  ];
  @override
  void initState() {
    super.initState();
    _getBanners();
    _getCategorys();
    _getSpecialRecommend();
  }
  // 获取轮播图
  _getBanners() async {
    _banners = await getBannersApi();
    setState(() {
    });
  }

  List<CategoryItem> _categorys = [];
  // 获取分类
  _getCategorys() async {
    _categorys = await getCategoriesApi();
    setState(() {
    });
  }

  // 获取特惠推荐
  SpecialRecommend _specialRecommend = SpecialRecommend(id: "", title: "", subTypes: []);
  _getSpecialRecommend() async {
    _specialRecommend = await getPorductList();
    setState(() {
    });
  }


  List<Widget> getSlivers() {
    return [
      SliverToBoxAdapter(child: Hmsliver(banners: _banners,)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategory(categorys: _categorys,)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmsuggestion(specialRecommend: _specialRecommend,)),
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

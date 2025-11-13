import 'package:flutter/material.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/category/index.dart';
import 'package:hm_shop/pages/home/index.dart';
import 'package:hm_shop/pages/my/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {"icon": "lib/assets/ic_public_home_normal.png", "activeIcon": "lib/assets/ic_public_home_active.png", "text": "首页"},
    {"icon": "lib/assets/ic_public_pro_normal.png", "activeIcon": "lib/assets/ic_public_pro_active.png", "text": "分类"},
    {"icon": "lib/assets/ic_public_cart_normal.png", "activeIcon": "lib/assets/ic_public_cart_active.png", "text": "购物车"},
    {"icon": "lib/assets/ic_public_my_normal.png", "activeIcon": "lib/assets/ic_public_my_active.png", "text": "我的"},
  ]; 

  List<BottomNavigationBarItem> get _getTabList => _tabList.map((e) => BottomNavigationBarItem(
    icon: Image.asset(e["icon"]!, width: 30, height: 30),
    activeIcon: Image.asset(e["activeIcon"]!, width: 30, height: 30),
    label: e["text"]
  )).toList();

  int _currentIndex = 0;

  List<Widget> _getChardList() {
    return [
      const HomeView(),
      const CategoryView(),
      const CartView(),
      const MyView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChardList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, // 显示未选中的标签
        selectedItemColor: Colors.black, // 选中颜色
        unselectedItemColor: Colors.grey, // 未选中颜色
        onTap: (value) => setState(() => _currentIndex = value),
        items: _getTabList, currentIndex: _currentIndex,),
    );
  }
}
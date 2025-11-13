import 'package:flutter/material.dart';
import 'package:hm_shop/pages/login/index.dart';
import 'package:hm_shop/pages/main/index.dart';
// 管理路由

// 根组件
Widget rootWidget() {
  return MaterialApp(
    routes: rootRoutes(),
    initialRoute: '/',
  );
}

Map<String, Widget Function(BuildContext)> rootRoutes() => {
  '/': (context) => MainPage(), // 主页
  '/login': (context) => LoginPage(), // 登录
};
import 'package:flutter/material.dart';

class ToastUtil {
  static showToast(BuildContext context, String msg) {
    // 下拉刷新成功后的轻提示
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('刷新成功', textAlign: TextAlign.center,),
        duration: Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        width: 120,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
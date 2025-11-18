import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannersApi() async {
  return (((await diorequest.get(HttpConstants.BANNER_LIST)) as List<dynamic>)
          .map((item) => BannerItem.fromJson(item as Map<String, dynamic>)))
      .toList();
}

Future<List<CategoryItem>> getCategoriesApi() async {
  return (((await diorequest.get(HttpConstants.CATEGORY_LIST)) as List<dynamic>)
          .map((item) => CategoryItem.fromJson(item as Map<String, dynamic>)))
      .toList();
}

Future<SpecialRecommend> getPorductList() async {
  return SpecialRecommend.fromJson(
    await diorequest.get(HttpConstants.PRODUCT_LIST),
  );
}

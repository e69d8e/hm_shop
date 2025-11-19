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

Future<SpecialRecommend> getPorductListApi() async {
  return SpecialRecommend.fromJson(
    await diorequest.get(HttpConstants.PRODUCT_LIST),
  );
}

Future<SpecialRecommend> getInVogueApi() async {
  return SpecialRecommend.fromJson(
    await diorequest.get(HttpConstants.IN_VOGUE),
  );
}

Future<SpecialRecommend> getOneStopApi() async {
  return SpecialRecommend.fromJson(
    await diorequest.get(HttpConstants.ONE_SEOP),
  );
}

Future<List<GoodsDetailItem>> getRecommendsApi(
  Map<String, dynamic> params,
) async {
  return (((await diorequest.get(HttpConstants.RECOMMEND_LIST, params: params))
              as List)
          .map(
            (item) => GoodsDetailItem.fromJson(item as Map<String, dynamic>),
          ))
      .toList();
}

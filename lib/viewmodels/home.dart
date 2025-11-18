class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 工厂函数
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] ?? "", // ?? 空判断
      imgUrl: json['imgUrl'] ?? "",
    );
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem> children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.children,
  });
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json['children'] != null
          ? (json['children'] as List)
                .map((i) => CategoryItem.fromJson(i))
                .toList()
          : [],
    );
  }
}

class SpecialRecommend {
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SpecialRecommend.fromJson(Map<String, dynamic> json) {
    return SpecialRecommend(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      subTypes: json['subTypes'] != null
          ? (json['subTypes'] as List).map((i) => SubType.fromJson(i)).toList()
          : [],
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({required this.id, required this.title, required this.goodsItems});
  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      goodsItems: GoodsItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<Item> items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: (json['items'] as List? ?? [])
          .map((item) => Item.fromJson(item as Map<String, dynamic>? ?? {}))
          .toList(),
    );
  }
}

class Item {
  String id;
  String name;
  String picture;
  String price;
  String desc;
  int orderNum;
  Item({
    required this.id,
    required this.name,
    required this.picture,
    required this.price,
    required this.desc,
    required this.orderNum,
  });
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      price: json['price'] ?? "0.0",
      orderNum: json['orderNum'] ?? 0,
      desc: json['desc'] ?? "",
    );
  }
}

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
  CategoryItem({required this.id, required this.name, required this.picture, required this.children});
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
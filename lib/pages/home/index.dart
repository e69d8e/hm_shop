import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSliver.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';
import 'package:hm_shop/utils/ToastUtil.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _banners = [];
  @override
  void initState() {
    super.initState();
    // _getBanners();
    // _getCategorys();
    // _getSpecialRecommend();
    // _getInVogue();
    // _getOneStop();
    // _getRecommends();

    Future.microtask(() {
      _onRefresh();
    });
    // 注册监听事件
    _registerEvent();
  }

  // 页码
  int _page = 1;
  // 是否还有更多
  bool _hasMore = true;
  // 是否在加载中
  bool _isLoading = false;

  // 添加监听屏幕滚动事件
  final ScrollController _scrollController = ScrollController();
  _registerEvent() {
    // 监听屏幕滚动
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent -
              _scrollController.offset <
          50) {
        if (_isLoading || !_hasMore) {
          return;
        }
        _getRecommends();
        print("触发加载更多");
      }
    });
  }

  // 获取轮播图
  _getBanners() async {
    _banners = await getBannersApi();
  }

  List<CategoryItem> _categorys = [];
  // 获取分类
  _getCategorys() async {
    _categorys = await getCategoriesApi();
  }

  // 获取特惠推荐
  SpecialRecommend _specialRecommend = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  _getSpecialRecommend() async {
    _specialRecommend = await getPorductListApi();
  }

  // 爆款推荐
  SpecialRecommend _inVogue = SpecialRecommend(id: "", title: "", subTypes: []);
  _getInVogue() async {
    _inVogue = await getInVogueApi();
  }

  // 一站买全
  SpecialRecommend _oneStop = SpecialRecommend(id: "", title: "", subTypes: []);
  _getOneStop() async {
    _oneStop = await getOneStopApi();
  }

  // 推荐列表
  List<GoodsDetailItem> _recommends = [];
  _getRecommends() async {
    _isLoading = true;
    _recommends = await getRecommendsApi({"limit": _page * 8});
    _isLoading = false;
    if (_recommends.length < _page * 8) {
      _hasMore = false;
    }
    _page++;
    setState(() {});
  }

  // 添加下拉刷新方法
  Future<void> _onRefresh() async {
    // 重置分页参数
    _page = 1;
    _hasMore = true;
    _isLoading = false;

    // 重新获取所有数据
    await _getBanners();
    await _getCategorys();
    await _getSpecialRecommend();
    await _getInVogue();
    await _getOneStop();
    await _getRecommends();

    setState(() {});

    ToastUtil.showToast(context, "刷新成功");
    setState(() {});
  }

  List<Widget> getSlivers() {
    return [
      SliverToBoxAdapter(child: Hmsliver(banners: _banners)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategory(categorys: _categorys)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Hmsuggestion(specialRecommend: _specialRecommend),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Hmhot(data: _inVogue, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Hmhot(data: _oneStop, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Hmmorelist(recommendList: _recommends),
    ];
  }

  final GlobalKey<RefreshIndicatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: getSlivers(),
      ),
    );
  }
}

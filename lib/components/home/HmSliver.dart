import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmsliver extends StatefulWidget {
  final List<BannerItem> banners;

  const Hmsliver({super.key, required this.banners});

  @override
  State<Hmsliver> createState() => _HmsliverState();
}

class _HmsliverState extends State<Hmsliver> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  Widget _buildBanner() {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: carouselController,

      items: List.generate(widget.banners.length, (int index) {
        return Image.network(
          widget.banners[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        onPageChanged: (index, reason) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }

  final TextEditingController _inputControl = TextEditingController();
  int _currentIndex = 0;

  Widget _getDots() {
    return Positioned(
      bottom: 14,
      left: 0,
      right: 0,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.banners.length, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
              carouselController.animateToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: _currentIndex == index ? 40 : 25,
              height: 4,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: _currentIndex == index ? Colors.white : Color.fromRGBO(255, 255, 255, 0.4), borderRadius: BorderRadius.circular(2),
            ),
          ));
        }),
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: TextField(
          onChanged: (value) => print('搜索内容：$value'),
          controller: _inputControl,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '搜索',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              icon: Icon(Icons.search, size: 20),
              color: Colors.white,
              onPressed: () {
                if (_inputControl.text.isEmpty) return;
                print('搜索内容：${_inputControl.text}');
                _inputControl.clear();
              }, 
            ),
            // prefixIcon: Icon(Icons.search, color: Colors.white),
            filled: true,
            fillColor: Color.fromRGBO(0, 0, 0, 0.6),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBanner(), _getDots(), _getSearch()]);
    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text('Hmsliver'),
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medicine_app/screens/newsfeed_detail_screen.dart';
import 'package:medicine_app/screens/product_screen.dart';
import 'package:medicine_app/theme.dart';

class NewsFeedSlider extends StatefulWidget {
  const NewsFeedSlider({Key? key}) : super(key: key);

  @override
  State<NewsFeedSlider> createState() => _NewsFeedSliderState();
}

class _NewsFeedSliderState extends State<NewsFeedSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imagesList = [
      'assets/images/article1.jpg',
      'assets/images/article2.jpg',
      'assets/images/article4.jpg',
      'assets/images/article5.jpg',
      'assets/images/diet_osteoarthritis.jpg',
    ];
    return Container(
      height: 300,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScreen(), //NewsFeedDetailScreen(),
              ),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              items: [
                ...imagesList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.asset(
                                e,
                                width: 1050,
                                height: 350,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map(
              (urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? greenColor
                        : Colors.black.withOpacity(0.3),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

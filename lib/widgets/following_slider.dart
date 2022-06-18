import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/screens/newsfeed_detail_screen.dart';
import 'package:medicine_app/theme.dart';

class FollowingSlider extends StatefulWidget {
  const FollowingSlider({Key? key}) : super(key: key);

  @override
  State<FollowingSlider> createState() => _FollowingSliderState();
}

class _FollowingSliderState extends State<FollowingSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> _followingList = [
      'assets/images/bg_following.jpg',
      'assets/images/bg_following_2.jpg',
      'assets/images/bg_following_3.jpg',
      'assets/images/bg_following_4.jpg',
      'assets/images/bg_following_5.jpg',
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
            items: [
              ..._followingList
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Image.asset(
                              e,
                              width: 1050,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 50,
                              left: 110,
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/sang2022.jpg'),
                                  ),
                                  Text(
                                    '@sang.phan2409',
                                    style: boldTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 120,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pink,
                                ),
                                onPressed: () {},
                                child: Text('FOLLOW'),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: _followingList.map(
        //     (urlOfItem) {
        //       int index = _followingList.indexOf(urlOfItem);
        //       return Container(
        //         width: 10.0,
        //         height: 10.0,
        //         margin:
        //             const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: _currentIndex == index
        //               ? greenColor
        //               : Colors.black.withOpacity(0.3),
        //         ),
        //       );
        //     },
        //   ).toList(),
        // ),
      ],
    );
  }
}

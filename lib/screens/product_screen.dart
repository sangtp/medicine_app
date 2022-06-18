import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/following_slider.dart';
import '../screens/newsfeed_detail_screen.dart';
import '../theme.dart';
import '../screens/product_overview_screen.dart';
import '../widgets/newsfeed_slider.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Health Inspiration',
            style: boldTextStyle.copyWith(fontSize: 20),
          ),
          bottom: const TabBar(
            unselectedLabelColor: greyLightColor,
            tabs: [
              Tab(
                text: 'Explore',
              ),
              Tab(
                text: 'Following',
              ),
              Tab(
                text: 'My Content',
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffb1d9b2),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ProductsOverviewScreen(),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Suggested Users',
                            style: boldTextStyle.copyWith(fontSize: 24)),
                        Text('Follow everyone to get inspired from their post.',
                            style: regularTextStyle.copyWith(
                                fontSize: 16, color: greyLightColor)),
                      ],
                    ),
                  ),
                  FollowingSlider(),
                ],
              ),
            ),
            Center(
              child: Text(
                  'Unfortunately, there is no inspiration posts about your health'),
            ),
          ],
        ),
      ),
    );
  }
}

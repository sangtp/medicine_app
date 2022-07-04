import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_app/screens/add_product_screen.dart';
import 'package:medicine_app/widgets/button_primary.dart';

import '../theme.dart';
import '../widgets/following_slider.dart';
import '../screens/product_overview_screen.dart';

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
            'Tin Tức Sức Khoẻ',
            style: boldTextStyle.copyWith(fontSize: 20),
          ),
          bottom: const TabBar(
            unselectedLabelColor: greyLightColor,
            tabs: [
              Tab(
                text: 'Khám phá',
              ),
              Tab(
                text: 'Đang theo dõi',
              ),
              Tab(
                text: 'Bài viết của tôi',
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
                        Text('Đề xuất người dùng nổi bật',
                            style: boldTextStyle.copyWith(fontSize: 24)),
                        Text('Theo dõi một người để xem các bài viết của họ.',
                            style: regularTextStyle.copyWith(
                                fontSize: 16, color: greyLightColor)),
                      ],
                    ),
                  ),
                  FollowingSlider(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Oops, bạn chưa có bài viết nào!',
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonPrimary(
                  text: 'Tạo ngay',
                  onTap: () {
                    Navigator.of(context).pushNamed(AddProductScreen.routeName);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

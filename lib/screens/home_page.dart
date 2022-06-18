import 'package:flutter/material.dart';

import './product_screen.dart';
import '../theme.dart';
import '../widgets/button_primary.dart';
import '../widgets/newsfeed_slider.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome, Sang Phan!',
                      style: regularTextStyle.copyWith(
                          fontSize: 15, color: greyBoldColor),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.newspaper,
                    size: 30,
                  ),
                  color: greenColor,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffe4faf0)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffb1d9b2),
                  ),
                  hintText: 'Search Something...',
                  hintStyle: regularTextStyle.copyWith(
                    color: const Color(0xffb1d9b2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Breaking news',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            const NewsFeedSlider(),
            const SizedBox(
              height: 20,
            ),
            ButtonPrimary(
              onTap: () {
                Navigator.of(context).pushNamed(ProductScreen.routeName);
              },
              text: 'GET START',
            )
          ],
        ),
      ),
    );
  }
}

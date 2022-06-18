import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/button_primary.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int deliveryFee = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        height: 220,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items',
                  style: regularTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  '10',
                  style: boldTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: regularTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  deliveryFee == 0 ? 'FREE' : '${deliveryFee}',
                  style: boldTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payments',
                  style: regularTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  '\$100.000',
                  style: boldTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ButtonPrimary(
                text: 'CHECKOUT NOW',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffb1d9b2),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: greyBoldColor,
                      ),
                    ),
                    Text(
                      'My Cart',
                      style: boldTextStyle.copyWith(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Destination',
                      style: regularTextStyle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: regularTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                        Text(
                          'Name Destination',
                          style: boldTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Address',
                          style: regularTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                        Text(
                          'Address Destination',
                          style: boldTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: regularTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                        Text(
                          'Name Destination',
                          style: boldTextStyle.copyWith(
                              fontSize: 16, color: greyBoldColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                color: whiteColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/img_covid.png',
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IMBOOT 10 TABLETS',
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle),
                                  color: greenColor,
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$90',
                              style: boldTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                color: whiteColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/img_covid.png',
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IMBOOT 10 TABLETS',
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle),
                                  color: greenColor,
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$90',
                              style: boldTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                color: whiteColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/img_covid.png',
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IMBOOT 10 TABLETS',
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle),
                                  color: greenColor,
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$90',
                              style: boldTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                color: whiteColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/img_covid.png',
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IMBOOT 10 TABLETS',
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle),
                                  color: greenColor,
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$90',
                              style: boldTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

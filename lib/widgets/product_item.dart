import 'package:flutter/material.dart';
import 'package:medicine_app/screens/product_detail_screen.dart';
import 'package:medicine_app/theme.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //dung Provider se build method se  rerun bat ky luc nao data thay doi
    print('product rebuild');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: GridTile(
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GridTileBar(
                    leading: Row(
                      children: [
                        const Icon(Icons.tag),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          product.hashTag!,
                          style: boldTextStyle.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                    trailing: Consumer<Product>(
                      builder: (ctx, product, _) => Row(
                        children: [
                          IconButton(
                            icon: product.isFavorite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.pink,
                                  ),
                            onPressed: () {
                              setState(() {
                                product.toggleFavoriteStatus();
                              });
                            },
                          ),
                          Text(
                            product.totalStars.toString(),
                            style: product.isFavorite
                                ? boldTextStyle.copyWith(color: Colors.pink)
                                : boldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  product.countViewTimes();
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product.id,
                  );
                },
                child: Image.asset(
                  product.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!,
                //overflow: TextOverflow.visible,
                maxLines: 2,
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              height: 30,
              child: CircleAvatar(
                backgroundImage: AssetImage(product.creatorUrl!),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.creatorName!,
                  style: regularTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

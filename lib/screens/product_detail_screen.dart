import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Hero(
                tag: 'Covid',
                child: Image.asset(
                  loadedProduct.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loadedProduct.title!,
                        style: boldTextStyle.copyWith(fontSize: 30),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: Color(0xffb1d9b2),
                          ),
                          Text(loadedProduct.totalView.toString()),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Color(0xffb1d9b2),
                          ),
                          Text(loadedProduct.totalStars.toString()),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.tag,
                            color: Color(0xffb1d9b2),
                          ),
                          Text(loadedProduct.hashTag!),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.edit,
                            color: Color(0xffb1d9b2),
                          ),
                          Text(loadedProduct.creatorName!),
                        ],
                      ),
                      Text(
                        loadedProduct.description!,
                        style: regularTextStyle.copyWith(
                            height: 1.5, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.favorite,
        ),
        onPressed: () {},
      ),
    );
  }
}

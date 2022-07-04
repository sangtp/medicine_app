import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../../widgets/product_item.dart';

class ManageArticlesScreen extends StatelessWidget {
  static const routeName = '/admin-manage-articles';
  const ManageArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý bài viết'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(),
          ),
        ),
      ),
    );
  }
}

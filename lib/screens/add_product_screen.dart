import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _newProduct = Product(
    id: null,
    title: '',
    description: '',
    imageUrl: '',
    hashTag: '',
    creatorUrl: 'assets/images/sang2022.jpg',
    creatorName: 'Sang Phan',
  );

  // @override
  // void dispose() {
  //   _imageUrlController.dispose();
  //   super.dispose();
  // }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Products>(context, listen: false).addProduct(_newProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm bài viết mới'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Tiêu đề'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng không để trống.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newProduct = Product(
                    title: value,
                    id: _newProduct.id,
                    description: _newProduct.description,
                    imageUrl: _newProduct.imageUrl,
                    hashTag: _newProduct.hashTag,
                    creatorUrl: _newProduct.creatorUrl,
                    creatorName: _newProduct.creatorName,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nội dung',
                  alignLabelWithHint: true,
                ),
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập vào một nội dung.';
                  }
                  if (value.length < 10) {
                    return 'Độ dài phải lớn hơn 10.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newProduct = Product(
                    description: value,
                    id: _newProduct.id,
                    title: _newProduct.title,
                    imageUrl: _newProduct.imageUrl,
                    hashTag: _newProduct.hashTag,
                    creatorUrl: _newProduct.creatorUrl,
                    creatorName: _newProduct.creatorName,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hashtag'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập một hashtag.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newProduct = Product(
                    hashTag: value,
                    id: _newProduct.id,
                    title: _newProduct.title,
                    description: _newProduct.description,
                    imageUrl: _newProduct.imageUrl,
                    creatorUrl: _newProduct.creatorUrl,
                    creatorName: _newProduct.creatorName,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hình ảnh '),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imageUrlController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng không để trống.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newProduct = Product(
                    imageUrl: 'assets/images/men_anxiety.jpg',
                    id: _newProduct.id,
                    title: _newProduct.title,
                    description: _newProduct.description,
                    hashTag: _newProduct.hashTag,
                    creatorUrl: _newProduct.creatorUrl,
                    creatorName: _newProduct.creatorName,
                  );
                },
                onFieldSubmitted: (_) => _saveForm(),
              ),
              _imageUrlController.text.isEmpty
                  ? Text(
                      'Chọn một hình ảnh',
                      style: regularTextStyle.copyWith(color: lightGreenColor),
                    )
                  : Container(
                      height: 300,
                      child: FittedBox(
                        child: Image.asset('assets/images/men_anxiety.jpg'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

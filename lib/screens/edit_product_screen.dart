import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';
import 'package:medicine_app/widgets/button_primary.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa bài viết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              GestureDetector(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(loadedProduct.imageUrl!),
                    const Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                initialValue: loadedProduct.title,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 15,
                initialValue: loadedProduct.description,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a content.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hashtag'),
                initialValue: loadedProduct.hashTag,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a hashtag.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonPrimary(
                text: 'Save',
                onTap: _saveForm,
              )
            ],
          ),
        ),
      ),
    );
  }
}

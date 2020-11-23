import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');

  // FormState -> material.dart
  // GlobalKey -> global hook variable

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  /*
   * When working with focus nodes we have to release them or they will be kept in memory
   * and cause possible memory leaks.
   */
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      // force rebuild screen to update
      setState(() {});
    }
  }

  void _saveForm() {
    _form.currentState.save();
    // update _editProduct var ***
    print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveForm)],
      ),
      //  display a form to allow user to enter a title and edit products
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              // appearance of the submit button in the keyboard
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                // Ensure price textfield is focused
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (value) {
                _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Price"),
              focusNode: _priceFocusNode,
              // appearance of the submit button in the keyboard
              onFieldSubmitted: (_) {
                // Ensure price textfield is focused
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          )),
                Expanded(
                  child: TextFormField(
                    focusNode: _imageUrlFocusNode,
                    decoration: InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    onSaved: (value) {
                      _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          id: null,
                          imageUrl: value,
                          isFavorite: _editedProduct.isFavorite);
                    },
                    onEditingComplete: () {
                      setState(() {});
                    },
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

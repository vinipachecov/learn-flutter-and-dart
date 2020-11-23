import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  /**
   * When working with focus nodes we have to release them or they will be kept in memory
   * and cause possible memory leaks.
   */
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      //  display a form to allow user to enter a title and edit products
      body: Form(
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
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
            ),
          ],
        ),
      ),
    );
  }
}

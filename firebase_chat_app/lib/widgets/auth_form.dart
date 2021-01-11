import 'dart:io';

import 'package:firebase_chat_app/widgets/pickers/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(String email, String password, String userName, bool isLogin, File image, BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';
  File _userImageFile;

  void _pickedImage(File image) {
    setState(() {
      _userImageFile = image;
    });
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: Text('Please pick an image.')));
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword,
        _userName,
        _isLogin,
        _userImageFile,
        context
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(margin: EdgeInsets.all(20), child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(16), child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(!_isLogin) UserImagePicker(_pickedImage),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty || !value.contains("@")) {
                      return 'Please entera  valid email address.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email address'
                  ),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  onSaved: (value) {
                    _userEmail = value;
                  },

                ),
                if(!_isLogin)
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value.isEmpty || value.length < 4) {
                      return 'Please enter at least 4 characters for username.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username'
                  ),
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                if(widget.isLoading) CircularProgressIndicator(),
                if (!widget.isLoading) RaisedButton(child: Text( _isLogin ? 'Login' : 'Sign up'), onPressed: _trySubmit ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  }, child:  Text(_isLogin ? 'Create new account' : 'I already have an account'))
              ],
            ),
          ),),
        )),
      );
  }
}
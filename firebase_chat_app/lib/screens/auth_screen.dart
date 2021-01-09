import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String email, String password, String username,
      bool isLogin, BuildContext ctx) async {
    AuthResult authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({'username': username, 'email': email});
      }
    } on PlatformException catch (e) {
      setState(() {
        _isLoading = false;
      });
      var message = 'An error occured, please check your credentials!';
      if (e.message != null) {
        message = e.message;
      }

      Scaffold.of(ctx).showSnackBar(SnackBar(
          content: Text(message), backgroundColor: Theme.of(ctx).errorColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AuthForm(_submitAuthForm, _isLoading));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/widgets/chat/messages.dart';
import 'package:firebase_chat_app/widgets/chat/new_message.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryIconTheme.color,),
            onChanged: (itemIdentifier) {
              if(itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: Row(children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8),
                    Text('Logout')
                  ],),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage()
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: StreamBuilder(stream: Firestore.instance.collection('chats/gPEdCntNOK7hMa8KBhU9/messages').snapshots(),  builder: (ctx, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final documents = snapshot.data.documents;
        return ListView.builder( itemCount: documents.length, itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text(documents[index]['text']),
        ));
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Firestore.instance.collection('chats/gPEdCntNOK7hMa8KBhU9/messages')
          .add({'text': 'This was added by clicking the button!'});
        },
      ),
    );
  }
}
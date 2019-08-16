import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Novos Sapatos',
      amount: 350,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Burgers',
      amount: 30,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      tx.amount.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    children: <Widget>[
                      Text(tx.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(tx.date.toString(),
                          style: TextStyle(color: Colors.grey))
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}

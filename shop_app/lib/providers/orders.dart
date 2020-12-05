import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/utils/api.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  List<OrderItem> get orders {
    return [..._orders];
  }

  Orders(this.authToken, this.userId, this._orders);

  Future<void> fetchAndSetOrders() async {
    final url = Api.url + '/orders/$userId.json' + '?auth=' + this.authToken;
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
          id: orderId,
          amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                  id: item['id'],
                  quantity: item['quantity'],
                  price: item['price'],
                  title: item['title']))
              .toList(),
          dateTime: DateTime.parse(orderData['dateTime'])));
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  void addOrder(List<CartItem> carProducts, double total) async {
    final url = Api.url + '/orders/$userId.json' + '?auth=' + this.authToken;
    final timestamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': carProducts
              .map((cp) => ({
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price
                  }))
              .toList(),
        }));
    _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            dateTime: timestamp,
            products: carProducts));
  }
}

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

// object properties cannot be changed when const is set in front of constructor
  const Category({ 
    @required this.id, 
    @required this.title, 
    @required this.color = Colors.orange,
  });
}
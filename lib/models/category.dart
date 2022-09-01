import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color color;

  const Category({
    @required this.title,
    this.color = Colors.orange,
  });
}

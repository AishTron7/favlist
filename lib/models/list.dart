
import 'package:flutter/material.dart';


class ListModel {
  static const _itemNames = [
    'Ajay',
    'Vijay',
    'Pawan',
    'Neeraj',
    'Shyam',
    'Aryaman',
    'Gunjan',
    'Joseph',
    'Ayushi',
    'Harsh',
    'Dhruv',
    'Nishkal',
    'Ishan',
    'Mayank',
    'Sushant',
  ];

  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int value = 1;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

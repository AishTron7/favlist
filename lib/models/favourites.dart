import 'package:flutter/foundation.dart';
import 'package:provider_shopper/models/list.dart';

class FavouritesModel extends ChangeNotifier {
  ListModel _list;

  final List<int> _itemIds = [];

  ListModel get list => _list;

  set list(ListModel newList) {
    assert(newList != null);
    assert(_itemIds.every((id) => newList.getById(id) != null),
        'The list $newList does not have one of $_itemIds in it.');
    _list = newList;
  
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _list.getById(id)).toList();

  int get totalValue =>
      items.fold(0, (total, current) => total + current.value);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}

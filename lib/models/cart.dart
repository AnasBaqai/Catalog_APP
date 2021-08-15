import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/items.dart';

class CartModel {
  // catalog field
  // ignore: unused_field
  late CatalogModel _catalog;
  // collection of  IDs
  final List<int> itemIDs = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;
  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => itemIDs.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  //add
  void add(Item item) {
    itemIDs.add(item.id);
  }

  //remove
  void remove(Item item) {
    itemIDs.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store!.cart.itemIDs.add(item.id);
  }
}

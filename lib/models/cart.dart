import 'package:flutter_catalog/models/items.dart';

class CartModel {
  static final cartModel = CartModel.internal();
  CartModel.internal();
  factory CartModel() => cartModel;

  // catalog field
  // ignore: unused_field
  late CatalogModel _catalog;
  // collection of  IDs
  final List<int> itemIDs = [];

  CatalogModel get catalog => _catalog;

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

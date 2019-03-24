import 'package:grocery_shop_flutter/models/Product.dart';

class Order {

  Product _product;
  int _quantity;
  int _id;

  Order(this._product, this._quantity, this._id);

  int get id => _id;

  int get quantity => _quantity;

  Product get product => _product;

  double get orderPrice => _quantity*_product.price;

}
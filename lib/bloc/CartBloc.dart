import 'package:rxdart/rxdart.dart';
import 'package:grocery_shop_flutter/models/Product.dart';
import 'package:grocery_shop_flutter/models/Order.dart';
import 'package:grocery_shop_flutter/models/Cart.dart';

class CartBloc{

  static int _orderId = 0;
  static CartBloc _cartBloc;
  Cart _currentCart;
  Order _lastOrder;
  PublishSubject<Cart> _publishSubjectCart;
  PublishSubject<Order> _publishSubjectOrder;

  factory CartBloc(){
    if(_cartBloc == null)
      _cartBloc = new CartBloc._();

    return _cartBloc;
  }

  CartBloc._(){
    _currentCart = new Cart();
    _publishSubjectCart = new PublishSubject<Cart>();
    _publishSubjectOrder = new PublishSubject<Order>();
  }

  Observable<Cart> get observableCart => _publishSubjectCart.stream;
  Observable<Order> get observableLastOrder => _publishSubjectOrder.stream;

  void _updateCart(){
    _publishSubjectCart.sink.add(_currentCart);
  }

  void _updateLastOrder(){
    _publishSubjectOrder.sink.add(_lastOrder);
  }

  void addOrderToCart(Product product, int quantity){
    _lastOrder = new Order(product, quantity, _orderId++);
    _currentCart.addOrder(_lastOrder);
    _updateLastOrder();
    _updateCart();
  }

  void removerOrderOfCart(Order order){
    _currentCart.removeOrder(order);
    _updateCart();
  }

  Cart get currentCart => _currentCart;

  Order get lastOrder => _lastOrder;

  dispose(){
    _cartBloc = null;
    _publishSubjectCart.close();
    _publishSubjectOrder.close();
  }

}
import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Order.dart';

class OrderWidget extends StatelessWidget {

  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    return new Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      new ClipOval(child:
        new Container(color: Colors.white, child: new Image.asset(this._order.product.urlToImage), height:  (MediaQuery.of(context).size.height - _gridSize)* 0.5)
      ),
      new Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:
        new Text(this._order.quantity.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
      ),
      new Text("x", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      new Flexible(flex: 2, child:
        new Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:
          new Text(this._order.product.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        )
      ),
      new Flexible(flex: 1, child:
        new Text("\$${this._order.orderPrice.toStringAsFixed(2)}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
      )
    ]);
  }

}
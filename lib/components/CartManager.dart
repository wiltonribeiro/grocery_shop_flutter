import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Cart.dart';
import 'package:grocery_shop_flutter/bloc/CartBloc.dart';
import 'package:grocery_shop_flutter/components/OrderWidget.dart';

class CartManager extends StatefulWidget {
  @override
  _CartManager createState() => new _CartManager();
}

class _CartManager extends State<CartManager> {

  CartBloc _cartBloc = new CartBloc();

  @override
  Widget build(BuildContext context) {

    double _gridSize = MediaQuery.of(context).size.height*0.88;

    return new Container(height: MediaQuery.of(context).size.height, child:
        new Stack(children: <Widget>[
          new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            new StreamBuilder(initialData: _cartBloc.currentCart, stream: _cartBloc.observableCart, builder: (context, AsyncSnapshot<Cart> snapshot){
              return
                new Container(margin: EdgeInsets.symmetric(horizontal: 20), height: _gridSize, width: double.infinity, child:
                  new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    new Padding(padding: EdgeInsets.symmetric(vertical: 40), child:
                      new Text("Cart", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold))
                    ),
                    new Container(margin: EdgeInsets.only(bottom: 10), height: _gridSize*0.60, child:
                      new ListView.builder(itemCount: snapshot.data.orders.length, itemBuilder: (context, index ){
                        return Dismissible(
                          background: Container(color: Colors.transparent),
                          key: Key(snapshot.data.orders[index].id.toString()),
                          onDismissed: (_) {
                            _cartBloc.removerOrderOfCart(snapshot.data.orders[index]);
                          },
                          child: new Padding(padding: EdgeInsets.symmetric(vertical: 10), child: new OrderWidget(snapshot.data.orders[index], _gridSize)),
                        );
                      })
                    ),
                    new Container(height: _gridSize*0.15, child:
                      new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        new Text("Total", style: TextStyle(color: Colors.white, fontSize: 20)),
                        new Text("\$${snapshot.data.totalPrice().toStringAsFixed(2)}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)),
                      ])
                    )
                  ])
                );
            })
          ]),
          new Align(alignment: Alignment.bottomLeft, child:
            new Container(padding: EdgeInsets.only(left: 10, bottom: _gridSize*0.02), width: MediaQuery.of(context).size.width - 80, child:
              new RaisedButton(color: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(20),
                  onPressed: (){
                    if(_cartBloc.currentCart.isEmpty)
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Cart is empty")));
                  },
                  child: new Text("Next", style: TextStyle(fontWeight: FontWeight.bold))
              )
            )
          )
        ])
    );
  }
}
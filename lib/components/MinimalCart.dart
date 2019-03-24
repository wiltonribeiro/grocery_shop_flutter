import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Cart.dart';
import 'package:grocery_shop_flutter/bloc/CartBloc.dart';

class MinimalCart extends StatelessWidget {

  final double _gridSize;
  final List<Widget> _listWidget = new List();
  final CartBloc _cartBloc = new CartBloc();
  static final ScrollController _scrollController =  new ScrollController();
  MinimalCart(this._gridSize);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(initialData: _cartBloc.currentCart, stream: _cartBloc.observableCart, builder: (context, AsyncSnapshot<Cart> snapshot) {
          _fillList(snapshot.data, context);
          var content =
            new Container(margin: EdgeInsets.only(left: 10, right: 80), width: double.infinity, height: MediaQuery.of(context).size.height - _gridSize, child:
              new ListView.builder(scrollDirection: Axis.horizontal, itemCount: _listWidget.length, controller: _scrollController, itemBuilder: (context, index){
                return new Align(alignment: Alignment.centerLeft, child:_listWidget[index]);
              })
            );
          try{
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }catch(e){
            //TODO fix
          }
          return content;
        }
      );
  }
  
  void _fillList(Cart cart, BuildContext context){
    _listWidget.add(new Text("Cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)));
    _listWidget.addAll(cart.orders.map((order){
        return new Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:
          new GestureDetector(child:
              new Hero(tag: "tagHeroOrder${order.id}", child:
                new ClipOval(child:
                  new Container(color: Colors.white, child: new Image.asset(order.product.urlToImage), height:  (MediaQuery.of(context).size.height - _gridSize)* 0.6)
                ),
            ),
            onTap: (){
              //TODO
            },
          )
        );
    }).toList());
  }

}
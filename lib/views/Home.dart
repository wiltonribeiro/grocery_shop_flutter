import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/bloc/CartBloc.dart';
import 'package:grocery_shop_flutter/components/GridShop.dart';
import 'package:grocery_shop_flutter/components/CartManager.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _showCart = false;
  CartBloc _cartBloc;

  ScrollController _scrollController = new ScrollController();

  @override
  initState(){
    _scrollController = new ScrollController();
    _cartBloc = new CartBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body:
      new Stack(children: <Widget>[
        new CustomScrollView(physics: NeverScrollableScrollPhysics(), controller: _scrollController, slivers: <Widget>[
          new SliverToBoxAdapter(child:
            new GridShop()
          ),
          new SliverToBoxAdapter(child:
            new CartManager()
          ),
        ]),
        new Align(alignment: Alignment.bottomRight, child:
          new Container(margin: EdgeInsets.only(right: 10, bottom: 10),child:
            new FloatingActionButton(onPressed: (){
              if(_showCart)
                _scrollController.animateTo(_scrollController.position.minScrollExtent, curve: Curves.fastOutSlowIn, duration: Duration(seconds: 2));
              else
                _scrollController.animateTo(_scrollController.position.maxScrollExtent, curve: Curves.fastOutSlowIn, duration: Duration(seconds: 2));

              setState(() {
              _showCart = !_showCart;
              });

            }, backgroundColor: Colors.amber, child: new Icon(_showCart ? Icons.close : Icons.shopping_cart))
          )
        )
      ])
    );
  }


  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }
}

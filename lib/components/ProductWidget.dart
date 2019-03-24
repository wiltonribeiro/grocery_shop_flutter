import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Product.dart';
import 'package:grocery_shop_flutter/views/ProductView.dart';

class ProductWidget extends StatelessWidget {

  final Product product;

  ProductWidget({Key key, this.product}) : super(key:key);

  @override
  Widget build(BuildContext context){

    double height = MediaQuery.of(context).size.height/1.2;
    double fontSize = (height/24).round().toDouble();

    return new GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new ProductView(product: this.product)));
        },
        child:
          new Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 5),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))), child:
            new Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              new Center(child: new Hero(tag: "tagHero${this.product.id}", child: new Image.asset(this.product.urlToImage, fit: BoxFit.cover, height: height * 0.20))),
              new Container(height: height * 0.25, margin: EdgeInsets.only(top: 10), child:
                new Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  new Text("\$${this.product.price}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize)),
                  new Container(margin: EdgeInsets.only(top: 20, bottom: 10), child: new Text("${this.product.title}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize * 0.65))),
                  new Text("${this.product.weight}g", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: fontSize * 0.48))
                ])
              )
            ])
          )
    );
  }

}
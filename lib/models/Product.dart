class Product {

  String _urlToImage;
  String _about;
  String _title;
  double _price;
  double _weight;
  int _id;


  Product(this._urlToImage, this._title, this._price, this._weight, this._id){
    _about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  }

  double get weight => _weight;

  double get price => _price;

  String get title => _title;

  String get urlToImage => _urlToImage;

  int get id => _id;

  String get about => _about;


}
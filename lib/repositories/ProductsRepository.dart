import 'package:grocery_shop_flutter/models/Product.dart';

class ProductsRepository{

  List<Product>  fetchAllProducts() {

    return [
      new Product("assets/images/spelt_noodles.png", "Biona Organic Spelt Noodles", 2.99, 250, 0),
      new Product("assets/images/spelt_italian.png", "Biona Organic Spelt Fusili Brown", 2.35, 500, 1),
      new Product("assets/images/spelt_spaghetti.png", "Biona Organic Whole Spelt Spaghetti", 2.35, 500, 2),
      new Product("assets/images/spelt_tagliatelle.png", "Biona Organic Spelt Spinach Artisan Tagliatelle", 1.99, 250, 3),
      new Product("assets/images/spelt_penne.png", "Biona Organic Whole Spelt Penne", 2.35, 500, 4),
      new Product("assets/images/spelt_tagliatelle.png", "Biona Organic Spelt Spinach Artisan Tagliatelle", 1.99, 250, 5),
      new Product("assets/images/spelt_fusilli.png", "Biona Organic Spelt Fusilli Tricolore", 1.99, 250, 6),
    ];
  }
  
}
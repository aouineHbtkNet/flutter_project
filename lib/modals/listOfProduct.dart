import 'package:simo_v_7_0_1/modals/product.dart';

class Products {
   List<Product> list =[];
  Products();

  factory Products.fromJson(List<dynamic> json) {
    Products products = Products();
    products.list ;

    for (var c in json) {
      Product temp = Product.fromJson(c);
      products.list.add(temp);
    }
    return products;
  }
}

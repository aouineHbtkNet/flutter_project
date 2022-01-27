import 'package:simo_v_7_0_1/modals/productoModel.dart';
import 'package:simo_v_7_0_1/modals/product.dart';

class Productos {
  List<Productos> lista =[];

  Productos();

  factory Productos.fromJson(List<dynamic> json) {
    Productos productos = Productos();
    productos.lista ;

    for (var c in json) {
      Producto temp = Producto.fromJson(c);
       // productos.lista.add(temp);
    }
    return productos;
  }
}
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

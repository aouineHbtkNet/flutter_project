

class Product {

  int id;



  Product({
    required this.id,

  });
  factory Product.fromJson(Map <String, dynamic> json) {
    return Product(
        id: json["id"],

    );
  }






}
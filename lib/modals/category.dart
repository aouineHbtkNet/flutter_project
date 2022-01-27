
class Category {
  int? id;
  String? name;


  Category({this.id, this.name});

  factory Category.fromJson(Map <String, dynamic> json) {
    return Category(
        id:json['id']
        ,name: json['nombre_categoria']);

  }

  dynamic toJson() => {'id': id, 'name': name };
  @override
  String toString() {

    return  (toJson().toString());
  }


}


class ObjectCategoria {
  ObjectCategoria({
    required this.id,
    required this.nombreCategoria,
  });
  late final int id;
  late final String nombreCategoria;
  @override
  String toString() {
    return '{ ${this.id}, ${this.nombreCategoria} }';
  }

}
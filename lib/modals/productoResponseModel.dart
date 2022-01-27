


class ProductoResponse {
  String? message;
  int? id ;
  Null fotoProducto;
  Null categoriaId;
  Null nombreProducto;
  Null marca;
  Null contenido;
  Null porcientoDeIva;
  Null precioAhora;
  Null hayDescuento;
  Null precioAnterior;
  Null porcientoDeDescuento;
  Null descripcion;

  ProductoResponse(
      {this.message,
        this.id,
        this.fotoProducto,
        this.categoriaId,
        this.nombreProducto,
        this.marca,
        this.contenido,
        this.porcientoDeIva,
        this.precioAhora,
        this.hayDescuento,
        this.precioAnterior,
        this.porcientoDeDescuento,
        this.descripcion});

  ProductoResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    fotoProducto = json['foto_producto'];
    categoriaId = json['categoria_id'];
    nombreProducto = json['nombre_producto'];
    marca = json['marca'];
    contenido = json['contenido'];
    porcientoDeIva = json['porciento_de_iva'];
    precioAhora = json['precio_ahora'];
    hayDescuento = json['hay_descuento'];
    precioAnterior = json['precio_anterior'];
    porcientoDeDescuento = json['porciento_de_descuento'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['foto_producto'] = this.fotoProducto;
    data['categoria_id'] = this.categoriaId;
    data['nombre_producto'] = this.nombreProducto;
    data['marca'] = this.marca;
    data['contenido'] = this.contenido;
    data['porciento_de_iva'] = this.porcientoDeIva;
    data['precio_ahora'] = this.precioAhora;
    data['hay_descuento'] = this.hayDescuento;
    data['precio_anterior'] = this.precioAnterior;
    data['porciento_de_descuento'] = this.porcientoDeDescuento;
    data['descripcion'] = this.descripcion;
    return data;
  }
}
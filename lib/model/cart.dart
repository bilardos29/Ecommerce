import 'package:ecommerce_app/model/cart_product.dart';

class Cart {
  int? id;
  int? userId;
  String? date;
  List<CartProduct>? products;
  int? iV;

  Cart({this.id, this.userId, this.date, this.products, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <CartProduct>[];
      json['products'].forEach((v) {
        products!.add(CartProduct.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

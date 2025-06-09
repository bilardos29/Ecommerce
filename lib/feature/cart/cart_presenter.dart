import 'package:flutter/cupertino.dart';

import '../../model/cart.dart';
import '../../model/cart_product.dart';
import '../../model/product.dart';
import '../../utils/api.dart';

class CartPresenter extends ChangeNotifier {
  List<CartProduct> listCartProduct = [];
  int totalCartItem = 0;
  double totalCartPrice = 0;

  Future<void> getListCart({int user = 3}) async {
    listCartProduct.clear();
    totalCartItem = 0;
    totalCartPrice = 0;
    var api = Api(path: "/carts/user/$user");

    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          List<Cart> listCart =
              List<Cart>.from(response.map((model) => Cart.fromJson(model)));

          for (int i = 0; i < listCart.length; i++) {
            for (int j = 0; j < listCart[i].products!.length; j++) {
              CartProduct item = listCart[i].products![j];
              getProduct(item.productId ?? 0, onSuccess: (val) {
                item.product = val;
                item.cartId = listCart[i].id;
                listCartProduct.add(item);
                totalCartItem += item.quantity!;
                totalCartPrice += val.price! * item.quantity!;
                notifyListeners();
              });
            }
          }
        });
  }

  void getProduct(int id, {required ValueChanged<Product> onSuccess}) {
    var api = Api(path: "/products/$id");
    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          Product item = Product.fromJson(response);
          onSuccess(item);
        });
  }

  Future<void> addIntoCart({int user = 3, required Product product}) async {
    var data = {
      "userId": '$user',
      "date": '2023-12-28',
      "products": [
        {"productId": '${product.id}', "quantity": '1'}
      ]
    };

    var api = Api(path: "/carts", data: data, apiMethod: ApiMethod.POST);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      notifyListeners();
    });
  }

  Future<void> updateCart({int user = 3, required CartProduct item}) async {
    var data = {
      "userId": '$user',
      "date": '2023-12-28',
      "products": [
        {"productId": '${item.productId}', "quantity": '${item.quantity}'}
      ]
    };
    var api = Api(
        path: "/carts/${item.cartId}", data: data, apiMethod: ApiMethod.PUT);

    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          print('success $response');
          notifyListeners();
        });
  }

  Future<void> deleteCart({int user = 3, required CartProduct item}) async {
    var api = Api(path: "/carts/${item.cartId}", apiMethod: ApiMethod.DELETE);

    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          listCartProduct.remove(item);
          totalCartItem -= item.quantity!;
          totalCartPrice = totalCartItem == 0
              ? 0
              : totalCartPrice - (item.product!.price! * item.quantity!);
          print('price ${item.product!.price} - $totalCartPrice');
          notifyListeners();
        });
  }

  void addQuantity(CartProduct item) {
    item.quantity = item.quantity! + 1;
    totalCartItem += 1;
    totalCartPrice += item.product!.price!;
    notifyListeners();
    updateCart(item: item);
  }

  void minusQuantity(CartProduct item) {
    if (item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      totalCartItem -= 1;
      totalCartPrice -= item.product!.price!;

      notifyListeners();
      updateCart(item: item);
    } else {
      deleteCart(item: item);
    }
  }
}

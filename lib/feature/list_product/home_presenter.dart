import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/model/product.dart';

import '../../utils/api.dart';

class HomePresenter extends ChangeNotifier {
  List<Product> listProduct = [];
  List<String> listCat = ['All'];
  int user = 3;
  String selectedCat = 'All';

  bool isCatSelected(int index){
    return listCat[index] == selectedCat;
  }

  void changeCat(int index) {
    selectedCat = listCat[index];
    notifyListeners();

    getListProduct();
  }

  Future<void> getCategory() async {
    var api = Api(path: "/products/categories");

    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          List<String> listCategory = List<String>.from(response.map((model) => model));
          listCat.addAll(listCategory);
          notifyListeners();
        });
  }

  Future<void> getListProduct() async {
    var qString = {
      "limit": '10',
    };
    var api = Api(
        path: "/products${selectedCat != 'All' ? '/category/$selectedCat' : ''}",
        queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      listProduct =
          List<Product>.from(response.map((model) => Product.fromJson(model)));
      notifyListeners();
    });
  }
}

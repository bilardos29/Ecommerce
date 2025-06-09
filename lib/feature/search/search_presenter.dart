import 'package:flutter/cupertino.dart';

import '../../model/product.dart';
import '../../utils/api.dart';

class SearchPresenter extends ChangeNotifier {
  List<Product> listSearch = [];


  void getListProduct(String query) async {
    var qString = {
      "limit": '20',
    };
    var api = Api(path: "/products", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      listSearch.clear();
      List<Product> listProduct = List<Product>.from(response.map((model)=> Product.fromJson(model)));
      for (var item in listProduct) {
        if(item.title!.contains(query)) {
          listSearch.add(item);
        }
      }
      notifyListeners();
    });
  }
}
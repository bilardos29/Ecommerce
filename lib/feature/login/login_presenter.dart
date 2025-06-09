import 'package:flutter/cupertino.dart';

import '../../model/login.dart';
import '../../utils/api.dart';

class LoginPresenter extends ChangeNotifier {
  void login({
    required String username,
    required String password,
    required ValueChanged<String> onError,
    required VoidCallback onSuccess,
  }) {
    if (username.isEmpty) {
      onError("Username can not empty.");
    } else if (password.isEmpty) {
      onError("Password can not empty.");
    } else {
      var data = {
        "username": '$username',
        "password": '$password',
      };
      var api = Api(path: "/auth/login", apiMethod: ApiMethod.POST, data: data);

      api.request(onError: (val) {
        onError("username or password is incorrect");
      }, onSuccess: (response) async {
        Login login = Login.fromJson(response);
        print(login.token);
        onSuccess();
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/feature/list_product/home_presenter.dart';
import 'package:ecommerce_app/feature/list_product/home_screen.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/inputtext_widgets.dart';

import '../../widgets/main_button.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/textbutton_widget.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  late LoginPresenter presenter;
  late HomePresenter homePresenter;

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<LoginPresenter>(context);
    homePresenter = Provider.of<HomePresenter>(context);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Space(h: 50),
                Image.asset(
                  'images/ic_logo.png',
                  width: 140,
                  height: 60,
                ),
                Text('Shop from our stores with ease',
                    style: BaseWidget.mainTextStyle(colors: Colors.grey)),
                const Space(h: 50),
                InputTextWidget(
                    hint: "Username",
                    icons: const Icon(Icons.email),
                    controller: user),
                const Space(h: 20),
                InputTextWidget(
                  hint: "Password",
                  icons: const Icon(Icons.lock),
                  controller: pass,
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButtonWidget('Forgot password', onClick: () {}),
                  ],
                ),
                const Space(h: 32),
                MainButton("Sign In", onClick: () {
                  presenter.login(
                      username: user.text,
                      password: pass.text,
                      onError: (err) {
                        BaseWidget.showSnackBar(context, err);
                      },
                      onSuccess: () {
                        homePresenter.getCategory().whenComplete(() {
                          homePresenter.getListProduct().whenComplete(() =>
                              BaseWidget.push(context, const HomeScreen()));
                        });
                      });
                }),
                TextButtonWidget('Didn\'t have any account? Sign Up here',
                    onClick: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/feature/home/view/cat_view.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ecommerce_app/feature/cart/cart_presenter.dart';
import 'package:ecommerce_app/feature/cart/cart_screen.dart';
import 'package:ecommerce_app/feature/home/home_presenter.dart';
import 'package:ecommerce_app/feature/search/search_screen.dart';
import 'package:ecommerce_app/widgets/list_product_card.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/header_widget.dart';
import 'package:ecommerce_app/feature/detail_product/detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomePresenter presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => presenter.getCategory().whenComplete(() {
        presenter.getListProduct();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    presenter = context.watch<HomePresenter>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Shop IT", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                //Push to Search screen
                BaseWidget.push(context, const SearchScreen());
              },
              child: const Icon(Icons.search_sharp, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                context.read<CartPresenter>().getListCart().whenComplete(
                  () => BaseWidget.push(context, const CartScreen()),
                );
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: <Widget>[
            const HeaderWidget('Customer'),
            presenter.listCat.isNotEmpty
                ? Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: presenter.listCat.length,
                    itemBuilder: (context, index) {
                      return CatView(
                        category: presenter.listCat[index],
                        onClick: () {
                          presenter.changeCat(index);
                        },
                        isSelected: presenter.isCatSelected(index),
                      );
                    },
                  ),
                )
                : const SizedBox(),
            Space(h: 10),
            presenter.listProduct.isNotEmpty
                ? StaggeredGrid.count(
                  crossAxisCount: 2,
                  children:
                      presenter.listProduct
                          .map(
                            (item) => ListProductCard(
                              product: item,
                              onClick: () {
                                BaseWidget.push(
                                  context,
                                  DetailProductScreen(product: item),
                                );
                              },
                            ),
                          )
                          .toList(),
                )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

//mor_2314
//83r5^_

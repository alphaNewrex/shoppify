import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:shoppify/model/product.dart';

// import 'package:shoppify/network/network_request.dart';

import 'package:shoppify/widgets/navbar.dart';
import 'package:shoppify/widgets/product_description.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      // print(items);
      setState(() {
        products = items;
      });
    } else {
      setState(() {
        products = [];
      });
    }
  }

  List cart = [];

  void _addToCart(int id, int quantity) {
    final newItem = Product(
        id: products[id]['id'],
        price: (products[id]['price']).toDouble(),
        title: products[id]['title'],
        image: products[id]['image'],
        quantity: quantity);

    setState(() {
      cart.add(newItem);
      print(cart);
    });
  }

  void _productDescription(BuildContext ctx, index) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: ProductDescription(_addToCart, products[index]),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  bool isVisible = true;
  void toggleButton() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  List products = [];
  bool isLoading = false;

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Shoppify'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
                arguments: {'items': cart},
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.shoppingCart,
              size: 20,
            ),
          ),
        ],
      ),
      body: products.contains(null)
          ? circularProgress()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: products.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                          products[index]['image']),
                                    ),
                                    height: 120,
                                    width: 1000,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                Text(
                                  '\$${products[index]['price']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: RaisedButton.icon(
                                      color: Colors.amberAccent,
                                      onPressed: () {
                                        _productDescription(context, index);
                                        // print(index);
                                        // print(products[index]);
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.shoppingBasket,
                                        size: 15,
                                      ),
                                      label: Text('Add to Cart'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 220,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

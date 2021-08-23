import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = ModalRoute.of(context)!.settings.arguments as List;
    // print(cart[0]['price']);

    // print(cart.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                  // image: DecorationImage(
                                  //   image: NetworkImage(cart[index]['image']),
                                  ),
                                  // image: DecorationImage(
                                  //   fit: BoxFit.cover,
                                  //   image:
                                  // )
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Product Title',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.redAccent,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Quantity:2',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Price : \$5',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}

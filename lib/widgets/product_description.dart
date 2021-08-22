import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  final Function addToCart;
  var product = {};

  ProductDescription(this.addToCart, this.product);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  void addItem() {
    // print(quantity);
    widget.addToCart(widget.product['id'] - 1, quantity);
    Navigator.of(context).pop();
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                  height: 120,
                  width: 120,
                  child: Image.network(widget.product['image'])),
              SizedBox(
                height: 24,
              ),
              Text(
                "\$${widget.product['price']}",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: Text(
                  "${widget.product['description']}",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6.0),
              //       color: Color(0xFFFFD814)),
              //   height: 50.0,
              //   child: Center(
              //     child: Text(
              //       "Add to Cart",
              //       style: TextStyle(
              //         fontSize: 17.0,
              //         color: Colors.black,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity != 1) {
                            setState(() {
                              quantity -= 1;
                            });
                          }
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('$quantity'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity += 1;
                          });
                        },
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: addItem,
                    child: Text('Add to cart'),
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

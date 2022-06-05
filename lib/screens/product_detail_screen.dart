import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/productProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    // ...
    final getProduct = Provider.of<AllProduct>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail ${getProduct.title}"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${getProduct.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "${getProduct.title}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "\$ ${getProduct.price}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              "${getProduct.description}",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

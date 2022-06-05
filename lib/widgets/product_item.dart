import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(
      context,
      listen: false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white.withOpacity(0.6),
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite == true)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).errorColor,
              onPressed: () {
                productData.statusFavorite();
              },
            ),
          ),
          title: Text(
            productData.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}

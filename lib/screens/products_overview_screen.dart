import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

import '../models/product.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MyShop'),
      ),
      body: ProductGrid(),
    );
  }
}

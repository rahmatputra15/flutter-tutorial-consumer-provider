import 'package:flutter/cupertino.dart';
import 'dart:math';
import '../models/product.dart';

class AllProduct with ChangeNotifier {
  List<Product> _products = List.generate(
    15,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description:
            'Ini adalah deskripsi produk ${index + 1}, silahkan order jika menyukai dan tertarik dengan produk kami ini.',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get products {
    // spread colections
    return _products;
  }

  Product findById(productId) {
    return _products.firstWhere((product_id) => product_id.id == productId);
  }

  void addProduct() {}
}

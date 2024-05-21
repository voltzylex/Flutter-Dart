import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/riverpod/models/product.dart';
import 'package:state_management/riverpod/providers/products_provider.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return {
      Product(
        id: 2,
        title: 'Smartphone',
        price: 500,
        image: 'assets/products/drum.png',
      ),
    };
  }
}

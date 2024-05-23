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

  // add products
  addProducts(Product products) {
    if (!state.contains(products)) {
      state = {...state, products};
    }
  }

  removeProducts(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/riverpod/models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // Notifier<Set<Product>>
  // initial value
  @override
  Set<Product> build() {
    return {};
  }

  // add products

  void addProducts(Product products) {
    if (!state.contains(products)) {
      state = {...state, products};
    }
  }

  void removeProducts(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });

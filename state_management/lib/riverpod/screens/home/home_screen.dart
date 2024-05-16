import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/models/product.dart';
import 'package:state_management/riverpod/providers/products_provider.dart';
import 'package:state_management/riverpod/shared/cart_icon.dart';

class RiverpodHomeScreen extends ConsumerWidget {
  const RiverpodHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProvider = ref.watch(productsProvider);
    // how to add element in allprovider list

    log("allProvider: called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProvider.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return CupertinoButton(
              onPressed: () {
                ref.read(productsProvider).add(const Product(
                  id: 9,
                  title: 'Mouse',
                  price: 50,
                  image: 'assets/products/mouse.png',
                ),);
                allProvider.add(const Product(
                  id: 9,
                  title: 'Mouse',
                  price: 50,
                  image: 'assets/products/mouse.png',
                ),);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        allProvider[index].image,
                        fit: BoxFit.contain,
                        // height: 80,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      allProvider[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${allProvider[index].price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// read only provider
// future provider
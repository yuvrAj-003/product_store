import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cart')),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return Text("hello");
        },
      ),
    );
  }
}

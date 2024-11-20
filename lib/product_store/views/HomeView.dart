// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_pro/product_store/views/IcecreamView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.icecream), label: 'icecreams'),
          NavigationDestination(icon: Icon(Icons.search), label: 'search'),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'shopping',
          ),
        ],
      ),
      body: const IcecreamView(),
    );
  }
}

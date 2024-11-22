// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:store_pro/product_store/views/IcecreamView.dart';
import 'package:store_pro/product_store/views/SearchView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Ionicons.ice_cream_outline),
            label: 'icecreams',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.search_outline),
            label: 'search',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.bag_outline),
            label: 'shopping',
          ),
        ],
      ),
      body: SearchView(),
    );
  }
}

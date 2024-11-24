// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/views/CartView.dart';
import 'package:store_pro/product_store/views/IcecreamView.dart';
import 'package:store_pro/product_store/views/SearchView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    return Scaffold(
      body: IndexedStack(
        index: model.currentIndex,
        children: const [
          IcecreamView(),
          SearchView(),
          CartView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: model.currentIndex,
        onDestinationSelected: model.changeIndex,
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
            label: 'cart',
          ),
        ],
      ),
    );
  }
}

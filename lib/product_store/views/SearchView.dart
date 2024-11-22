import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return Text("hello");
        },
      ),
    );
  }
}

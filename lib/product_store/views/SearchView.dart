import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/widgets/SearchBox.dart';
import 'package:store_pro/product_store/widgets/productItem.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  String _query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: _query)
      ..addListener(_onQueryChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();

    _controller.dispose();
  }

  void _onQueryChanged() {
    setState(() {
      _query = _controller.text;
    });
    // _query = _controller.text;
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MySearchBox(controller: _controller, focusNode: _focusNode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final filteredProducts = model.search(_query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            // color: Colors.red,
            // border: Border.all(width: 5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              _buildSearchBox(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, iteration) {
                    final product = filteredProducts[iteration];
                    return ProductItem(icecream: product);
                  },
                  itemCount: filteredProducts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

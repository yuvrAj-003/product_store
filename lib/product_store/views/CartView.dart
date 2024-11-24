import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/widgets/CartItem.dart';
import 'package:store_pro/product_store/widgets/InputBoxes.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final formKey = GlobalKey<FormState>();
  Widget _buildInput(String query) {
    final inputBox = InputBoxes(
      context: context,
      setState: setState,
    );

    switch (query) {
      case 'name':
        return inputBox.buildNameInput();
      case 'email':
        return inputBox.buildEmailInput();
      case 'mobile':
        return inputBox.buildMobileInput();
      case 'date':
        return inputBox.buildDateInput();
      case 'time':
        return inputBox.buildTimeInput();
      case 'address':
        return inputBox.buildAddressInput();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            // scrollDirection: ,
            children: [
              Theme(
                // removing outline
                data: Theme.of(context).copyWith(
                  expansionTileTheme: const ExpansionTileThemeData(
                    shape: RoundedRectangleBorder(),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text('Address Details'),
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('name'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('email'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('mobile'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('date'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('time'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: _buildInput('address'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              if (value.productsInCart.isNotEmpty)
                Theme(
                  data: Theme.of(context).copyWith(
                    expansionTileTheme: const ExpansionTileThemeData(
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text('Cart Details'),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.productsInCart.length,
                        itemBuilder: (context, index) {
                          return CardItem(
                            id: index,
                            product: value.getProductById(
                              value.productsInCart.keys.toList()[index],
                            ),
                            quantity:
                                value.productsInCart.values.toList()[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/widgets/CartItem.dart';
import 'package:store_pro/product_store/widgets/InputBoxes.dart';
import 'package:store_pro/themes/styles.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final formKey = GlobalKey<FormState>();
  late final InputBoxes inputBoxes;

  // State variables for input fields
  String name = '';
  String email = '';
  String mobile = '';
  String address = '';
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    inputBoxes = InputBoxes(
      context: context,
      setState: (fn) {
        setState(fn);
      },
    );
  }

  Widget _buildInput(String query) {
    switch (query) {
      case 'name':
        return inputBoxes.buildNameInput();
      case 'email':
        return inputBoxes.buildEmailInput();
      case 'mobile':
        return inputBoxes.buildMobileInput();
      case 'date':
        return inputBoxes.buildDateInput();
      case 'time':
        return inputBoxes.buildTimeInput();
      case 'address':
        return inputBoxes.buildAddressInput();
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
                      const Divider(),
                      // sub total cost
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cost',
                              style: TextStyle(fontSize: 15),
                            ),
                            // const Spacer(),
                            Text(
                              '₹${value.subTotalCost}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      // tax and shipping cost
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tax + shipping cost',
                              style: TextStyle(fontSize: 15),
                            ),
                            // const Spacer(),
                            Text(
                              '+ ₹${value.tax + value.shippingCost}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      // total cost
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: Styles.productRowTotal,
                            ),
                            // const Spacer(),
                            Text(
                              '₹${value.totalCost}',
                              style: Styles.productRowTotal,
                            ),
                          ],
                        ),
                      ),
                      // order button
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            try {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                value.clearCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('order placed successfully'),
                                  ),
                                );
                              }
                            } catch (ex) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Error incurred, check your address details',
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Order Now'),
                        ),
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

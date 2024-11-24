import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:provider/provider.dart';
// import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/models/icecreamModel.dart';
import 'package:store_pro/themes/styles.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {required this.id,
      required this.product,
      required this.quantity,
      super.key});

  final Icecreams product;
  final int quantity;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(product.image!),
            ),
            title: Text(
              product.flavour!,
              style: Styles.productRowTotal,
            ),
            subtitle: Text(
              'Qty - ${quantity > 0 ? quantity : ''} * ₹${product.price!}\nTotal - ₹${product.price! * quantity}',
              style: Styles.productRowTotal,
            ),
            trailing: IconButton(
              onPressed: () {
                value.removeProductsInCart(
                    value.productsInCart.keys.toList()[id]);
              },
              icon: const Icon(Ionicons.remove_circle_outline),
            ),
          );
        },
      ),
    );
  }
}

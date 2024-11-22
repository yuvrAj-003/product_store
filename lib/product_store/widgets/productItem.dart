import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';
import 'package:store_pro/product_store/models/icecreamModel.dart';
import 'package:store_pro/themes/styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.icecream,
    super.key,
  });

  final Icecreams icecream;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(icecream.image!),
      ),
      title: Text(
        icecream.flavour!,
        style: Styles.productRowTotal,
      ),
      subtitle: Text(
        '₹ ${icecream.price!}',
        style: Styles.productRowTotal,
      ),
      trailing: IconButton(
        icon: const Icon(Ionicons.add_circle_outline),
        onPressed: () {
          // print(icecream.image);
          Provider.of<AppStateModel>(context, listen: false)
              .addProductToCart(icecream.id!);
        },
      ),
    );
  }
}

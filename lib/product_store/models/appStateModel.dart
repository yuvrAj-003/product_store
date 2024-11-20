import 'package:flutter/material.dart';
import 'package:store_pro/product_store/models/icecreamModel.dart';
import 'package:store_pro/product_store/models/icecreamRepo.dart';
import 'package:store_pro/product_store/models/product.dart';

class AppStateMode extends ChangeNotifier {
  final _shippingCostPerItem = 10;
  final _salesTaxRate = 0.18;

  List<Icecreams> _availableProducts = [];

  final Map<int, int> _productsInCart = <int, int>{};
  Map<int, double> get productsInCart {
    return Map.from(_productsInCart);
  }

  List<Product> get availableProducts {
    return List.from(_availableProducts);
  }

  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (sum, prev) => sum + prev);
  }

  double get subTotalCost {
    return _productsInCart.keys
        .map((id) => _availableProducts[id].price! * _productsInCart[id]!)
        .fold(0, (sum, prev) => sum + prev);
  }

  double get shippingCost {
    return _shippingCostPerItem *
        productsInCart.values.fold(0, (sum, prev) => sum + prev);
  }

  double get tax {
    return subTotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subTotalCost + shippingCost + tax;
  }

  void addProductToCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }

    notifyListeners();
  }

  void removeProductsInCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      _productsInCart.remove(productId);
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  List<Icecreams> search(String query) {
    return _availableProducts
        .where(
          (product) =>
              product.flavour!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  Future<void> loadProducts() async {
    _availableProducts = await ProductRepo.loadAllIceCreams();
    notifyListeners();
  }
}

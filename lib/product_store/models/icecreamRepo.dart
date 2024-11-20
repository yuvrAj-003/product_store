import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:store_pro/product_store/models/icecreamModel.dart';

class ProductRepo {
  static Future<List<Icecreams>> loadAllIceCreams() async {
    final res = await rootBundle.loadString('assets/icecreams.json');

    final iceCreams =
        IceCreamData.fromJson(jsonDecode(res) as Map<String, dynamic>);

    return iceCreams.icecreams!;
  }
}

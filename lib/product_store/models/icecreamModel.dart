import 'package:store_pro/product_store/models/product.dart';

class IceCreamData {
  List<Icecreams>? icecreams;

  IceCreamData({this.icecreams});

  IceCreamData.fromJson(Map<String, dynamic> json) {
    if (json['icecreams'] != null) {
      icecreams = <Icecreams>[];
      (json['icecreams'] as Iterable).forEach((v) {
        icecreams!.add(new Icecreams.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icecreams != null) {
      data['icecreams'] = this.icecreams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icecreams extends Product {
  int? id;
  String? flavour;
  String? description;
  List<String>? toppings;
  double? price;
  String? image;
  bool? isFeatured;
  List<String>? categories;
  List<Ingredients>? ingredients;

  Icecreams(
      {this.id,
      this.flavour,
      this.description,
      this.toppings,
      this.price,
      this.image,
      this.isFeatured,
      this.categories,
      this.ingredients});

  Icecreams.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    flavour = json['flavour'] as String;
    description = json['description'] as String;
    toppings = json['toppings'].cast<String>() as List<String>;
    price = json['price'] as double;
    image = json['image'] as String;
    isFeatured = json['isFeatured'] as bool;
    categories = json['categories'].cast<String>() as List<String>;
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      (json['ingredients'] as Iterable).forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v as Map<String, dynamic>));
      });
    }
    @override
    String toString() {
      return 'Name - $flavour, Price - $price';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flavour'] = this.flavour;
    data['description'] = this.description;
    data['toppings'] = this.toppings;
    data['price'] = this.price;
    data['image'] = this.image;
    data['isFeatured'] = this.isFeatured;
    data['categories'] = this.categories;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  String? quantity;

  Ingredients({this.name, this.quantity});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    quantity = json['quantity'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}

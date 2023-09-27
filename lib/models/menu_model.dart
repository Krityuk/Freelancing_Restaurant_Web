// ignore_for_file: non_constant_identifier_names

class MenuModel {
  List<Menu> menu;

  MenuModel({
    required this.menu,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      menu: (json['menu'] as List)
          .map((item) => Menu.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Menu {
  String category;
  List<Item> items;

  Menu({
    required this.category,
    required this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      category: json['category'] as String,
      items: (json['items'] as List)
          .map((item) => Item.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Item {
  String item_name;
  String? description;
  int price;

  Item({
    required this.item_name,
    this.description,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      item_name: json['item_name'] as String,
      description: json['description'] as String?,
      price: json['price'] as int,
    );
  }
}

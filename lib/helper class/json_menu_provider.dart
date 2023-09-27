import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

import '../models/menu_model.dart';

class MenuProvider {
  Future<MenuModel> getMenu() async {
    try {
      // Load JSON data from assets
      final jsonFile = await rootBundle.loadString('assets/json/menu.json');

      // Parse JSON data
      final jsonData = convert.jsonDecode(jsonFile);

      // Create MenuModel from JSON
      final menuModel = MenuModel.fromJson(jsonData);

      return menuModel;
    } catch (e) {
      throw Exception("Error loading menu data: $e");
    }
  }
}

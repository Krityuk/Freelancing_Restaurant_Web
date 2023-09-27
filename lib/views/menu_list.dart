import 'package:flutter/material.dart';
import 'package:restaurant_vlog/globals/app_colors.dart';

import '../helper class/json_menu_provider.dart';
import '../models/menu_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuModel? menuData;

  @override
  void initState() {
    super.initState();
    loadMenuData();
  }

  ScrollController controller = ScrollController();

  Future<void> loadMenuData() async {
    final menuProvider = MenuProvider();
    final menu = await menuProvider.getMenu();
    setState(() {
      menuData = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 600,
      width: size.width * 0.8,
      color: AppColors.bgColor,
      child: menuData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: menuData!.menu.length,
              controller: controller,
              itemBuilder: (context, index) {
                final category = menuData!.menu[index];
                return Card(
                  color: AppColors.bgColor2,
                  margin: const EdgeInsets.all(16.0),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.category,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Column(
                          children: category.items.map((item) {
                            return ListTile(
                              title: Text(
                                item.item_name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: item.description != null
                                  ? Text(
                                      item.description!,
                                      style: const TextStyle(
                                          color: Colors.white60),
                                    )
                                  : null,
                              trailing: Text(
                                '₹${item.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_vlog/globals/constants.dart';
import 'package:restaurant_vlog/views/menu_list.dart';

import '../globals/app_buttons.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../helper class/helper_class.dart';
import '../helper class/json_menu_provider.dart';
import '../models/menu_model.dart';

class MyFoodList extends StatefulWidget {
  const MyFoodList({Key? key}) : super(key: key);

  @override
  State<MyFoodList> createState() => _MyFoodListState();
}

class _MyFoodListState extends State<MyFoodList> {
  bool isApp = false, isGraphic = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  ScrollController menucontroller = ScrollController();
  MenuModel? menuData;
  Future<MenuModel?>? menupayload;
  @override
  void initState() {
    super.initState();
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    final menuProvider = MenuProvider();
    final payload = menuProvider.getMenu();
    final menu = await menuProvider.getMenu();
    setState(() {
      menuData = menu;
      menupayload = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: menupayload,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HelperClass(
              mobile: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  buildMyFoodListText(context),
                  // Constants.sizedBox(height: 60.0),
                  SizedBox(
                    height: size.height * 4.50,
                    width: size.width,
                    child: GridView(
                      controller: menucontroller,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      children: [
                        //*********************************************************** */

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isApp = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[0].category,
                              asset: "assets/foods/balosahi.png",
                              hover: isApp,
                              data: menuData!.menu[0]),
                        ),
                        //*********************************************************** */
                        //                 // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[1].category,
                              asset: "assets/foods/paneer.png",
                              hover: isGraphic,
                              data: menuData!.menu[1]),
                        ),
                        //                 // Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[2].category,
                              asset: "assets/foods/meal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[2]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[3].category,
                              asset: "assets/foods/combo.png",
                              hover: isGraphic,
                              data: menuData!.menu[3]),
                        ),
                        //  Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[4].category,
                              asset: "assets/foods/aaloo.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[4]),
                        ),
                        //                 // Constants.sizedBox(width: 24.0),

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[5].category,
                              asset: "assets/foods/rice.png",
                              hover: isGraphic,
                              data: menuData!.menu[5]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //6
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[6].category,
                              asset: "assets/foods/dal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[6]),
                        ),
                        //                 // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[7].category,
                              asset: "assets/foods/sukhi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[7]),
                        ),

                        //                 //                 // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[8].category,
                              asset: "assets/foods/gravy.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[8]),
                        ),
                        //
                        //                 //                 // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[9].category,
                              asset: "assets/foods/roti.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[9]),
                        ),
                        //
                        //                 //                 // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[10].category,
                              asset: "assets/foods/khichdi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[10]),
                        )
                        //
                      ],
                    ),
                  ),
                ],
              ),
              tablet: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildMyFoodListText(context),
                  Constants.sizedBox(height: 60.0),
                  SizedBox(
                    height: size.height * 4.0,
                    width: size.width,
                    child: GridView(
                      controller: menucontroller,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      children: [
                        //*********************************************************** */

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isApp = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[0].category,
                              asset: "assets/foods/balosahi.png",
                              hover: isApp,
                              data: menuData!.menu[0]),
                        ),
                        //*********************************************************** */
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[1].category,
                              asset: "assets/foods/paneer.png",
                              hover: isGraphic,
                              data: menuData!.menu[1]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[2].category,
                              asset: "assets/foods/meal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[2]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[3].category,
                              asset: "assets/foods/combo.png",
                              hover: isGraphic,
                              data: menuData!.menu[3]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[4].category,
                              asset: "assets/foods/aaloo.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[4]),
                        ),
                        // Constants.sizedBox(width: 24.0),

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[5].category,
                              asset: "assets/foods/rice.png",
                              hover: isGraphic,
                              data: menuData!.menu[5]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //6
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[6].category,
                              asset: "assets/foods/dal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[6]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[7].category,
                              asset: "assets/foods/sukhi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[7]),
                        ),

                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[8].category,
                              asset: "assets/foods/gravy.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[8]),
                        ),
                        //
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[9].category,
                              asset: "assets/foods/roti.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[9]),
                        ),
                        //
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[10].category,
                              asset: "assets/foods/khichdi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[10]),
                        )
                        //
                      ],
                    ),
                  ),
                ],
              ),
              //
              desktop: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildMyFoodListText(context),
                  const SizedBox(
                    height: 40,
                  ),
                  // Constants.sizedBox(height: 60.0),
                  SizedBox(
                    height: size.height * 2.2,
                    width: size.width,
                    child: GridView(
                      controller: menucontroller,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      children: [
                        //*********************************************************** */

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isApp = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[0].category,
                              asset: "assets/foods/balosahi.png",
                              hover: isApp,
                              data: menuData!.menu[0]),
                        ),
                        //*********************************************************** */
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[1].category,
                              asset: "assets/foods/paneer.png",
                              hover: isGraphic,
                              data: menuData!.menu[1]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[2].category,
                              asset: "assets/foods/meal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[2]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[3].category,
                              asset: "assets/foods/combo.png",
                              hover: isGraphic,
                              data: menuData!.menu[3]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //*********************************************************** */
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[4].category,
                              asset: "assets/foods/aaloo.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[4]),
                        ),
                        // Constants.sizedBox(width: 24.0),

                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isGraphic = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[5].category,
                              asset: "assets/foods/rice.png",
                              hover: isGraphic,
                              data: menuData!.menu[5]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        //6
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[6].category,
                              asset: "assets/foods/dal.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[6]),
                        ),
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[7].category,
                              asset: "assets/foods/sukhi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[7]),
                        ),

                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[8].category,
                              asset: "assets/foods/gravy.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[8]),
                        ),
                        //
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[9].category,
                              asset: "assets/foods/roti.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[9]),
                        ),
                        //
                        // Constants.sizedBox(width: 24.0),
                        InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isDataAnalyst = value;
                            });
                          },
                          child: buildContainer(
                              title: menuData!.menu[10].category,
                              asset: "assets/foods/khichdi.png",
                              hover: isDataAnalyst,
                              data: menuData!.menu[10]),
                        )
                        //
                      ],
                    ),
                  ),
                ],
              ),
              paddingWidth: size.width * 0.04,
              bgColor: AppColors.bgColor,
            );
          } else {
            return Container();
          }
        });
  }

  FadeInDown buildMyFoodListText(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Food ',
                  style: AppTextStyles.headingStyles(fontSize: 40.0),
                  children: [
                    TextSpan(
                      text: 'Menu',
                      style: AppTextStyles.headingStyles(
                          fontSize: 40.0, color: AppColors.robinEdgeBlue),
                    )
                  ],
                ),
              ),
              screenWidth < 500
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(
                      width: 10,
                    ),
              if (screenWidth < 500)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppButtons.buildMaterialButton(
                        buttonName: 'Grid View',
                        icon: const Icon(
                          Icons.grid_view,
                          size: 25,
                          color: Colors.red,
                        ),
                        onTap: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Already in Grid View'),
                            duration: Duration(milliseconds: 500),
                          ));
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    AppButtons.buildMaterialButton(
                        buttonName: 'List View',
                        icon: const Icon(
                          Icons.list,
                          size: 25,
                          color: Colors.red,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                                backgroundColor: AppColors.bgColor,
                                content: const MenuScreen(),
                              );
                            },
                          );
                        }),
                  ],
                ),
              if (screenWidth < 500)
                const SizedBox(
                  height: 10,
                ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          if (screenWidth > 500)
            Row(
              children: [
                AppButtons.buildMaterialButton(
                    buttonName: 'Grid View',
                    icon: const Icon(
                      Icons.grid_view,
                      size: 25,
                      color: Colors.red,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Already in Grid View'),
                        duration: Duration(milliseconds: 500),
                      ));
                    }),
                const SizedBox(
                  width: 10,
                ),
                AppButtons.buildMaterialButton(
                    buttonName: 'List View',
                    icon: const Icon(
                      Icons.list,
                      size: 25,
                      color: Colors.red,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Okay",
                                    style: TextStyle(color: Colors.red),
                                  ))
                            ],
                            backgroundColor: AppColors.bgColor,
                            content: const MenuScreen(),
                          );
                        },
                      );
                    }),
              ],
            ),
        ],
      ),
    );
  }

  Container buildContainer({
    required String title,
    required String asset,
    required bool hover,
    required Menu data,
    double width = 325,
    double hoverWidth = 335,
  }) {
    var devicewidth = MediaQuery.of(context).size.width;
    return Container(
      width: hover ? hoverWidth : width,
      height: hover
          ? devicewidth < 1250
              ? devicewidth < 767
                  ? 410
                  : 440
              : 445
          : devicewidth < 1250
              ? devicewidth < 767
                  ? 405
                  : 450
              : 435,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            asset,
            width: devicewidth < 1200 ? 100 : 150,
            height: devicewidth < 1200 ? 100 : 150,
          ),
          // Constants.sizedBox(height: 15),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.amber, fontSize: devicewidth < 1200 ? 20 : 22.0),
          ),
          // Constants.sizedBox(height: 12.0),
          SizedBox(
            height: devicewidth < 1200 ? 130 : 120,
            width: 325,
            child: Stack(children: [
              Card(
                color: Colors.transparent,
                margin: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  // controller: menucontroller,
                  itemCount: data.items.length,
                  itemBuilder: (context, index) {
                    final item = data.items[index];
                    return ListTile(
                      title: Text(
                        item.item_name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Price: ₹${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white54),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: devicewidth < 1200 ? 35 : 35,
              width: 350 / 2.5,
              child: AppButtons.buildMaterialButton(
                  buttonName: 'Explore more..',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopupMenuContent(
                          items: data.items,
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuInkWell(CategoryData categoryData) {
    return InkWell(
      onTap: () {
        // Handle the onTap event for the menu item here
      },
      onHover: (value) {
        // Handle hover events if needed
      },
      child: buildContainer(
        title: categoryData.category,
        asset: categoryData.asset,
        hover: categoryData.hover,
        data: categoryData.data,
      ),
    );
  }
}

class CategoryData {
  final String category;
  final String asset;
  final bool hover;
  final dynamic data;

  CategoryData({
    required this.category,
    required this.asset,
    required this.hover,
    required this.data,
  });
}

//

class CustomPopupMenuContent extends StatelessWidget {
  final List<Item> items;

  const CustomPopupMenuContent({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return AlertDialog(
      title: const Text('Additional Information'),
      content: SizedBox(
        height: 600,
        width: 600,
        child: ListView.builder(
          itemCount: items.length,
          controller: controller,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(
                item.item_name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: (item.description == null)
                  ? null
                  : Text(
                      '${item.description}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                      ),
                    ),
              trailing: Text(
                ' ₹${item.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            );
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

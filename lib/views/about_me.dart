import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(context),
          Constants.sizedBox(height: 35.0),
          buildProfilePicture(context),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(context),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents(context))
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(context),
          Constants.sizedBox(width: 25.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.15),
              child: buildAboutMeContents(context),
            ),
          )
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  Widget buildProfilePicture(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return PopupMenuButton(
        // ! PopupMenuButton is very good/imp button
        icon: SizedBox(
          width: 200,
          height: 300,
          child: Image.asset(
            'assets/menu/menuButton.png',
            width: 200,
            height: 300,
            fit: BoxFit.fill,
          ),
        ),
        color: AppColors.bgColor2,
        position: PopupMenuPosition.under,
        constraints: BoxConstraints.tightFor(width: size.width * 0.9),
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                textStyle: AppTextStyles.headerTextStyle(),
                child: Image.asset(
                  'assets/menu/menu1.jpg',
                  fit: BoxFit.fill,
                  width: 300,
                  height: 300,
                ),
              ),
            ]);
  }

  Widget buildAboutMeContents(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      width: size.width * 0.4,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: CarouselSlider.builder(
            itemCount: 4, // Number of images
            options: CarouselOptions(
              autoPlay: true, // Enable auto-play
              autoPlayCurve: Curves.bounceOut,
              autoPlayInterval:
                  const Duration(seconds: 5), // Set the duration for each slide
              aspectRatio: 16 / 9, // Set the aspect ratio of the slide
              enlargeCenterPage: true, // Make the current slide larger
            ),
            itemBuilder: (context, index, realIdx) {
              // Define a list of image paths
              final List<String> images = [
                'assets/images/image3.jpeg',
                'assets/images/image2.jpeg',
                'assets/images/image4.jpeg',
                'assets/images/image5.jpeg',
              ];

              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              );
            },
          )),
    );
  }
}

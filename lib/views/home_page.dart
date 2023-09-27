import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height * 0.45,
      width: size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
              height: size.height * 0.45, // Adjust the height as needed
              width: (size.width > 500)
                  ? size.width * 0.55
                  : size.width * 0.9, // Adjust the width as needed
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/image1.jpeg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(16), // Add border radius
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Text(
                  //   'Welcome to Your Website',
                  //   style: TextStyle(
                  //     fontSize: 32, // Customize the font size
                  //     color: Colors.white, // Customize the text color
                  //   ),
                  // ),
                  // const SizedBox(height: 20), // Add spacing between text and image
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Add button functionality
                  //   },
                  //   child: const Text('Learn More'), // Customize the button text
                  // ),
                ],
              ),
            ),
          ),
          if (size.width > 500)
            SizedBox(
              height: size.height * 0.40,
              width: size.width * 0.42,
              // color: Colors.red,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: CarouselSlider.builder(
                    itemCount: 4, // Number of images
                    options: CarouselOptions(
                      autoPlay: true, // Enable auto-play
                      autoPlayCurve: Curves.bounceOut,

                      autoPlayInterval: const Duration(
                          seconds: 5), // Set the duration for each slide
                      aspectRatio: 5 / 3, // Set the aspect ratio of the slide
                      // enlargeCenterPage: true, // Make the current slide larger
                    ),
                    itemBuilder: (context, index, realIdx) {
                      // Define a list of image paths
                      final List<String> images = [
                        'assets/images/image3.jpeg',
                        'assets/images/image2.jpeg',
                        'assets/images/image4.jpeg',
                        'assets/images/image5.jpeg',
                      ];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            images[index],
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  )),
            ),
        ],
      ),
    );
  }
}

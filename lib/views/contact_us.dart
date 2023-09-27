import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: buildForm(context),
      tablet: buildForm(context),
      desktop: buildForm(context),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Widget buildForm(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildContactText('Reach ', 'Us!'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: size.width < 768
                          ? size.width * 0.75
                          : size.width * 0.50,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/free_.png', // Replace with your image asset
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: size.width < 768
                          ? size.width * 0.75
                          : size.width * 0.50,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/free1.png', // Replace with your image asset
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            if (size.width > 768)
              SizedBox(
                width: size.width * 0.25,
                child: Card(
                  color: AppColors.bgColor,
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildContactText('Give ', 'Feedback!'),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 8,
                        child: TextField(
                          cursorColor: AppColors.white,
                          style: AppTextStyles.normalStyle(),
                          decoration:
                              buildInputDecoration(hintText: 'Full Name'),
                        ),
                      ),
                      Constants.sizedBox(height: 20.0),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 8,
                        child: TextField(
                          cursorColor: AppColors.white,
                          style: AppTextStyles.normalStyle(),
                          decoration:
                              buildInputDecoration(hintText: 'Mobile Number'),
                        ),
                      ),
                      Constants.sizedBox(height: 20.0),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 8,
                        child: TextField(
                          maxLines: 11,
                          cursorColor: AppColors.white,
                          style: AppTextStyles.normalStyle(),
                          decoration:
                              buildInputDecoration(hintText: 'Your Message'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Send")),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (size.width < 768)
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.bgColor,
              margin: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildContactText('Give ', 'Feedback!'),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    elevation: 8,
                    child: TextField(
                      cursorColor: AppColors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration: buildInputDecoration(hintText: 'Full Name'),
                    ),
                  ),
                  Constants.sizedBox(height: 20.0),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    elevation: 8,
                    child: TextField(
                      cursorColor: AppColors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration:
                          buildInputDecoration(hintText: 'Mobile Number'),
                    ),
                  ),
                  Constants.sizedBox(height: 20.0),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    elevation: 8,
                    child: TextField(
                      maxLines: 11,
                      cursorColor: AppColors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration:
                          buildInputDecoration(hintText: 'Your Message'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Send")),
                ],
              ),
            ),
          ),
      ],
    );
  }

  FadeInDown buildContactText(String a, String b) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: a,
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: b,
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.comfortaaStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.bgColor2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
  }
}

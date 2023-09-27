import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtons {
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
    Icon? icon,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.themeColor,
      splashColor: AppColors.lawGreen,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      hoverColor: AppColors.aqua,
      elevation: 7,
      height: 46,
      minWidth: 130,
      focusElevation: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon ?? Container(),
          if (icon != null)
            const SizedBox(
              width: 5,
            ),
          Text(
            buttonName,
            style: AppTextStyles.headerTextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

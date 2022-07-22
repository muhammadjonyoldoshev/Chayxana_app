import 'package:flutter/material.dart';
import 'constants/app_colors.dart';

class ThemeService {
  // Colors
  // ...
  static Color colorBackGroundWhite = Colors.white;
  static Color colorIconButtonBlack = Colors.black;
  // Font Family
  static String montserrat = "Montserrat-Medium";

  /// Group => III
  // Text Style
  static TextStyle textStyleHistoryContainer = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins"
  );
  static TextStyle textStyleOrderRoomNumber = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
      color: AppColors.activeColor,
  );
  static TextStyle textStyleOrderData = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
      color: AppColors.unSelectedTextColor,
  );
  static TextStyle textStyleCenterNoorders = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.notFoundText,
  );
  static TextStyle textStyleNewOrderButton = const TextStyle(
    color: AppColors.red,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle textStyleCompletedOrderButton = const TextStyle(
    color: AppColors.grey,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle textStyleCancelOrderButton = const TextStyle(
    color: AppColors.greenCheck,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle textStyleBookAgain = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    height: 1,
  );
  static TextStyle textStyleElevetedButtonStyle = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
  );
  static TextStyle textStyleElevetedButtonStyle2 = const TextStyle(
    color: Colors.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static TextStyle textStyleElevetedButtonStyle3 = const TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static TextStyle textStyleCancelOrder = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    height: 1,
  );
  static TextStyle textStyleResultPageLotties = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}

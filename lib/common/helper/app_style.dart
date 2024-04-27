import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';

class AppStyles {
  // ? # style for any nav bar title :
  static var titleNavBar = GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // ? # style for mid-text like "Choose Payment Methods" :
  static var midTitle18Bold = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // ? # style for any text in button like "Add New Card" (Light Mode):
  static var forTextAnyButton = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    color: AppColors.colorWhite,
  );

  // ? # style for any text in button like "Add New Card" (Dark Mode):
  static var forTextAnyButtonDark = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    color: AppColors.colorLikeBlack,
  );

  // ? # style for any small - text like "Date, ..." -> in R.Summary

  static var smallText14W600 = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.colorLikeGrey,
  );

  // ? # style for any Input fields

  static var styleInputF = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.colorLikeGrey,
    backgroundColor: AppColors.bgcolorInputF,
  );

  // ? # style for any small - text like "December 16, 2024, ..." -> in R.Summary
  static var smallText16Bold = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    color: AppColors.colorLikeBlack,
  );

  // * FOR Credit-Card :
  // ? # Init Style For Card -
  static var initCard = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
  );
  // ? # style for text like "Debit and Number MM/YY"
  static var textDebit = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
  );

  // ? # style for text like "2131 ***** 2323"
  static var textNumberCard = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.colorLikeWhite,
    letterSpacing: 0.2,
  );
  // ? # style for text like "Debit and Number MM/YY"
  static var textNameCard = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
    letterSpacing: 0.1,
  );

// * FOR - any Alert :=
  static var titleAlert = GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static var contentAlert = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}

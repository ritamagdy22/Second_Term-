import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';
import 'package:smart_parking_app/common/helper/app_device_info.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';
import 'package:smart_parking_app/view/shared/cst_button.dart';

// ignore: must_be_immutable
class AppAlert extends StatelessWidget {
  String title;
  String content;
  String btnString;
  String pathImage;
  bool isSucc;
  VoidCallback continueCallBack;

  AppAlert({
    super.key,
    required this.title,
    required this.content,
    required this.continueCallBack,
    required this.btnString,
    required this.isSucc,
    required this.pathImage,
  });
  //TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: Image.asset(pathImage),
        content: SizedBox(
          width: AppDevInfo().si(context).width * 0.02,
          height: AppDevInfo().si(context).height * 0.1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  title,
                  style: AppStyles.titleAlert.copyWith(
                    color: isSucc
                        ? AppColors.colorSuccAlert
                        : AppColors.colorLikeRed,
                  ),
                ),
                Text(
                  content,
                  style: AppStyles.contentAlert,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          cstButton(
            context,
            text: btnString,
            onTap: continueCallBack,
          ),
        ],
      ),
    );
  }
}

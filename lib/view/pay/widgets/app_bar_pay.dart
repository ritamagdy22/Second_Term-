import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';
import 'package:smart_parking_app/common/helper/app_nav.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';

PreferredSizeWidget? appBarPay(BuildContext context) => AppBar(
      leading: FadeInLeft(
        child: GFIconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.colorLikeBlack,
          ),
          onPressed: () {
            AppNav.popFrom(context);
          },
          type: GFButtonType.transparent,
        ),
      ),
      title: FadeInDown(
        from: 30,
        child: Text(
          'Payment',
          style: AppStyles.titleNavBar,
        ),
      ),
    );

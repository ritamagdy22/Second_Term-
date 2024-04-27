import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';
import 'package:smart_parking_app/common/helper/app_const.dart';
import 'package:smart_parking_app/common/helper/app_nav.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';

import '../../common/helper/app_alert.dart';
import '../shared/cst_button.dart';

class ReviewSummaryUI extends StatelessWidget {
  const ReviewSummaryUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // Icons.arrow_back_sharp,
            color: AppColors.colorLikeBlack,
          ),
          onPressed: () => AppNav.popFrom(context),
          type: GFButtonType.transparent,
        ),
        title: Text(
          'Review Summary',
          style: AppStyles.titleNavBar,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(4, 6, 15, 0.05000000074505806),
                          offset: Offset(0, 4),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,

                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Date',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'December 16, 2024',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Duration',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '4 hours',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Hours',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '09.00 AM - 13.00 PM',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(4, 6, 15, 0.05000000074505806),
                          offset: Offset(0, 4),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Amount',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '\$8.00',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Taxes & Fees (10%)',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '\$0.8',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 97, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '\$8.08',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  letterSpacing: 0.20000000298023224,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(4, 6, 15, 0.05000000074505806),
                          offset: Offset(0, 4),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: 44,
                                height: 27,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/init_logo_card.png'),
                                      fit: BoxFit.fitWidth),
                                )),
                            const SizedBox(width: 12),
                            const Text(
                              '•••• •••• •••• •••• 4679',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(7, 7, 7, 1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(width: 10),
                      const Text(
                        'Change',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Urbanist',
                            fontSize: 16,
                            letterSpacing: 0.20000000298023224,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // FOR - last button L
            cstButton(
              context,
              text: "Confirm Payment",
              // onTap: () => AppNav.navToPayMethod(context),
              onTap: () {
                // ! AFTER - check op is done
                if (true) {
                  // ALERT-
                  AppAlert alert = AppAlert(
                    title: "Successfull!",
                    content: "You have successfully Reserved your park ",
                    continueCallBack: () => AppNav.navToTicket(context),
                    btnString: "OK",
                    isSucc: true,
                    pathImage: AppConst.pathSuuAlertImg,
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

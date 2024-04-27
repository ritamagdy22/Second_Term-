import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';
import 'package:smart_parking_app/common/helper/app_const.dart';
import 'package:smart_parking_app/common/helper/app_device_info.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../common/helper/app_nav.dart';

class TicketUI extends StatelessWidget {
  const TicketUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.colorLikeBlack,
          ),
          onPressed: () => AppNav.popFrom(context),
          type: GFButtonType.transparent,
        ),
        title: Text(
          'Your Ticket',
          style: AppStyles.titleNavBar,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 55, 58, 1),
          ),
          child: Center(
            child: TicketWidget(
              width: AppDevInfo().si(context).width * 0.9,
              height: AppDevInfo().si(context).height * 0.7,
              isCornerRounded: true,
              padding: const EdgeInsets.all(20),
              child: const TicketData(),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1.0, color: Colors.green),
                ),
                child: const Center(
                  child: Text(
                    'Business Class',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              //   const Row(
              //     children: [
              //       Text(
              //         'LHR',
              //         style: TextStyle(
              //             color: Colors.black, fontWeight: FontWeight.bold),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(left: 8.0),
              //         child: Icon(
              //           Icons.flight_takeoff,
              //           color: Colors.pink,
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(left: 8.0),
              //         child: Text(
              //           'ISL',
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //       )
              //     ],
              //   )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              'Parking Ticket',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ticketDetailsWidget(
                  'Rang Time',
                  '4 hours',
                  'Start-Date',
                  'December 16, 2024',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ticketDetailsWidget(
                    'Number',
                    '76836A45',
                    'End-Date',
                    'December 17, 2024',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                  child: ticketDetailsWidget(
                    'Class',
                    'Business',
                    'State',
                    'New',
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            AppConst.pathQRImg,
            width: AppDevInfo().si(context).width * 0.34,
            height: AppDevInfo().si(context).height * 0.34,
          ),
        ],
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:smart_parking_app/common/routes/name_routes.dart';
import 'package:smart_parking_app/view/card/card_view.dart';
import 'package:smart_parking_app/view/review%20summary/review_summary.dart';
import 'package:smart_parking_app/view/ticket/ticket_view.dart';

import '../../view/pay/pay_view.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> mapOfRoutes =
      <String, WidgetBuilder>{
    // NameRoutes.pathSplash: (context) => const SplashUi(),
    NameRoutes.pathPay: (context) => const PayUI(),
    NameRoutes.pathCredit: (context) => const CardUI(),
    NameRoutes.pathTicket: (context) => const TicketUI(),
    NameRoutes.pathReviewPayment: (context) => const ReviewSummaryUI(),
  };
}

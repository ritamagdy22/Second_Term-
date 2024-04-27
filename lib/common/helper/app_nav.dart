import 'package:flutter/material.dart';
import 'package:smart_parking_app/common/routes/name_routes.dart';

class AppNav {
  late BuildContext context;
  AppNav(
    this.context,
  );
  // LINK - TO -> POP From Any Location
  static Future<void> popFrom(BuildContext context) async =>
      Navigator.pop(context);

  //LINK - TO -> Create Credit Card (SC)
  static Future<Object?> navToCreditCard(BuildContext context) async =>
      // await Navigator.pushReplacementNamed(context, NameRoutes.pathCredit);
      await Navigator.pushNamed(context, NameRoutes.pathCredit);

  //LINK - TO -> Choose Payment Methods
  static Future<Object?> navToPayMethod(BuildContext context) async =>
      await Navigator.pushNamed(context, NameRoutes.pathPay);

  //LINK - TO -> Review Summary
  static Future<Object?> navToReviewSummary(BuildContext context) async =>
      await Navigator.pushNamed(context, NameRoutes.pathReviewPayment);

  //LINK - TO -> Get Ticket
  static Future<Object?> navToTicket(BuildContext context) async =>
      await Navigator.pushNamed(context, NameRoutes.pathTicket);
}

import 'package:flutter/material.dart';
import 'SplashScreen/SplashScreen.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home:SplashScreen(),

      //





    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:smart_parking_app/common/routes/app_route.dart';
import 'package:smart_parking_app/common/routes/name_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      //home: const PaymentUI(),
      initialRoute: NameRoutes.pathPay, //NameRoutes.pathSplash,
      routes: AppRouter.mapOfRoutes,
    );
  }
}

 */
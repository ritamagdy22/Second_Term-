import 'package:flutter/material.dart';

import '../widget/Custom_Button.dart';
import '../Ai_Price_Parking/Price.dart';

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        const SizedBox(
          height: 70,
          width: 70,
        ),
        Image.asset(
          "assets/images/BookNow.png",
          width: 300,
          height: 300,
        ),
        const SizedBox(
          height: 40,
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
            title: "Book Now",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ParkingDetails(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

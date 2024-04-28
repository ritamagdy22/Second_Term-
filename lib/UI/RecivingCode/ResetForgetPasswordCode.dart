import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widget/AppBarDetails.dart';

class Recivingcode extends StatelessWidget {
  const Recivingcode({super.key});

  static const RecivingCode = "RecivingCode";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Verification code",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                    "Please Enter Verificaton code that had been sent to your email",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),

/*
const SizedBox(
                  height: 12,
                ),
                  const Text(
                    "Please Enter Verificaton code that had been sent to your email",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    
                    )
                    ),
*/

                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: const TextSpan(
                      text: "----- @gmail.com",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "Change Phone number?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ))
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

InputDecoration textFormFieldDecoration = InputDecoration(
  hintText: "0",
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.black87,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      width: 3,
      color: Colors.black87,
    ),
  ),
);

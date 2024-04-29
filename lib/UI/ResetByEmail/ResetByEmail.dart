import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCode.dart';
import 'package:smart_parking_app/widget/Custom_Button.dart';
import 'package:smart_parking_app/widget/Form_Label_Widget.dart';
import 'package:smart_parking_app/widget/custom_Text_FormField.dart';

class ResetByEmail extends StatefulWidget {
  @override
  State<ResetByEmail> createState() => _ResetByEmailState();
}

class _ResetByEmailState extends State<ResetByEmail> {
  static const ResetByEmail = "ResetByEmail";

  TextEditingController ResetByEmailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FormLabelWidget(Label: "Email Address"),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Form(
                key: formKey,
                child: CustomTextFormField(
                    isPassword: false,
                    Type: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter your Email";
                      }
                      var emailvalid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailvalid) {
                        return "Email not valid";
                      }
                      return null;
                    },
                    controller: ResetByEmailController,
                    hintText: "Please Enter Your Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 220),
                  // Adjust the left padding as needed
                  child: CustomButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Recivingcode(),
                            ));
                      }))
            ]),
          ),
        ));
  }
}









/*
                  Form(
                    key: formkey,
                    child: CustomTextFormField(
                        isPassword: false,
                        Type: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter your Email";
                          }
                          var emailvalid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailvalid) {
                            return "Email not valid";
                          }
                          return null;
                        },
                        controller: emailcontroller,
                        hintText: "Please Enter Your Email"),
                  ),

*/
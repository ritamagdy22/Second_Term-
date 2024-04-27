import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/RegisterScreen/RegisterNavigator.dart';
import 'package:smart_parking_app/UI/RegisterScreen/RegisterScreen_ViewModel.dart';
import 'package:smart_parking_app/widget/DialogUtils.dart';

import '../../Book_Now/Parking_Details.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/Form_Label_Widget.dart';
import '../../widget/custom_Text_FormField.dart';

class FillYourInformation extends StatefulWidget {
  static const RouteName = "SignInScreen";

  FillYourInformation({super.key});

  @override
  State<FillYourInformation> createState() => _FillYourInformationState();
}

class _FillYourInformationState extends State<FillYourInformation>
    implements RegisterNavigator {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(injectAuthRepository());

  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;

    //          create: (context) => viewModel,

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Handle the action when the back arrow is pressed
            },
          ),
        ),
        body: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/SignUpText.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 30,
                                width: 10,
                              ),
                              FormLabelWidget(Label: "Name"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  Type: TextInputType.name,
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return "Please Enter your Name";
                                    } else {
                                      null;
                                      return null;
                                    }
                                  },
                                  controller: namecontroller,
                                  hintText: "Enter Your Name"),
                              const SizedBox(
                                height: 30,
                                width: 10,
                              ),
                              FormLabelWidget(Label: "Email Address"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
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
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(Label: "Phone Number"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  Type: TextInputType.phone,
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return "Please Enter your phone Number";
                                    }
                                    if (text.trim().length < 10) {
                                      return "Phone number must be 10 numbers.";
                                    }
                                    return null;
                                  },
                                  controller: phonecontroller,
                                  hintText: "Please Enter your Phone number"),
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(Label: "Password"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                  Type: TextInputType.visiblePassword,
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return "Please Enter your Password";
                                    }
                                    if (text.length < 6) {
                                      return " Phone number must be more than 6 charc.";
                                    }
                                    return null;
                                  },
                                  controller: passwordcontroller,
                                  hintText: "Please Enter your Password"),
                              const SizedBox(
                                height: 20,
                                width: 10,
                              ),
                              FormLabelWidget(Label: "Confirm Password"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomTextFormField(
                                  Type: TextInputType.visiblePassword,
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return "Please Enter Confirmation Password";
                                    }
                                    if (confirmPasswordController.text !=
                                        text) {
                                      return "Password Dosen't Match";
                                    }
                                    return null;
                                  },
                                  controller: confirmPasswordController,
                                  hintText: "Confirm Your Password"),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              CustomButton(
                                title: "Sign Up",
                                onPressed: () {
                                  // Register FUnction
                                  Register();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ParkingDetails()),
                                  );
                                  // Perform login logic here using the email and password
                                },
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void Register() {
    if (formkey.currentState?.validate() != true) {
      return;
    }
    
      viewModel.Register(
          namecontroller.text,
          phonecontroller.text,
          emailcontroller.text,
          passwordcontroller.text,
          confirmPasswordController.text);
    
  }

  @override
  void hideLoading() {
    // hidloading implementation didn't work yet
    Text("HideLoading");
  }

  @override
  void showLoading() {
    // TODO: implement showLoading

    DialogUtils.showProgress(context, "Loading");
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    // TODO: implement showMessage

    DialogUtils.showMessage(context, message, posAction: posAction);
  }
}

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/LoginScreen/LoginNavigator.dart';
import 'package:smart_parking_app/UI/LoginScreen/LoginViewModel.dart';
import 'package:smart_parking_app/widget/DialogUtils.dart';
import '../../Ai_Price_Parking/Price.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/Form_Label_Widget.dart';
import '../../widget/custom_Text_FormField.dart';
import '../ForgetPassword/ForgetPassword.dart';
import '../RegisterScreen/Register_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleGoogleSignIn() async {
    try {
      await googleSignIn.signIn();
      // After signing in, perform actions or navigate to relevant screens
    } catch (error) {
      print('Google Sign-In error: $error');
    }
  }

  LoginViewModel ViewModel = LoginViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => ViewModel,
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
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/LoginText.png',
                      alignment: Alignment.center),
                  const SizedBox(
                    height: 30,
                  ),
                  FormLabelWidget(Label: "Email Address"),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),


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
                  CustomButton(
                      title: "Login",
                      onPressed: () {
                        Login();

                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPAssword(),
                            ));
                      },
                      child: const Text("Forget Password ?"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FillYourInformation(),
                              ));
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // need google sign in image not text
                      ElevatedButton(
                        onPressed: _handleGoogleSignIn,
                        child: Image.asset('assets/images/GoogleLoogle.png'),
                      ),

                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    //Done
    Navigator.pop(context);

  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        isDismissible: isDismissible,
        negAction: negAction,
        posAction: posAction,
        posActionTitle: posActionTitle);
  }

  @override
  Future<void> navigate() async {
    // hide the success dialog
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ParkingDetails(),
        ));
  }

  void Login() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      ViewModel.Login(emailcontroller.text, passwordcontroller.text);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smart_parking_app/common/helper/app_colors.dart';
import 'package:smart_parking_app/common/helper/app_device_info.dart';
import 'package:smart_parking_app/common/helper/app_nav.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';
import 'package:smart_parking_app/view/shared/cst_button.dart';

class CardUI extends StatefulWidget {
  const CardUI({super.key});

  @override
  State<CardUI> createState() => _CardUIState();
}

class _CardUIState extends State<CardUI> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          'New Card',
          style: AppStyles.titleNavBar,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CreditCardWidget(
                  // textStyle: AppStyles.initCard,
                  chipColor: AppColors.colorChipCard,
                  enableFloatingCard: useFloatingAnimation,
                  glassmorphismConfig: _getGlassmorphismConfig(),
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: 'Debit',
                  padding: AppDevInfo().si(context).width * 0.05,
                  frontCardBorder:
                      useGlassMorphism ? null : Border.all(color: Colors.grey),
                  backCardBorder:
                      useGlassMorphism ? null : Border.all(color: Colors.grey),
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor:
                      isLightTheme ? Colors.teal : Colors.deepOrangeAccent,
                  backgroundImage:
                      useBackgroundImage ? 'assets/images/card_bg.png' : null,
                  //isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                ),
                // ?-# FORM =
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          expiryDate: expiryDate,
                          inputConfiguration: InputConfiguration(
                            cvvCodeTextStyle: AppStyles.styleInputF,
                            cardHolderTextStyle: AppStyles.styleInputF,
                            cardNumberTextStyle: AppStyles.styleInputF,
                            expiryDateTextStyle: AppStyles.styleInputF,
                            cardHolderDecoration: const InputDecoration(
                              labelText: 'Card Holder',
                            ),
                            cardNumberDecoration: const InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                            ),
                            expiryDateDecoration: const InputDecoration(
                              labelText: 'Expiration Date',
                              hintText: 'MM/YY',
                            ),
                            cvvCodeDecoration: const InputDecoration(
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        // cstButton(text: "Add New Card"),
                      ],
                    ),
                  ),
                ),
                cstButton(
                  context,
                  text: "Add New Card",
                  // onTap: () => AppNav.navToPayMethod(context),
                  onTap: () => AppNav.navToReviewSummary(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return isLightTheme
        ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
        : Glassmorphism.defaultConfig();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

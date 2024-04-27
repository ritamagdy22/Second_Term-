import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_app/common/helper/app_device_info.dart';
import 'package:smart_parking_app/common/helper/app_style.dart';
import 'package:smart_parking_app/common/models/method_pay.dart';
import 'package:smart_parking_app/view/shared/cst_button.dart';

import '../card/card_view.dart';
import '../review summary/review_summary.dart';
import 'widgets/app_bar_pay.dart';

class PayUI extends StatefulWidget {
  const PayUI({super.key});

  @override
  State<PayUI> createState() => _PayUIState();
}

class _PayUIState extends State<PayUI> {
  int selectedTool = 0;

  final List<MethodPayMD> tools = [
    MethodPayMD(
      img: "assets/gif/ic-apple.png",
      imgGIF: "assets/gif/apple.gif",
      name: 'Apple Pay',
    ),
    MethodPayMD(
      img: "assets/gif/ic-google.png",
      imgGIF: "assets/gif/google.gif",
      name: 'Google Pay',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPay(context),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //LINK - title in view:
            FadeInDown(
              from: 50,
              child: Text(
                "Choose Payment Methods",
                style: AppStyles.midTitle18Bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //LINK - list of items:
            itemsOfList(),

            // FOR - Add New Card :
            cstButton(
              context,
              bgColor: Colors.grey.shade300,
              iconBeforeText: Icons.add_circle_outline_outlined,
              text: "Add New Card",
              textStyle: AppStyles.forTextAnyButtonDark,
              onTap: () => Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => const CardUI(),
                ),
              ),
            ),

            SizedBox(
              height: AppDevInfo().si(context).height * 0.02,
            ),
            // FOR - last button L
            cstButton(
              context,
              text: "Pay now",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewSummaryUI(),)
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemsOfList() => SizedBox(
        height: AppDevInfo().si(context).height * 0.3,
        child: ListView.builder(
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTool = index;
                });
              },
              child: FadeInUp(
                delay: Duration(milliseconds: index * 100),
                child: AnimatedContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 20),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: selectedTool == index
                            ? Colors.blue
                            : Colors.white.withOpacity(0),
                        width: 2),
                    boxShadow: [
                      selectedTool == index
                          ? BoxShadow(
                              color: Colors.blue.shade100,
                              offset: const Offset(0, 3),
                              blurRadius: 10)
                          : BoxShadow(
                              color: Colors.grey.shade200,
                              offset: const Offset(0, 3),
                              blurRadius: 10)
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: AppDevInfo().si(context).height * 0.1,
                        width: AppDevInfo().si(context).width * 0.2,
                        child: selectedTool == index
                            ? Image(
                                image: AssetImage(
                                  tools[index].imgGIF,
                                ),
                              )
                            : Image.asset(
                                tools[index].img,
                              ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tools[index].name,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color:
                            selectedTool == index ? Colors.blue : Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
}

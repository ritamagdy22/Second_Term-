import 'package:flutter/material.dart';
import '../view/pay/pay_view.dart';
import '../view/ticket/ticket_view.dart';
import 'ParkingHistory.dart';
import 'book_now_screen.dart';

class BookNow extends StatefulWidget {
  const BookNow({super.key});

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) =>tabs[selectedIndex] ,),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  selectedIndex=0;
                });
              },
              child: const Column(
                children: [
                  Icon(Icons.home, size: 31),
                  Text(
                    "Home",
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  selectedIndex=1;
                });
              },
              child: const Column(
                children: [
                  Icon(Icons.search),
                  Text(
                    "History",
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                 selectedIndex=2;
                });
              },
              child: const Column(
                children: [
                  Icon(Icons.book_online),
                  Text(
                    "Book",
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                 ///selectedIndex=3;
                });
              },
              child: const Column(
                children: [
                  Icon(Icons.airplane_ticket),
                  Text(
                    "Ticket",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [

    const BookNowScreen(),
    const ParkingHistory(),
    const PayUI(),
    const TicketUI()


  ];
}

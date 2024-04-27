import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../view/pay/pay_view.dart';
import '../widget/Custom_Button.dart';

class ParkingDetails extends StatefulWidget {
  static const routename = "ParkingDetails";

  const ParkingDetails({super.key});

  @override
  _ParkingDetailsState createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails> {
  double _currentSliderValue = 20;

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final Map<DateTime, List<dynamic>> _events = {}; // Your events map

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;


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
      body: Column(
        children: [
          const Text(
            "Select Date",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,

            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay ?? selectedDay;
              });
            },

            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _getEventsForDay(day);

            },
            // events: _events, // Pass your events map here
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Duration",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,


                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                const Row(
                  children: [
                    Text("Start Date",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(width: 200),

                    Text("End Date",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20)),


                  ],
                ),
                Row(
                  children: [
                    Text(
                      'at:${DateFormat('h:mm a').format(DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateTime.now().toString()))}',
                      style: const TextStyle(color: Colors.indigo, fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                ElevatedButton(onPressed: (){},
                    child: const Text(" --\$", style: TextStyle(
                      fontSize: 24),)),

                const SizedBox(height: 30),

                CustomButton(
                  title: "Pay Now",
                  onPressed: () {
                // need name of payment screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PayUI(),
                      ),
                    );

                  },
                ),
               // BottomNavigationBarDetails()
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    // Implement logic to fetch events for the given day from your data source
    return _events[day] ?? [];
  }
}


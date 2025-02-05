import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking_app/Ai_Price_Parking/PriceNavigator.dart';
import 'package:smart_parking_app/Ai_Price_Parking/PriceViewModel.dart';
import 'package:smart_parking_app/ApiManager/Request/PriceRequestModel.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:time/time.dart';
import '../view/pay/pay_view.dart';
import '../widget/Custom_Button.dart';
import '../widget/DialogUtils.dart';
import 'package:time_range_picker/time_range_picker.dart';

class ParkingDetails extends StatefulWidget {
  static const routename = "ParkingDetails";

  const ParkingDetails({Key? key}) : super(key: key);

  @override
  _ParkingDetailsState createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails>
    implements ParkingPriceNavigator {
  double _currentSliderValue = 20;

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final Map<DateTime, List<dynamic>> _events = {}; // Your events map

  TimeOfDay _endTime = TimeOfDay.now();
  TimeOfDay _startTime = TimeOfDay.now();
  ParkingViewModel viewModel = ParkingViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;

    return ChangeNotifierProvider<ParkingViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Date of the day",
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    const SizedBox(height: 40),

                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _selectEndTime,
                        icon: Icon(
                          Icons.access_time, // Icon representing time
                          color: Colors.blue, // Icon color
                        ),
                        label: Text(
                          'Select Start and End Time', // Button label
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Button border radius
                            side: BorderSide(
                                color: Colors.blue), // Button border color
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    CustomButton(
                      title: "Pay Now",
                      onPressed: () {
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
        ),
      ),
    );
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    // Implement logic to fetch events for the given day from your data source
    return _events[day] ?? [];
  }

  Future<void> _selectStartTime() async {
    final TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
    );
    if (pickedStartTime != null) {
      setState(() {
        _startTime = pickedStartTime;
      });
      // final TimePickerPrice = PriceRequestModel(
      //   hourIn: _startTime.hour.toString(),
      //   minuteIn: _startTime.minute.toString(),
      //   day: DateTime.now().day.toString(),
      //   month: DateTime.now().month.toString(),
      // );
    }
  }

  Future<void> _selectEndTime() async {
    await _selectStartTime();

    final TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (pickedEndTime != null) {
      setState(() {
        _endTime = pickedEndTime;
      });

      // Construct PriceRequestModel using the selected start time and end time
      final priceObject = PriceRequestModel(
        hourIn: _startTime.hour.toString(),
        minuteIn: _startTime.minute.toString(),
        day: DateTime.now().day.toString(),
        month: DateTime.now().month.toString(),
        hourOut: _endTime.hour.toString(),
        minuteOut: _endTime.minute.toString(),
      );

      // Call viewModel.Price with the constructed PriceRequestModel
      viewModel.Price(priceObject);
    }
  }

  @override
  void hideLoading() {
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
}

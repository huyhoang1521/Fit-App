import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/screens/workout/workout_overview.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

final _selectedDay = DateTime.now();

//     _selectedEvents = _events[_selectedDay] ?? [];

// void _onDaySelected(DateTime day, List events, List holidays) {
//     print('CALLBACK: _onDaySelected');
//     setState(() {
//       _selectedEvents = events;
//     });
//   }

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events = {
    _selectedDay.add(Duration(days: 1)): ['Strength'],
    _selectedDay.subtract(Duration(days: 1)): ['Hypertrophy'],
    _selectedDay.subtract(Duration(days: 3)): ['Endurance'],
  };
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Let's Do This!",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  weekendDays: [],
                  headerVisible: false,
                  calendarFormat: CalendarFormat.twoWeeks,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Length:'),
                    Text('45 mins'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Main Focus:'),
                    Text('Push Muscles'),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: 0.75 * _width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      // child: FlatButton(
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      //   color: kPrimaryColor,
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => WorkoutOverview()),
                      //     );
                      //   },
                      //   child: Text('Start Workout!'),
                      // ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutOverview()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          primary: kPrimaryColor,
                        ),
                        child: Text('Start Workout!'),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

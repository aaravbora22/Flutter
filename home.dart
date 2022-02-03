import 'package:flutter/material.dart';
import 'package:world_time_app/screens/home/authenticate/models/LineChartData.dart';
import 'package:world_time_app/services/auth.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'Forms/BuySharesForm.dart';

final AuthService _auth = AuthService();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  String taskPop = "close";
  var monthNames = [
    "Janurary",
    "Feburary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  CalendarController yeet = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            backgroundColor: Color(0xfff96060),
            elevation: 0,
            title: Text(
              "Hi Zatrix!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //  Drawer(
                  //   child: ListView(
                  //     padding: EdgeInsets.zero,
                  //     children: <Widget>[
                  //       DrawerHeader(
                  //         child: Text('Drawer Header'),
                  //         decoration: BoxDecoration(
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //       ListTile(
                  //         title: Text('Item 1'),
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //       ),
                  //       ListTile(
                  //         title: Text('Item 2'),
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
                icon: Icon(
                  Icons.short_text,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ],
          ),
          Container(
            height: 70.0,
            color: Color(0xfff96060),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        changeFilter("today");
                      },
                      child: Text(
                        "Highest Shares",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 4.0,
                      width: 120.0,
                      color: (filterType == "today")
                          ? Colors.green
                          : Colors.transparent,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        changeFilter("monthly");
                      },
                      child: Text(
                        "Your Shares",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 4.0,
                      width: 120.0,
                      color: (filterType == "monthly")
                          ? Colors.blue
                          : Colors.transparent,
                    )
                  ],
                ),
              ],
            ),
          ),
          (filterType == "monthly")
              ? TableCalendar(
                  calendarController: yeet,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  initialCalendarFormat: CalendarFormat.week,
                )
              : Container(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  taskWidget(Color(0xfff96060), "TataMotors", "-221.34"),
                  taskWidget(Colors.green, "CHLOFIN", "223.01"),
                  taskWidget(Color(0xfff96060), "Tesla", "-888.19"),
                  taskWidget(Colors.green, "Axis Bank", "445.2001"),
                ],
              ),
            ),
          ),
        ]),
      ],
    ));
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () async {
    //     await _auth.signOut();
    //   },
    //   child: Icon(Icons.person),
    //   backgroundColor: Colors.green,
    // ),
  }

  openTaskPop() {
    taskPop = "open";
    setState(() {});
  }

  closeTaskPop() {
    taskPop = "close";
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          )
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 4),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ))
              ],
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "History",
          color: Colors.blue,
          icon: Icons.history,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AppBarLineChart()),
            );
          },
        ),
        IconSlideAction(
          caption: "Buy",
          color: Colors.green,
          icon: Icons.money,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => BuySharesForm()),
            );
          },
        ),
        IconSlideAction(
          caption: "Sell",
          color: Colors.red,
          icon: Icons.monetization_on,
          onTap: () {},
        ),
      ],
    );
  }
}

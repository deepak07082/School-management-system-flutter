import 'package:flutter/material.dart';
import 'package:school_management/Screens/Attendance/OverallAttendance.dart';
import 'package:school_management/Screens/Attendance/TodayAttendance.dart';
import 'package:school_management/Screens/home.dart';
import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/Widgets/MainDrawer.dart';
import 'package:school_management/Widgets/UserDetailCard.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: "Attendance",
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      drawer: Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
      body: SingleChildScrollView(
              child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserDetailCard(),
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black26,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(text: 'Today'),
                            Tab(text: 'Overall'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.68, //height of TabBarView
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: TabBarView(
                        children: <Widget>[
                          TodayAttendance(),
                          OverallAttendance(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
      
    );
  }
}

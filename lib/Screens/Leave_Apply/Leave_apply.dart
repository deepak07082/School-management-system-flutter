import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/Widgets/BouncingButton.dart';
import 'package:school_management/Widgets/LeaveApply/LeaveHistoryCard.dart';
import 'package:school_management/Widgets/LeaveApply/datepicker.dart';
import 'package:school_management/Widgets/MainDrawer.dart';

class LeaveApply extends StatefulWidget {
  @override
  _LeaveApplyState createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;
  final searchFieldController = TextEditingController();

  TextEditingController _applyleavecontroller;
  String _applyleavevalueChanged = '';
  String _applyleavevalueToValidate = '';
  String _applyleavevalueSaved = '';

  TextEditingController _fromcontroller;
  String _fromvalueChanged = '';
  String _fromvalueToValidate = '';
  String _fromvalueSaved = '';

  TextEditingController _tocontroller;
  String _tovalueChanged = '';
  String _tovalueToValidate = '';
  String _tovalueSaved = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    _applyleavecontroller =
        TextEditingController(text: DateTime.now().toString());
    _fromcontroller = TextEditingController(text: DateTime.now().toString());
    _tocontroller = TextEditingController(text: DateTime.now().toString());

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            new GlobalKey<ScaffoldState>();
        return Scaffold(
          key: _scaffoldKey,
          appBar: CommonAppBar(
            menuenabled: true,
            notificationenabled: false,
            title: "Apply Leave",
            ontap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          drawer: Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Apply Leave Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13,
                      ),
                      child: Container(
                        // height: height * 0.06,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Container(
                                width: width * 0.75,
                                child: DateTimePicker(
                                  type: DateTimePickerType.date,
                                  dateMask: 'dd/MM/yyyy',
                                  controller: _applyleavecontroller,
                                  //initialValue: _initialValue,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  calendarTitle: "Leave Date",
                                  confirmText: "Confirm",
                                  enableSuggestions: true,
                                  //locale: Locale('en', 'US'),
                                  onChanged: (val) => setState(
                                      () => _applyleavevalueChanged = val),
                                  validator: (val) {
                                    setState(
                                        () => _applyleavevalueToValidate = val);
                                    return null;
                                  },
                                  onSaved: (val) => setState(
                                      () => _applyleavevalueSaved = val),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0, 0),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Choose Leave Type",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (v) => v == null ? "required field" : null,
                        hint: "Please Select Leave type",
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: [
                          "Medical",
                          "Family",
                          "Sick",
                          'Function',
                          'Others'
                        ],
                        showClearButton: true,
                        onChanged: print,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Leave Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13,
                      ),
                      child: Container(
                        // height: height * 0.06,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  width: width * 0.28,
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 2,
                                          color: Colors.black26,
                                        )
                                      ]),
                                  child: CustomDatePicker(
                                    controller: _fromcontroller,
                                    title: "From",
                                    onchanged: (val) =>
                                        setState(() => _fromvalueChanged = val),
                                    validator: (val) {
                                      setState(
                                          () => _fromvalueToValidate = val);
                                      return null;
                                    },
                                    saved: (val) =>
                                        setState(() => _fromvalueSaved = val),
                                  ),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  width: width * 0.28,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        color: Colors.black26,
                                      )
                                    ],
                                  ),
                                  child: CustomDatePicker(
                                    controller: _tocontroller,
                                    title: "To",
                                    onchanged: (val) => setState(() {
                                      _tovalueChanged = val;
                                      print(val);
                                    }),
                                    validator: (val) {
                                      setState(() => _tovalueToValidate = val);
                                      return null;
                                    },
                                    saved: (val) =>
                                        setState(() => _tovalueSaved = val),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Apply Leave Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          // height: height * 0.06,
                          height: height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            //autofocus: true,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              suffixIcon: searchFieldController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () => WidgetsBinding.instance
                                          .addPostFrameCallback((_) =>
                                              searchFieldController.clear()))
                                  : null,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Attach Document",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {},
                          child: Text(
                            "Click Here",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Bouncing(
                        onPress: () {},
                        child: Container(
                          //height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Request Leave",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Text(
                              "Leave History",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () async {},
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Bouncing(
                        onPress: () {},
                        child: LeaveHistoryCard(
                          reason:
                              "this is sample reason.this is sample reason.this is sample reason.this is sample reason.",
                          enddate: "12.12.2020",
                          startdate: "11.12.2020",
                          status: "usual reason",
                          adate: "05.12.2020",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

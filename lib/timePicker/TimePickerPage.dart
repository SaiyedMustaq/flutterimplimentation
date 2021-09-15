import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({Key key}) : super(key: key);

  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  String _title;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TimeOfDay _timeOfDayTom = TimeOfDay(hour: 8, minute: 45);
  Function _updateTimeFunction;
  bool isStartShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*MaterialButton(
            onPressed: () {
              DateTimeRangePicker(
                  startText: "From",
                  endText: "To",
                  doneText: "Yes",
                  cancelText: "Cancel",
                  interval: 5,
                  initialStartTime: DateTime.now(),
                  initialEndTime: DateTime.now().add(Duration(days: 20)),
                  mode: DateTimeRangePickerMode.dateAndTime,
                  minimumTime: DateTime.now().subtract(Duration(days: 5)),
                  maximumTime: DateTime.now().add(Duration(days: 25)),
                  use24hFormat: true,
                  onConfirm: (start, end) {
                    print(start);
                    print(end);
                  }).showPicker(context);
            },
            child: Text('Bottom Picker'),
          ),*/
          /*MaterialButton(
            onPressed: () {
              BottomPicker.time(
                      title: "Start time",
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange),
                      onSubmit: (index) {
                        print(index);
                      },
                      onClose: () {
                        print("Picker closed");
                      },
                      bottomPickerTheme: BOTTOM_PICKER_THEME.ORANGE,
                      use24hFormat: true)
                  .show(context);
            },
            child: Text('Bottom Picker'),
          ),*/
          /*MaterialButton(
            onPressed: () {
              DatePicker.showTimePicker(context,
                  showTitleActions: true,
                  showSecondsColumn: false, onChanged: (date) {
                print('change $date in time zone ' +
                    date.timeZoneOffset.inHours.toString());
              }, onConfirm: (date) {
                print('confirm $date');
              }, currentTime: DateTime.now());
            },
            child: Text('Bottom Picker'),
          ),*/
          MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetWidget(
                      timeOfDayStart: _timeOfDay,
                      timeOfDayEnd: _timeOfDayTom,
                      isStartShow: isStartShow,
                    );
                  });
            },
            child: Text('Bottom Picker'),
          )
        ],
      ),
    );
  }

  Function openMyBottomSheet() {}

  void showBottomSheet({Function openSheet, bool isStartShow}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('Start Time');
                          isStartShow = !isStartShow;
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          height: 50,
                          child: Text('Start'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('End Time');
                          isStartShow = !isStartShow;
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('End'),
                          color: Colors.green,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isStartShow,
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 4,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime(
                                1969, 1, 1, _timeOfDay.hour, _timeOfDay.minute),
                            onDateTimeChanged: (DateTime newDateTime) {
                              var newTod = TimeOfDay.fromDateTime(newDateTime);
                              _updateTimeFunction(newTod);
                            },
                            use24hFormat: false,
                            minuteInterval: 1,
                          )),
                    ),
                    Visibility(
                      visible: !isStartShow,
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 4,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime(1969, 1, 1,
                                _timeOfDayTom.hour, _timeOfDayTom.minute),
                            onDateTimeChanged: (DateTime newDateTime) {
                              var newTod = TimeOfDay.fromDateTime(newDateTime);
                              _updateTimeFunction(newTod);
                            },
                            use24hFormat: false,
                            minuteInterval: 1,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class BottomSheetWidget extends StatefulWidget {
  TimeOfDay timeOfDayStart;
  TimeOfDay timeOfDayEnd;
  bool isStartShow;
  BottomSheetWidget(
      {Key key, this.timeOfDayStart, this.timeOfDayEnd, this.isStartShow})
      : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: MediaQuery.of(context).size.height / 2.3,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            color: Colors
                .grey[400], //widget.isStartShow ? Colors.grey : Colors.white,
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Start Time ${widget.isStartShow}');
                      setState(() {
                        widget.isStartShow = true;
                      });
                      print('Start Time ${widget.isStartShow}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.isStartShow
                              ? Colors.white
                              : Colors.grey[400],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0))),
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('Start'),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('End Time ${widget.isStartShow}');
                      setState(() {
                        widget.isStartShow = false;
                      });
                      print('End Time ${widget.isStartShow}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.0)),
                        color: widget.isStartShow
                            ? Colors.grey[400]
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text('End'),
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(children: [
            Opacity(
              opacity: widget.isStartShow ? 1 : 0.5,
              child: Visibility(
                visible: widget.isStartShow,
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 4,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime(
                        1969,
                        1,
                        1,
                        widget.timeOfDayStart.hour,
                        widget.timeOfDayStart.minute,
                      ),
                      onDateTimeChanged: (DateTime newDateTime) {
                        var newTod = TimeOfDay.fromDateTime(newDateTime);
                        //_updateTimeFunction(newTod);
                      },
                      use24hFormat: false,
                      minuteInterval: 1,
                    )),
              ),
            ),
            Opacity(
              opacity: widget.isStartShow ? 0.5 : 1,
              child: Visibility(
                visible: !widget.isStartShow,
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 4,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime(
                        1969,
                        1,
                        1,
                        widget.timeOfDayEnd.hour,
                        widget.timeOfDayEnd.minute,
                      ),
                      onDateTimeChanged: (DateTime newDateTime) {
                        var newTod = TimeOfDay.fromDateTime(newDateTime);
                        //_updateTimeFunction(newTod);
                      },
                      use24hFormat: false,
                      minuteInterval: 1,
                    )),
              ),
            ),
          ]),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 60,
            color: Colors.green,
            child: Text('Use'),
          )
          // Row(
          //   children: [
          //     widget.isStartShow
          //         ? Expanded(
          //             child: Opacity(
          //               opacity: widget.isStartShow ? 1 : 0.5,
          //               child: Visibility(
          //                 visible: true,
          //                 child: Container(
          //                     width: widget.isStartShow ? double.infinity : 0,
          //                     color: Colors.white,
          //                     height: MediaQuery.of(context).size.height / 4,
          //                     child: CupertinoDatePicker(
          //                       mode: CupertinoDatePickerMode.time,
          //                       initialDateTime: DateTime(
          //                           1969,
          //                           1,
          //                           1,
          //                           widget.timeOfDayStart.hour,
          //                           widget.timeOfDayStart.minute),
          //                       onDateTimeChanged: (DateTime newDateTime) {
          //                         var newTod =
          //                             TimeOfDay.fromDateTime(newDateTime);
          //                         //_updateTimeFunction(newTod);
          //                       },
          //                       use24hFormat: false,
          //                       minuteInterval: 1,
          //                     )),
          //               ),
          //             ),
          //           )
          //         : Expanded(
          //             child: Opacity(
          //               opacity: widget.isStartShow ? 0.5 : 1,
          //               child: Visibility(
          //                 visible: true,
          //                 child: Container(
          //                     width: widget.isStartShow ? double.infinity : 0,
          //                     color: Colors.green,
          //                     height: MediaQuery.of(context).size.height / 4,
          //                     child: CupertinoDatePicker(
          //                       mode: CupertinoDatePickerMode.time,
          //                       initialDateTime: DateTime(
          //                           1969,
          //                           1,
          //                           1,
          //                           timeOfDayone.hour,
          //                           timeOfDayone
          //                               .minute //widget.timeOfDayEnd.hour,
          //                           //widget.timeOfDayEnd.minute
          //                           ),
          //                       onDateTimeChanged: (DateTime newDateTime) {
          //                         var newTod =
          //                             TimeOfDay.fromDateTime(newDateTime);
          //                         //_updateTimeFunction(newTod);
          //                       },
          //                       use24hFormat: false,
          //                       minuteInterval: 1,
          //                     )),
          //               ),
          //             ),
          //           ),
          //     /*Expanded(
          //       child: Opacity(
          //         opacity: widget.isStartShow ? 0.5 : 1,
          //         child: IgnorePointer(
          //           ignoring: widget.isStartShow,
          //           child: Container(
          //               width: !widget.isStartShow ? double.infinity : 0,
          //               color: Colors.white,
          //               height: MediaQuery.of(context).size.height / 4,
          //               child: CupertinoDatePicker(
          //                 mode: CupertinoDatePickerMode.time,
          //                 initialDateTime: DateTime(
          //                     1969,
          //                     1,
          //                     1,
          //                     widget.timeOfDayEnd.hour,
          //                     widget.timeOfDayEnd.minute),
          //                 onDateTimeChanged: (DateTime newDateTime) {
          //                   var newTod = TimeOfDay.fromDateTime(newDateTime);
          //                   //_updateTimeFunction(newTod);
          //                 },
          //                 use24hFormat: false,
          //                 minuteInterval: 1,
          //               )),
          //         ),
          //       ),
          //     ),*/
          //   ],
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:pomodoro_app/service/local_notification_service.dart';
// import 'package:pomodoro_app/provider/mode_provider.dart';
// import 'package:pomodoro_app/provider/timer_provider.dart';
// import 'package:pomodoro_app/screen/SqlDataBase/tasks_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/timer/timer_model.dart';

import '../theme/theme_model.dart';

class TimerScreen extends StatefulWidget {
  // final bool isLight;
  //
  // TimerScreen(this.isLight, {super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final formateTimer = NumberFormat("00");

  //String _time = "Not set";

  List mins = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // IconButton(
            //     onPressed: () {
            //       // Provider.of<modeProvider>(context, listen: false)
            //       //     .changeMode();
            //     },
            //     icon: Icon(widget.isLight ? Icons.dark_mode : Icons.light_mode)
            // )
          ],
          // backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        body: Consumer<TimerProvider>(
            builder: (BuildContext context, value, Widget? child) =>
                Stack(children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        !Provider.of<ThemeModel>(context).lightModel
                            ? "asset/timer_light.jpeg"
                            : "asset/d2.jpeg"),
                  ))),
                  OrientationBuilder(builder: (context, orientaion) {
                    return orientaion == Orientation.portrait
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                child: Text(
                                  "Task",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => TaskScreen()),
                                  // );
                                },
                              ),
                              Center(
                                child: RepaintBoundary(
                                  child: CircularPercentIndicator(
                                    backgroundColor: Colors.white,
                                    progressColor:
                                        Provider.of<ThemeModel>(context)
                                                .lightModel
                                            ? Colors.blueGrey
                                            : Colors.purpleAccent,
                                    radius:
                                        MediaQuery.sizeOf(context).width / 3,
                                    // lineWidth: 10.0,
                                    percent:
                                        value.percent / (value.totaltime * 60),
                                    center: value.isRunning
                                        ? Text(
                                            "${formateTimer.format(value.min)} :  ${formateTimer.format(value.sec)}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                fontSize: 40),
                                          )
                                        : CupertinoPicker(
                                            itemExtent: 80,
                                            onSelectedItemChanged: (int index) {
                                              print('index $index');
                                              value.min = mins[index];
                                              //value.sec = time.second;
                                              value.totaltime = value.min;
                                              setState(() {
                                                print(value.isRunning);
                                              });
                                            },
                                            children: mins
                                                .map((items) => Center(
                                                        child: Text(
                                                      "${items}",
                                                      style: TextStyle(
                                                          fontSize: 60),
                                                    )))
                                                .toList(),
                                          ),
                                    // progressColor:
                                    //     Theme.of(context).colorScheme.tertiary
                                  ),
                                ),
                              ),
                              !value.isStart
                                  ? Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.play_arrow,
                                            size: 40,
                                          ),
                                          onPressed: () {
                                            value.startTimer();
                                            // LocalNotificationService()
                                            //     .scheduleNotification(
                                            //     title: "pomodoro app",
                                            //     body:
                                            //     "Bravo , you deserve a break for 5 mins ",
                                            //     payload: "mmm",
                                            //     scheduledNotificationDateTime:
                                            //     value.min);
                                          },
                                          label: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Start to  Focus",
                                                style: TextStyle(fontSize: 20)),
                                          )),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                            icon: Icon(
                                              value.isRunning
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              value.isRunning
                                                  ? value.pauseTimer()
                                                  : value.startTimer();
                                            },
                                            label: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                  value.isRunning
                                                      ? "Pause"
                                                      : "resume",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            )),
                                        ElevatedButton.icon(
                                            icon: Icon(
                                              Icons.stop,
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              value.stopTimer();
                                            },
                                            label: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Stop",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            )),
                                      ],
                                    ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pomodoro",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                    radius:
                                        MediaQuery.sizeOf(context).height / 4,
                                    // lineWidth: 10.0,
                                    percent:
                                        value.percent / (value.totaltime * 60),
                                    center: Text(
                                      "${formateTimer.format(value.min)} :  ${formateTimer.format(value.sec)}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 30),
                                    ),
                                    progressColor:
                                        Theme.of(context).colorScheme.tertiary),
                              ),
                              !value.isStart
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.play_arrow,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            value.startTimer();
                                            // LocalNotificationService()
                                            //     .scheduleNotification(
                                            //   title: "notification ",
                                            //   body:
                                            //   " Congratulation the  notification is decremented ",
                                            //   scheduledNotificationDateTime:
                                            //   value.min,
                                            // );
                                          },
                                          label: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Start to  Focus",
                                                style: TextStyle(fontSize: 18)),
                                          )),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                            icon: Icon(
                                              value.isRunning
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              value.isRunning
                                                  ? value.pauseTimer()
                                                  : value.startTimer();
                                            },
                                            label: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                  value.isRunning
                                                      ? "Pause"
                                                      : "resume",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            )),
                                        ElevatedButton.icon(
                                            icon: Icon(
                                              Icons.stop,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              value.stopTimer();
                                            },
                                            label: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Stop",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            )),
                                      ],
                                    ),
                            ],
                          );
                  })
                ])));
  }
}

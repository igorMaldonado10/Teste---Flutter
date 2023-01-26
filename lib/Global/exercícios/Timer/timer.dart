import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({Key? key}) : super(key: key);

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  double percent = 0.0;
  Timer? timer;

  _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        percent += 10;
        if (percent >= 100) {
          timer.cancel();
          percent = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).highlightColor,
              Theme.of(context).backgroundColor
            ]
            )
            ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Cronômetro',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 65,
            ),

            Column(
              children: [
                SingleChildScrollView(
                  child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent/100,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 150.0,
                    lineWidth: 15,
                     progressColor: Colors.white,
                    center: Text(
                  '$percent',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 50.0),
            Padding(padding: EdgeInsets.only(bottom: 45)),

            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)
                    ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                     SizedBox(width: 10,),   
                    Column(
                      children: [
                    Text(
                      'Descanso',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '$percent',
                      style: TextStyle(fontSize: 80),
                    )
                      ],
                    ),
                    SizedBox(width: 80,),
                    Column(
                      children: [
                    Text(
                      'Pausa',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '5',
                      style: TextStyle(fontSize: 80),
                    )
                      ],
                    ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _startTimer,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).backgroundColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)))),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Começar',
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),    
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}

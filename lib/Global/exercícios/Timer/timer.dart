import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({Key? key}) : super(key: key);

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  // lógica do página
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  double percent = 0.0;
  Timer? timer;
  bool started = false;
  List marcas = [];

  // função para parar o timer
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

//  Função para resetar o timer
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";
    });
  }

  void addMarcas() {
    String marca = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      marcas.add(marca);
    });
  }

  // Função para startar o timer
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        hours += 1;
        if (hours <= 60) {
          timer.cancel();
          // percent = 0.0;
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
            ])),
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
                  child: Center(
                    child: Text(
                      // '$percent',
                      '$digitHours:$digitMinutes:$digitSeconds',
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 50.0),
            Padding(padding: EdgeInsets.only(bottom: 10)),

            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    height: 360,
                    decoration: BoxDecoration(
                        color: Theme.of(context).hoverColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: ListView.builder(
                      itemCount: marcas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Marca nº${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  )),
                              Text('${marcas[index]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: RawMaterialButton(
                        onPressed: () {
                          (!started) ? start() : stop();
                        },
                        fillColor: Theme.of(context).backgroundColor,
                        shape: StadiumBorder(side: BorderSide()),
                        child: Text((!started) ? 'Start' : 'Pause'),
                      )),
                      SizedBox(width: 8.0),
                      IconButton(
                          onPressed: () {
                            addMarcas();
                          },
                          icon: Icon(Icons.flag)),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: RawMaterialButton(
                        onPressed: () {
                          reset();
                        },
                        fillColor: Theme.of(context).backgroundColor,
                        shape: StadiumBorder(side: BorderSide()),
                        child: Text('Reset'),
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

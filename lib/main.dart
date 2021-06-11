import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_timer/correct_way.dart';
import 'package:provider_demo_timer/counter_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WrongWay(),
    );
  }
}

class WrongWay extends StatefulWidget {
  @override
  _WrongWayState createState() => _WrongWayState();
}

class _WrongWayState extends State<WrongWay> {

  var count = 60;

  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count--;

      });
    });

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    print('======== build executed =========');
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrong Way'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ChangeNotifierProvider(
                    create: (context) => CounterModel(),
                    child: CorrectWay());
              }));
            },
            child: Text('Correct Way'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.access_alarm,
              size: 200,
              color: Theme.of(context).primaryColor,
            ),
            Text('$count'),
          ],
        ),
      ),
    );
  }
}

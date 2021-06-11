import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_demo_timer/counter_model.dart';
import 'package:provider/provider.dart';

class CorrectWay extends StatefulWidget {
  @override
  _CorrectWayState createState() => _CorrectWayState();
}

class _CorrectWayState extends State<CorrectWay> {
  @override
  void initState() {
    var countModel = Provider.of<CounterModel>(context, listen: false);

    Timer.periodic(Duration(seconds: 1), (timer) {
      countModel.decrement();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correct Way'),
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.access_alarm,
              size: 200,
              color: Theme.of(context).primaryColor,
            ),
            Consumer<CounterModel>(
              builder: (context, data, child) {
                return Text('${data.count}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

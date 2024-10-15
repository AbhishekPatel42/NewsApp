import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TramsCondition extends StatefulWidget {
  const TramsCondition({super.key});

  @override
  State<TramsCondition> createState() => _TramsConditionState();
}

class _TramsConditionState extends State<TramsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text("Detail Pages",style: TextStyle(color: Colors.teal)),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.teal))
      ),
      body: Center(
        child: const Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Data")
          ],
        ),
      ),
    );
  }
}

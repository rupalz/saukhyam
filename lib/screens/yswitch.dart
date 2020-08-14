import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/screens/home.dart';

class SwitchWhy extends StatefulWidget {
  @override
  _SwitchWhyState createState() => _SwitchWhyState();
}

class _SwitchWhyState extends State<SwitchWhy> {
  final scaffKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0),
              child: Center(child: Text('Why Switch',style:TextStyle(fontSize: MediaQuery.of(context).size.width/12,fontFamily: 'Montserrat',fontWeight: FontWeight.bold))),
            ),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: FutureBuilder(
                  future: rootBundle.loadString("assets/whySwitch.md"),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data);
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )

          ],
        )
    );
  }
}

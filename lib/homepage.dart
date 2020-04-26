import 'package:covid19cj/datasource.dart';
import 'package:covid19cj/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 TRACKER APP (JACKSON CHELOTE)'),
      ),

body: SingleChildScrollView(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Container(
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      color: Colors.orange[100],
      child: Text(DataSource.quote, style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold,fontSize: 25),),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 10),
      child: Text('Worldwide',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ),
    WorldwidePanel()
  ],
)),
    );
  }
}

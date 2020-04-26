import 'dart:convert';

import 'package:covid19cj/datasource.dart';
import 'package:covid19cj/panels/infopanel.dart';
import 'package:covid19cj/panels/mostaffectedcountries.dart';
import 'package:covid19cj/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldwideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countriesData;
  fetchCountriesData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldwideData();
    fetchCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 TRACKER',),
      ),

body: SingleChildScrollView(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[

//    Container(
//      height: 100,
//      alignment: Alignment.center,
//      padding: EdgeInsets.all(10),
//      color: Colors.orange[100],
//      child: Text(DataSource.quote, style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold,fontSize: 25),),
//    ),
    SizedBox(height:2,),
    Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10),
      child: WorldwideText(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          //Text('Worldwide',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical:8.0),
//            child: WorldwideText(),
//          ),
////          Container(
////              decoration: BoxDecoration(
////                color: primaryBlack,
////                borderRadius: BorderRadius.circular(15)
////              ),
////              padding: EdgeInsets.all(9),
////              child: Text('Regional',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),)),
//        ],
      ),
    ),

  

    worldData==null?CircularProgressIndicator():WorldwidePanel(worldData: worldData,),

//    Padding(
//      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 20),
//      child: Text('Most Affected Countries',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//    ),

  
    Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10),
      child: MostAffectedText(),
    ),
    SizedBox(height:2,),
    countriesData==null?Container():MostAffectedPanel(countriesData: countriesData,),
    SizedBox(height:2,),
    Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10),
      child: InfoPanel(),
    )

  ],
)),
    );
  }
}

import 'package:covid19cj/datasource.dart';
import 'package:covid19cj/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Roboto',
      primaryColor: primaryBlack,
  ),
    home: HomePage(),));

}
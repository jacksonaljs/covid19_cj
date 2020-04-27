import 'package:covid19cj/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs'),),
      body:  ListView.builder(itemBuilder: (context,index){
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question']),children: <Widget>[
          Text(DataSource.questionAnswers[index]['answer'])
        ],);
      }),
    );
  }
}

import 'package:covid19cj/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs'),),
      body:  ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(DataSource.questionAnswers[index]['answer'],style: TextStyle(fontSize: 14),),
          )
        ],);
      }),
    );
  }
}

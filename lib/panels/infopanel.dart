import 'package:covid19cj/datasource.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            color: primaryBlack,
            child: Row(
              children: <Widget>[
                Text('   FAQS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                Icon(Icons.arrow_forward,color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}



class MostAffectedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            color: primaryBlack,
            child: Row(
              children: <Widget>[
                Text('Most Affected Countries',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                Icon(Icons.arrow_downward,color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}


class WorldwideText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            color: primaryBlack,
            child: Row(
              children: <Widget>[
                Text('Worldwide Info',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                Icon(Icons.arrow_downward,color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
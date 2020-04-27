import 'package:covid19cj/datasource.dart';
import 'package:covid19cj/pages/countryPage.dart';
import 'package:covid19cj/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('COUNTRY WISE STATS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('FAQS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),


          GestureDetector(
            onTap: (){
              launch('https://pmnrf.gov.in/en/online-donation');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE TO PMNRF',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),


          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget>[
                  Text('MYTH BUSTERS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),

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
                Text('Most Affected Countries',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
                Text('Worldwide Info',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                Icon(Icons.arrow_downward,color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
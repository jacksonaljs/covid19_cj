import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {

  final List countriesData;

  const MostAffectedPanel({Key key, this.countriesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            children: <Widget>[
              Image.network(countriesData[index]['countryInfo']['flag'],height: 30,),
              SizedBox(width: 10,),
              Text(countriesData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(width: 10,),
              Text('Deaths:' + countriesData[index]['deaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
        );
      },
      itemCount: 5,),
    );
  }
}

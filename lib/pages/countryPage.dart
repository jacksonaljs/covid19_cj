import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countriesData;
  fetchCountriesData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Wise Stats'),
      ),
      body: countriesData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10 ),
            decoration: BoxDecoration(color: Colors.white,boxShadow: [
              BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10)),
            ]),
            child: Row(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 10),
                   child: Column (
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(countriesData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                       Image.network(countriesData[index]['countryInfo']['flag'],height: 80,width: 90,),
                     ],
                   ),
                 ),
                 Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('CONFIRMED:' + countriesData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 15),),
                        Text('ACTIVE:' + countriesData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 15),),
                        Text('RECOVERED:' + countriesData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 15),),
                        Text('DEATHS:' + countriesData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800],fontSize: 15),),
                      ],
                    ),
                 ))
               ],
            ),
          );
        },
        itemCount: countriesData == null ? 0 : countriesData.length,
      ),
    );
  }
}

import 'package:covid19cj/pages/search.dart';
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: Search(countriesData));
          },)
        ],
        title: Text('Country Wise Stats'),
      ),
      body: countriesData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              //color: Colors.black12 ,
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10 ),
//            decoration: BoxDecoration(color: Colors.white,boxShadow: [
//              BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10)),
//            ]),
              child: Row(
                 children: <Widget>[
                   Container(
                     width: 180,
                     margin: EdgeInsets.symmetric(horizontal: 10),
                     child: Column (
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(countriesData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                         Image.network(countriesData[index]['countryInfo']['flag'],height: 90,width: 80,),
                       ],
                     ),
                   ),
                   Expanded(child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('CONFIRMED:' + countriesData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
                          Text('ACTIVE:' + countriesData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20),),
                          Text('RECOVERED:' + countriesData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),
                          Text('DEATHS:' + countriesData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[500],fontSize: 20),),
                        ],
                      ),
                   ))
                 ],
              ),
            ),
          );
        },
        itemCount: countriesData == null ? 0 : countriesData.length,
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './widget/mostaffectedWorld.dart';
import './widget/services.dart';
import './widget/worldwide.dart';
import 'datasourse.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  void getData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  List contryData;
  void getContryData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/countries?sort=cases#");
    setState(() {
      contryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getContryData();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('COVID-19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.red[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ), 
         
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            ),
            worldData == null
                ?const CircularProgressIndicator()
                : AllworldDetails(
                    worldData: worldData,
                  ),
                   Padding(
            padding: const EdgeInsets.symmetric( vertical: 10),
            child: Text(
              'Most affected Countries',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
         const SizedBox(
            height: 10,
          ),
          contryData == null
                ? CircularProgressIndicator()
                : MostAffectedPanel(
                   countryData: contryData ,
                  ),
                  SizedBox(
            height: 10,
          ),
          ServicesList(),
         
          ],
          
        ),
      ),
    );
  }
}

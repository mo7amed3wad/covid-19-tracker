import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './countriesDetails.dart';
import './search.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List contryData;
  void getContryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries?sort=cases#");
    setState(() {
      contryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getContryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search ,color: Colors.white,), onPressed: (){
              showSearch<dynamic>(context: context , delegate: Search(contryData));
            })
          ],
          title: const Text("Countries "),
        ),
        body: contryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: contryData.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => CountriesDetails(
                                  id: contryData[index]['countryInfo']['_id'],
                                  country: contryData[index]['country'],
                                  flag: contryData[index]['countryInfo']
                                      ['flag'],
                                  cases: contryData[index]['cases'],
                                  todaycases: contryData[index]['todayCases'],
                                  deathes: contryData[index]['deaths'],
                                  todaydeathes: contryData[index]
                                      ['todayDeaths'],
                                  casesPerOneMillion: contryData[index]
                                      ['casesPerOneMillion'],
                                  deathsPerOneMillion: contryData[index]
                                      ['deathsPerOneMillion'],
                                  recovery: contryData[index]['recovered'],
                                  active: contryData[index]['active'],
                                )));
                  },
                  child: Hero(
                    tag: contryData[index]['country'],
                    child: Container(
                      padding: EdgeInsets.only(top:10),
                      height: 120,
                      decoration: BoxDecoration(
                        //  color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    contryData[index]['countryInfo']['flag']),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              contryData[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            /* Text(
                          'Deaths:' + contryData[index]['deaths'].toString(),
                          style:
                              TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ), */
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }));
  }
}

import 'package:flutter/material.dart';
import '../pages/countriesDetails.dart';

class Search extends SearchDelegate<dynamic>{

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';

     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
         =
           query.isEmpty?
           countryList:
           countryList.where((dynamic element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

   return ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context,index){
     return  GestureDetector(
                  onTap: () {
                    Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => CountriesDetails(
                                  id: suggestionList[index]['countryInfo']['_id'],
                                  country: suggestionList[index]['country'],
                                  flag: suggestionList[index]['countryInfo']
                                      ['flag'],
                                  cases: suggestionList[index]['cases'],
                                  todaycases: suggestionList[index]['todayCases'],
                                  deathes: suggestionList[index]['deaths'],
                                  todaydeathes: suggestionList[index]
                                      ['todayDeaths'],
                                  casesPerOneMillion: suggestionList[index]
                                      ['casesPerOneMillion'],
                                  deathsPerOneMillion: suggestionList[index]
                                      ['deathsPerOneMillion'],
                                  recovery: suggestionList[index]['recovered'],
                                  active: suggestionList[index]['active'],
                                )));
                  },
                  child: Hero(
                    tag: suggestionList[index]['country'],
                    child: Container(
                      padding: EdgeInsets.only(top:10),
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    suggestionList[index]['countryInfo']['flag']),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              suggestionList[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),
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
   });
  }

}
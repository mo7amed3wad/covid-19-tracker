import 'package:flutter/material.dart';

List contryData;
int index;

class CountriesDetails extends StatelessWidget {
  final int id;
  final int cases;
  final String country;
  final String flag;
  final int todaycases;
  final int deathes;
  final int todaydeathes;
  final int recovery;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int active;

   CountriesDetails(

      {@required this.id,
        this.flag,
      this.cases,
      this.todaycases,
      this.deathes,
      this.todaydeathes,
      this.recovery,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.country,
      this.active});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Country State"),
      ),
      body: Center(
       
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                
                 transitionOnUserGestures: true,
                 
                tag:country ,
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(flag,), fit: BoxFit.cover)),
                ),
              ),
                Text(
                country,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff202c3b),
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 200,
              padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
              
                child: Column(
                  children: <Widget>[
                    Text(
                      'CONFIRMED:  ' + cases.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 5,),
                     Text(
                'ACTIVE:  ' + active.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
                SizedBox(height: 5,),
              Text(
                'RECOVERED:  ' + recovery.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const  SizedBox(height: 5,),
              Text(
                'DEATHS:  ' + deathes.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red),
              ),
               const SizedBox(height: 5,),
                 Text(
                'todaycases:  '.toUpperCase() + todaycases.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
                SizedBox(height: 5,),
              Text(
                'todaydeathes:  '.toUpperCase() + todaydeathes.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
                Text(
                'casesPerOneMillion:  '.toUpperCase() + casesPerOneMillion.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
                SizedBox(height: 5,),
              Text(
                'deathsPerOneMillion:  '.toUpperCase() + deathsPerOneMillion.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
                SizedBox(height: 5,),
             
                  ],
                ),
              ),
             
            ],
          ),
        ),
      
    );
  }
}

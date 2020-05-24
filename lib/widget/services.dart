import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../pages/countries.dart';
import '../pages/faqs.dart';


class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton.icon(
              onPressed: () {
                Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => Countries()));
              },
              icon: Icon(Icons.language),
              label:const Text('Countries')
              ),
          GestureDetector(
            onTap: () {
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => FAQPage()));
            },
            child: Servises(
              maxis: MainAxisAlignment.spaceBetween,
              color: Colors.brown,
              title: "FAQs",
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  'https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Servises(
              maxis: MainAxisAlignment.spaceBetween,
              color: Colors.brown,
              title: "advices to avoid virusp",
            ),
          ),
          GestureDetector(
            onTap: () {
              launch('https://covid19responsefund.org/');
            },
            child: Servises(
              maxis: MainAxisAlignment.spaceBetween,
              color: Colors.brown,
              title: "Help to Fight CoronaVirus",
            ),
          ),
          /*  GestureDetector(
            onTap:(){
              Navigator.push<dynamic>(
                  context, MaterialPageRoute<dynamic>(builder: (BuildContext context) => Countries()));
            } ,
                      child: Servises(title: 'COUNTRIES',
            maxis: MainAxisAlignment.center,
            color: Colors.black,),
          ) */
        ],
      ),
    );
  }
}

class Servises extends StatelessWidget {
  final String title;
  final Color color;
  final MainAxisAlignment maxis;

  const Servises({Key key, this.title, this.color, this.maxis})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: maxis,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

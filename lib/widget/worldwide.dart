import 'package:flutter/material.dart';


class AllworldDetails extends StatelessWidget {
 const  AllworldDetails({this.worldData});
  final Map <dynamic,dynamic>worldData;

 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
      ),
      children: <Widget>[
        Panalstutas(
          title: 'CONFIRMED',
          containercolor: Colors.white,
          textcolor: Colors.grey[900],
          count: worldData['cases'].toString(),
          image: "images/thermometer.png",
        ),
        Panalstutas(
          title: 'ACTIVE',
          containercolor: Colors.white,
          textcolor: Colors.blue[900],
          image: "images/cough.png",
          count: worldData['active'].toString(),
        ),
        Panalstutas(
          title: 'RECOVERED',
          containercolor: Colors.white,
          textcolor: Colors.green,
          image: "images/heartbeat.png",
          count: worldData['recovered'].toString(),
        ),
        Panalstutas(
          title: 'DEATHS',
          containercolor: Colors.white,
          textcolor: Colors.red,
          image: "images/death.png",
          count: worldData['deaths'].toString(),
        ),
      ],
    ));
  }
}

class Panalstutas extends StatelessWidget {
  final String title;
  final Color containercolor;
  final Color textcolor;
  final String count;
  final String image;
  Panalstutas(
      {this.containercolor,
      this.count,
      this.textcolor,
      this.title,
      this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            color: containercolor, borderRadius: BorderRadius.circular(20)),
        margin:const EdgeInsets.all(8),
        width: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 45,
              width: 45
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Text(count,
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ))
          ],
        ));
  }
}

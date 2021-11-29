import 'dart:ui';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),

      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _weatherDescription(),
                Divider(
                  color: Colors.white,
                ),
                _temperature(),
                Divider(
                  color: Colors.white,
                ),
                _temperatureForecast(),
                _footerRatings()
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
      image: NetworkImage(
          "https://play-lh.googleusercontent.com/zoAQwsds7P2exgVXFUiV8faEmblggMeZ59pILSa9B1cCYwHD7PFExvHhdDZCvW1enpEY=w412-h220-rw"),
      fit: BoxFit.cover);
}

Column _weatherDescription() {
  return Column(
    children: <Widget>[
      Text('Tuesday, May 22',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          )),
      Divider(
        height: 10,
        color: Colors.white,
      ),
      Text('Some text about the weather at may, 22.'
          'It\'s sunny, temperature is 20°C. '),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text("22 °C clear "),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Moscow, Moscow obl."),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 6,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          "${index + 20} °C",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        // padding: EdgeInsets.all(10),
        backgroundColor: Colors.white30,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(4.0)),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade200,
        ),
      );
    }),
  );
}


Row _footerRatings() {
  var stars = Row(
    children: <Widget>[
      Icon(Icons.star,
        color: Colors.yellow,
      ),
      Icon(Icons.star,
        color: Colors.yellow,
      ),
      Icon(Icons.star,
        color: Colors.yellow,
      ),
      Icon(Icons.star,
        color: Colors.yellow,
      ),
      Icon(Icons.star,
        color: Colors.black,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,

    children: <Widget>[
      Text("Info with openweathermap.com",
      style: TextStyle(color: Colors.grey),),
      stars

    ],
  );

}





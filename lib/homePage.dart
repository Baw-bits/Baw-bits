// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, prefer_adjacent_string_concatenation, file_names

import 'package:bawaweathermap/GeoLocation.dart';
import 'package:bawaweathermap/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchResultPage.dart';

const apiKey = '4bcba4e1e9ec3aa845b10d6cc538a5d5';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? latitude;
  double? longitude;
  @override
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&appid=378ff5ef494d14109397354c0ea9436c");
    var weather = await networkHelper.getData();
    updateUI(weather);
  }

  void initState() {
    super.initState();
    getLocationData();
  }

  void updateUI(dynamic weatherData) {
    double current = weatherData['current']['temp'];
    String area = weatherData['timezone'];
    print(current);
    print(area);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7047EB),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TapIcons(),
          WeatherDisplay(),
          ReportButton(),
        ],
      ),
    );
  }
}

class TapIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Display();
              }));
            },
            child: Container(
              height: 43,
              width: 159,
              padding: EdgeInsets.only(left: 5, right: 10, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xFF7E59ED),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'Lagos, Nigeria',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              _notificationBottonSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF7E59ED),
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _notificationBottonSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ba) {
          return FractionallySizedBox(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 43,
                  width: 152,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD5D1E1),
                  ),
                  child: Center(
                    child: Text(
                      'Your Notifications ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF7047EB),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFFD5D1E1),
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: Image.asset("assets/sun4.png"),
                    title: Text("10 minutes ago"),
                    subtitle: Text(
                      "It's a sunny day in your Location",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'Earlier',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFFD5D1E1),
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: Image.asset("assets/sun4.png"),
                    title: Text("1 day ago"),
                    subtitle: Text(
                      "It's a sunny day in your Location",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: Image.asset("assets/sun4.png"),
                    title: Text("2 day ago"),
                    subtitle: Text(
                      "It's a sunny day in your Location",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class WeatherDisplay extends StatefulWidget {
  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF7E59ED),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48.94,
                    width: 78.71,
                    child: Image.asset("assets/weather.png"),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Mon, 26 Apr',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Text(
                  "29" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Lagos, Nigeria. 2:00p.m',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          _forecastInfoBottonSheet(context);
        },
        child: Container(
          height: 60.05,
          width: double.infinity,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF7E59ED),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 50),
                child: Center(
                  child: Text(
                    'Forecast report ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image.asset("assets/up.png")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _forecastInfoBottonSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: 0.7,
        child: Column(
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 43,
                width: 152,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD5D1E1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forecast report ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF7047EB),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Image.asset("assets/down.png")],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: Color(0xFF7047EB)),
              ),
              child: WeatherWidget(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Next forecast',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  width: 100,
                  height: 36,
                  child: Center(
                    child: Text(
                      'Five Days',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF7047EB),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: Color(0xFF7047EB)),
              ),
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: WeatherForecast(),
            ),
          ],
        ),
      );
    },
    isScrollControlled: true,
  );
}

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "April 5",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.82,
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/sun3.png"),
              ),
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "April 6",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.82,
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/sun3.png"),
              ),
              Container(
                child: Text(
                  "23" + "°" + '\u1d9c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "April 7",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.82,
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/sun3.png"),
              ),
              Container(
                child: Text(
                  "28" + "°" + '\u1d9c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "April 8",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.82,
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/sun3.png"),
              ),
              Container(
                child: Text(
                  "29" + "°" + '\u1d9c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "April 9",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.82,
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/sun3.png"),
              ),
              Container(
                child: Text(
                  "28" + "°" + '\u1d9c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("assets/sun1.png"),
              ),
              Container(
                child: Text(
                  "8 a.m",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("assets/sun1.png"),
              ),
              Container(
                child: Text(
                  "10 a.m",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 4),
                child: Image.asset("assets/sun2.png"),
              ),
              Container(
                child: Text(
                  "12 a.m",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 4),
                child: Image.asset("assets/sun2.png"),
              ),
              Container(
                child: Text(
                  "2 p.m",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "27" + "°" + '\u1d9c',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 4),
                child: Image.asset("assets/sun2.png"),
              ),
              Container(
                child: Text(
                  "4 p.m",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

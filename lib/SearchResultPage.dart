// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7047EB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TapIcons(),
          WeatherDisplay(),
        ],
      ),
    );
  }
}

class TapIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {},
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
                      text: 'Abuja, Nigeria',
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
      ],
    );
  }
}

class WeatherDisplay extends StatefulWidget {
  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
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
                      padding: EdgeInsets.only(top: 20, bottom: 20),
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
                "33" + "°" + '\u1d9c',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            Container(
              child: Text(
                'Abuja, Nigeria. 2:00p.m',
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
    );
  }
}

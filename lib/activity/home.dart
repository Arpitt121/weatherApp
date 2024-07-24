import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var city_name = ['London', 'Paris', 'New York', 'Tokyo', 'Sydney'];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = info['temp_value'].toString();
    if (temp == 'Na') {
      print('NA');
    } else {
      temp = temp.substring(0, 4);
    }
    String icon = info['icon_value'].toString();
    String hum = info['hum'].toString();
    String air_speed = info['air_speed_value'].toString();
    if (air_speed == 'Na') {
      print('NA');
    } else {
      air_speed = air_speed.substring(0, 4);
    }
    String des = info['des_value'].toString();
    String getCity = info['city_value'].toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Container(
                  //Search Bar
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      24,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_searchController.text.trim() == '') {
                            print('Blank Search');
                          } else {
                            Navigator.pushNamed(context, '/loading', arguments: {
                              'searchText': _searchController.text,
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search $city',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Second container
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(
                            0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            if (temp != 'Na')
                              Image.network(
                                'https://openweathermap.org/img/wn/$icon@2x.png',
                              ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  des,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (temp != 'Na')
                                Text(
                                  'In $getCity',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //Temperature
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(
                            0.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              WeatherIcons.thermometer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: const TextStyle(fontSize: 100),
                                ),
                                const Text(
                                  'C',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(
                            0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.day_windy)],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              air_speed,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(
                            0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.humidity)],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              hum,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Made by Arpit',
                ),
                 const SizedBox(
                  height: 100,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

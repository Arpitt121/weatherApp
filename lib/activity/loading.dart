import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam_app/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = 'Mumbai';
  String temp = '';
  String hum = '';
  String air_speed = '';
  String des = '';
  String main = '';
  String icon = '';
  String getCity = '';
  void startApp() async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp!;
    icon = instance.icon!;
    hum = instance.humidity!;
    getCity = instance.city!;
    air_speed = instance.air_speed!;
    des = instance.description!;
    main = instance.main!;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temp_value': temp,
        'hum': hum,
        'air_speed_value': air_speed,
        'des_value': des,
        'main_value': main,
        'icon_value': icon,
        'city_value': getCity,
      });
    });
  }

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }
    startApp();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mlogo.png',
              height: 240,
              width: 240,
            ),
            const Text(
              'Weather App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Made by Arpit',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            SpinKitWave(
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 118, 165, 246),
    );
  }
}

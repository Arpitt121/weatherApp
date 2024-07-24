import 'package:flutter/material.dart';
import 'package:mausam_app/activity/home.dart';
import 'package:mausam_app/activity/loading.dart';
import 'package:mausam_app/activity/location.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/loading': (context) => const Loading(),
      },
    ),
  );
}

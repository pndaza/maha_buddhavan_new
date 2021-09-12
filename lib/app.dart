import 'package:flutter/material.dart';
import './page/home_page/home_page.dart';
import './route_generator.dart';

const HomeRoute = '/';
const ReaderRoute = '/reader';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Home(),
    );
  }
}

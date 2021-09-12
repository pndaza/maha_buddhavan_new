import 'package:flutter/material.dart';
import 'page/home_page/home_page.dart';
import 'page/reader_page/book_reader.dart';

const HomeRoute = '/';
const ReaderRoute = '/reader';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final arguments = settings.arguments as Map<String, dynamic>;
    final args = settings.arguments;
    print(args);

    Widget screen;
    switch (settings.name) {
      case HomeRoute:
        screen = Home();
        break;
      case ReaderRoute:
        // Validation of correct data type
        if (args is int) {
          screen = BookReader(
            id: args,
          );
          break;
        }
        // // If args is not of the correct type, return an error page.
        // // You can also throw an exception while in development.
        // return _errorRoute();
        screen = _errorRoute();
        break;
      default:
        // If there is no such named route in the switch statement, e.g. /third
        screen = _errorRoute();
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}

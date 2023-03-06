import 'package:fintness_project/screens/bmi_screen.dart';
import 'package:fintness_project/screens/intro_screen.dart';
import 'package:fintness_project/screens/session_screen.dart';
import 'package:fintness_project/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildMenuItems(context),
    ));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather App',
      'Traiing'
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Globel Fitness',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 28))));
    menuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
            style: const TextStyle(
              fontSize: 18,
            )),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = IntroScreen();
              break;
            case 'BMI Calculator':
              screen = BmiScreen();
              break;
            case 'Weather App':
              screen = const WeatherScreen();
              break;
            case 'Traiing':
              screen = const SessionScreen();
              break;
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => screen)));
        },
      ));
    });
    return menuItems;
  }
}

import 'package:fintness_project/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMertric = true;
  bool isImperial = false;
  double? weight;
  double? height;
  String heightMsg = '';
  String weightMsg = '';
  late List<bool> isSelected;
  @override
  void initState() {
    isSelected = [isMertric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMsg = 'Please input the height in ${isMertric ? 'meters' : 'inches'}';
    weightMsg = 'Please input the weight in ${isMertric ? 'kilo' : 'pound'}';
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      appBar: AppBar(title: const Text('BMI calculator')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              // ignore: sort_child_properties_last
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        Text('Metric', style: TextStyle(fontSize: fontSize))),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Metric', style: TextStyle(fontSize: fontSize)))
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMsg)),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMsg)),
            ),
            ElevatedButton(
                onPressed: calculateBmi,
                child: Text('Calculate BMI',
                    style: TextStyle(fontSize: fontSize))),
            Text(result, style: TextStyle(fontSize: fontSize))
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMertric = true;
      isImperial = false;
    } else {
      isMertric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMertric, isImperial];
    });
  }

  void calculateBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMertric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your Bmi is ${bmi.toStringAsFixed(2)}';
    });
  }
}

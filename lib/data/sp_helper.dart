import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  static late SharedPreferences pref;
  Future init() async {
    pref = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    pref.setString(session.id.toString(), jsonEncode(session.toJson()));
  }
}

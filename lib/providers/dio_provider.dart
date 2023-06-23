import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Future<dynamic> getToken(String email, String password) async {
    try {
      Map data = {"email": email, "password": password};
      var body = json.encode(data);
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/login',
        data: body,
      );

      if (response.statusCode == 200 && response.data != '') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('http://10.0.2.2:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> registerUser(
      String username, String email, String password) async {
    try {
      var data = {"name": username, "email": email, "password": password};
      var body = json.encode(data);
      var user =
          await Dio().post('http://10.0.2.2:8000/api/registers', data: body);
      if (user.statusCode == 201 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> reservation(
      String date, String day, String time, int docteur, String token) async {
    try {
      var data = {
        "date": date,
        "day": day,
        "time": time,
        "docteur_id": docteur
      };
      var body = json.encode(data);
      var response = await Dio().post('http://10.0.2.2:8000/api/rendezvous',
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> getreservation(String token) async {
    try {
      var response = await Dio().get('http://10.0.2.2:8000/api/appointments',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200 && response.data != '') {
        return json.encode(response.data);
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }
}

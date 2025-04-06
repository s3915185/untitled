import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/Constants.dart';

class HomeService {
  Future<Map<String, dynamic>?> getUserInfo(int userInfoId) async {
    final url = Uri.parse('${Constants.baseUrl}/user-info?userInfoId=$userInfoId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to load user info. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user info: $e');
    }

    return null;
  }
}
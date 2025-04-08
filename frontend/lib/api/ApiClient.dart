import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../dto/UserTransactionDTO.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  // Method for handling single objects
  Future<T?> getSingle<T>(
      String url, {
        Map<String, String>? headers,
        required Function(Map<String, dynamic>) fromJson,
        Map<String, String>? queryParameters,
      }) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final response = await _client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final dynamic jsonMap = json.decode(response.body);
        return fromJson(jsonMap);
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      print('No Internet connection.');
    } on FormatException {
      print('Invalid response format.');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }

  Future<List<T>?> getList<T>(
      String url, {
        Map<String, String>? headers,
        required T Function(Map<String, dynamic>) fromJson,
        Map<String, String>? queryParameters,
      }) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final response = await _client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final dynamic jsonMap = json.decode(response.body);

        if (jsonMap is List) {
          return jsonMap.map((item) => fromJson(item)).toList();
        } else {
          print('Expected a List, but got: $jsonMap');
        }
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      print('No Internet connection.');
    } on FormatException {
      print('Invalid response format.');
    } catch (e) {
      print('Unexpected error: $e');
    }
    return null;
  }

  Future<T?> postSingle<T>(
      String url, {
        required Map<String, dynamic> body,
        Map<String, String>? headers,
        required T Function(Map<String, dynamic>) fromJson,
      }) async {
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (headers != null) ...headers,
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic jsonMap = json.decode(response.body);
        return fromJson(jsonMap);
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      print('No Internet connection.');
    } on FormatException {
      print('Invalid response format.');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }

  // Method for posting a list of objects and receiving a list response
  Future<List<T>?> postList<T>(
      String url, {
        required List<Map<String, dynamic>> bodyList,
        Map<String, String>? headers,
        required T Function(Map<String, dynamic>) fromJson,
      }) async {
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (headers != null) ...headers,
        },
        body: jsonEncode(bodyList),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic jsonMap = json.decode(response.body);
        if (jsonMap is List) {
          return jsonMap.map((item) => fromJson(item)).toList();
        } else {
          print('Expected a List, but got: $jsonMap');
        }
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      print('No Internet connection.');
    } on FormatException {
      print('Invalid response format.');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }

  Future<bool> deleteSingle(
      String url, {
        Map<String, String>? headers,
        required Map<String, String> queryParameters,
      }) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final response = await _client.delete(uri, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      print('No Internet connection.');
    } on FormatException {
      print('Invalid response format.');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return false;
  }


}




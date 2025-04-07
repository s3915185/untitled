import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/Constants.dart';

import '../api/ApiClient.dart';
import '../dto/UserInfoDTO.dart';

class HomeService {
  final ApiClient _apiClient;

  HomeService(this._apiClient);

  Future<UserInfoDTO?> getUserInfo(int userInfoId) {
    return _apiClient.getSingle(
      '${Constants.baseUrl}/user-info',
      queryParameters: {'userInfoId': userInfoId.toString()},
      fromJson: (json) => UserInfoDTO.fromJson(json),
    );
  }
}
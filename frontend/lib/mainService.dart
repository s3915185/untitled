import 'package:untitled/dto/UserConfigurationDTO.dart';

import 'Constants.dart';
import 'api/ApiClient.dart';

class Mainservice {
  final ApiClient _apiClient;

  Mainservice(this._apiClient);

  Future<UserConfigurationDTO?> getUserConfiguration(int userInfoId) {
    return _apiClient.getSingle(
      '${Constants.baseUrl}/user-configuration',
      queryParameters: {'userInfoId': userInfoId.toString()},
      fromJson: (json) => UserConfigurationDTO.fromJson(json),
    );
  }
}
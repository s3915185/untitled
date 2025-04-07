import 'package:untitled/dto/UserTransactionDTO.dart';

import '../Constants.dart';
import '../api/ApiClient.dart';

class ReportService {
  final ApiClient _apiClient;

  ReportService(this._apiClient);

  Future<List<UserTransactionDTO>?> getUserTransactionsByUserInfoId(int userInfoId) {
    return _apiClient.getList<UserTransactionDTO>(
      '${Constants.baseUrl}/user-transaction',
      queryParameters: {'userInfoId': userInfoId.toString()},
      fromJson: (json) => UserTransactionDTO.fromJson(json),
    );
  }
}
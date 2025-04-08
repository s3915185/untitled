import '../Constants.dart';
import '../api/ApiClient.dart';
import '../dto/UserTransactionDTO.dart';

class ChatInputTransactionService {
  final ApiClient _apiClient;

  ChatInputTransactionService(this._apiClient);

  Future<List<UserTransactionDTO>?> getUserTransactionsByUserInfoId(int userInfoId) {
    return _apiClient.getList<UserTransactionDTO>(
      '${Constants.baseUrl}/user-transaction',
      queryParameters: {'userInfoId': userInfoId.toString()},
      fromJson: (json) => UserTransactionDTO.fromJson(json),
    );
  }

  Future<UserTransactionDTO?> postSingleTransaction(Map<String, dynamic> json) {
    return _apiClient.postSingle<UserTransactionDTO>(
      '${Constants.baseUrl}/user-transaction/add-one',
      body: json,
      fromJson: (json) => UserTransactionDTO.fromJson(json),
    );
  }

  Future<bool?> deleteSingleTransaction(int id) {
    return _apiClient.deleteSingle(
        '${Constants.baseUrl}/user-transaction',
        queryParameters: {'id': id.toString()}
    );
  }
}
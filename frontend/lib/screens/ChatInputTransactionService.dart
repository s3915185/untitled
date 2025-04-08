import '../Constants.dart';
import '../api/ApiClient.dart';
import '../dto/UserTransactionDTO.dart';
import '../utils/DateTimeUtils.dart';

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
}
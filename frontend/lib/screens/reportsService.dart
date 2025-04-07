import 'package:untitled/dto/UserTransactionCalendarDTO.dart';
import 'package:untitled/dto/UserTransactionDTO.dart';
import 'package:untitled/utils/DateTimeUtils.dart';

import '../Constants.dart';
import '../api/ApiClient.dart';

class ReportService {
  final ApiClient _apiClient;

  ReportService(this._apiClient);

  Future<List<UserTransactionDTO>?> getUserTransactionsByUserInfoId(int userInfoId,
      DateTime dateStart, DateTime dateEnd) {
    return _apiClient.getList<UserTransactionDTO>(
      '${Constants.baseUrl}/user-transaction/transaction-period',
      queryParameters: {'userInfoId': userInfoId.toString(), 'dateStart': DateTimeUtils.dateTimeApiFormat(dateStart), 'dateEnd': DateTimeUtils.dateTimeApiFormat(dateEnd)},
      fromJson: (json) => UserTransactionDTO.fromJson(json),
    );
  }

  Future<List<UserTransactionCalendarDTO>?> getEachDayUpAndDownInfoByUserInfoIdAndPeriods(int userInfoId,
      DateTime dateStart, DateTime dateEnd) {
    return _apiClient.getList<UserTransactionCalendarDTO>(
      '${Constants.baseUrl}/user-transaction/calendar-period',
      queryParameters: {'userInfoId': userInfoId.toString(), 'dateStart': DateTimeUtils.dateTimeApiFormat(dateStart), 'dateEnd': DateTimeUtils.dateTimeApiFormat(dateEnd)},
      fromJson: (json) => UserTransactionCalendarDTO.fromJson(json),
    );
  }
}
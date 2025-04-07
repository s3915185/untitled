package com.example.mcp_untitled_server.userTransaction;

import java.time.LocalDate;
import java.util.List;

interface UserTransactionRepositoryCustom {
    List<UserTransaction> getListOfTransactionByUserInfoIdAndPeriods(Long userInfoId, LocalDate dateStart, LocalDate dateEnd);
    List<UserTransactionCalendarDTO> getEachDayUpAndDownInfoByUserInfoIdAndPeriods(Long userInfoId, LocalDate dateStart, LocalDate dateEnd);

}

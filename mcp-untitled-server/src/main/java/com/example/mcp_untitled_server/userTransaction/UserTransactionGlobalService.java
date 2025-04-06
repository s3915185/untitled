package com.example.mcp_untitled_server.userTransaction;

import org.apache.commons.lang3.tuple.Pair;
import org.springframework.ai.tool.annotation.Tool;

import java.util.List;
import java.util.Set;

public interface UserTransactionGlobalService {
    UserTransactionDTO addNewOneTransaction(UserTransactionDTO transaction);
    List<UserTransactionDTO> addListOfTransactions(List<UserTransactionDTO> transactionDTOList);
    UserTransactionDTO getOneTransactionById(Long id);
    List<UserTransactionDTO> getListOfTransactionsByIds(Set<Long> ids);
    List<UserTransactionDTO> getListOfTransactionsByUserInfoId(Long userInfoId);
    UserTransactionDTO modifyOneTransaction(UserTransactionDTO modifiedTransaction);
    List<UserTransactionDTO> modifyListOfTransactions(List<UserTransactionDTO> modifiedTransactionDTOList);
    boolean deleteOneTransactionById(Long id);
    List<Pair<Long, Boolean>> deleteListOfTransactionsByIds(Set<Long> ids);
}

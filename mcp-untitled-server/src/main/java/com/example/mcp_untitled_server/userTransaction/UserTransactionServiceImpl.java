package com.example.mcp_untitled_server.userTransaction;

import org.apache.commons.lang3.tuple.Pair;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
class UserTransactionServiceImpl implements UserTransactionService {
    @Override
    public UserTransactionDTO addNewOneTransaction(UserTransactionDTO transaction) {
        return null;
    }

    @Override
    public List<UserTransactionDTO> addListOfTransactions(List<UserTransactionDTO> transactionDTOList) {
        return null;
    }

    @Override
    public UserTransactionDTO getOneTransactionById(Long id) {
        return null;
    }

    @Override
    public List<UserTransactionDTO> getListOfTransactionsByIds(Set<Long> ids) {
        return null;
    }

    @Override
    public List<UserTransactionDTO> getListOfTransactionsByUserInfoId(Long userInfoId) {
        return null;
    }

    @Override
    public UserTransactionDTO modifyOneTransaction(UserTransactionDTO modifiedTransaction) {
        return null;
    }

    @Override
    public List<UserTransactionDTO> modifyListOfTransactions(List<UserTransactionDTO> modifiedTransactionDTOList) {
        return null;
    }

    @Override
    public boolean deleteOneTransactionById(Long id) {
        return false;
    }

    @Override
    public List<Pair<Long, Boolean>> deleteListOfTransactionsByIds(Set<Long> ids) {
        return null;
    }
}

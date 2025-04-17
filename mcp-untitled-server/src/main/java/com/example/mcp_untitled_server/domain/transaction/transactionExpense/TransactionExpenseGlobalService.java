package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import java.util.List;

public interface TransactionExpenseGlobalService {
    List<TransactionExpenseDTO> addListOfTransaction(List<TransactionExpenseDTO> transactionExpenseDTOS);
}

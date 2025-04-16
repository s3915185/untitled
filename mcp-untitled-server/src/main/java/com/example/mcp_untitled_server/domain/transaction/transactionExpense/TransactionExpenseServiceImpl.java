package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionExpenseServiceImpl implements TransactionExpenseService {
    private final TransactionExpenseRepository transactionExpenseRepository;
}

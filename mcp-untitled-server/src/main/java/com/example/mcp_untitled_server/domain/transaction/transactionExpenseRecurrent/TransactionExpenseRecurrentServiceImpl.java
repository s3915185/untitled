package com.example.mcp_untitled_server.domain.transaction.transactionExpenseRecurrent;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionExpenseRecurrentServiceImpl implements TransactionExpenseRecurrentService {
    private final TransactionExpenseRecurrentRepository transactionExpenseRecurrentRepository;
}

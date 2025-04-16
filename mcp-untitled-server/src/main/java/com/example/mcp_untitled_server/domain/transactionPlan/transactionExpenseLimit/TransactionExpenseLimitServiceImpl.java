package com.example.mcp_untitled_server.domain.transactionPlan.transactionExpenseLimit;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionExpenseLimitServiceImpl implements TransactionExpenseLimitService {
    private final TransactionExpenseLimitRepository transactionExpenseLimitRepository;
}

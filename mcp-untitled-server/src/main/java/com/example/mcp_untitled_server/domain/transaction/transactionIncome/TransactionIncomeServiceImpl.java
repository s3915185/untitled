package com.example.mcp_untitled_server.domain.transaction.transactionIncome;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionIncomeServiceImpl implements TransactionIncomeService {
    private final TransactionIncomeRepository transactionIncomeRepository;
}

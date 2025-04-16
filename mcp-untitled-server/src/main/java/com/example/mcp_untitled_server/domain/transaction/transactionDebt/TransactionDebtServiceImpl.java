package com.example.mcp_untitled_server.domain.transaction.transactionDebt;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionDebtServiceImpl implements TransactionDebtService {
    private final TransactionDebtRepository transactionDebtRepository;
}

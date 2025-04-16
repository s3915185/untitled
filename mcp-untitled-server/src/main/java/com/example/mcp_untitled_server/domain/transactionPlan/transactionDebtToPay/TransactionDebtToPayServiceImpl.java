package com.example.mcp_untitled_server.domain.transactionPlan.transactionDebtToPay;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionDebtToPayServiceImpl implements TransactionDebtToPayService {
    private final TransactionDebtToPayRepository transactionDebtToPayRepository;
}

package com.example.mcp_untitled_server.domain.transactionPlan.transactionInvestToSave;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionInvestToSaveServiceImpl implements TransactionInvestToSaveService {
    private final TransactionInvestToSaveRepository transactionInvestToSaveRepository;
}

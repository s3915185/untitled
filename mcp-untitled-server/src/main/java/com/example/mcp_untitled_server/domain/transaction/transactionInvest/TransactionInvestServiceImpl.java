package com.example.mcp_untitled_server.domain.transaction.transactionInvest;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionInvestServiceImpl implements TransactionInvestService {
    private final TransactionInvestRepository transactionInvestRepository;
}

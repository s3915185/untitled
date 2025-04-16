package com.example.mcp_untitled_server.domain.balance.debtBalance;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class DebtBalanceServiceImpl implements DebtBalanceService {
    private final DebtBalanceRepository debtBalanceRepository;
}

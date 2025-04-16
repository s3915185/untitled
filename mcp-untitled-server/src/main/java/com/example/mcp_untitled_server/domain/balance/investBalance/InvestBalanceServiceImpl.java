package com.example.mcp_untitled_server.domain.balance.investBalance;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class InvestBalanceServiceImpl implements InvestBalanceService {
    private final InvestBalanceRepository investBalanceRepository;
}

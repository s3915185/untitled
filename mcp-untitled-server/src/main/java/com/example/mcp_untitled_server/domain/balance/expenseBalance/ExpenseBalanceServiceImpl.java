package com.example.mcp_untitled_server.domain.balance.expenseBalance;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class ExpenseBalanceServiceImpl implements ExpenseBalanceService {
    private final ExpenseBalanceRepository expenseBalanceRepository;
}

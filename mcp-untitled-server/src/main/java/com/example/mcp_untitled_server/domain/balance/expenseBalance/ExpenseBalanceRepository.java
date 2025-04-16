package com.example.mcp_untitled_server.domain.balance.expenseBalance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface ExpenseBalanceRepository extends JpaRepository<ExpenseBalance, Long>, ExpenseBalanceRepositoryCustom {
}

package com.example.mcp_untitled_server.domain.balance.debtBalance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface DebtBalanceRepository extends JpaRepository<DebtBalance, Long>, DebtBalanceRepositoryCustom {
}

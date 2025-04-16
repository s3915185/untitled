package com.example.mcp_untitled_server.domain.balance.investBalance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface InvestBalanceRepository extends JpaRepository<InvestBalance, Long>, InvestBalanceRepositoryCustom {
}

package com.example.mcp_untitled_server.domain.identifant.investor;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface InvestorRepository extends JpaRepository<Investor, Long>, InvestorRepositoryCustom {
}

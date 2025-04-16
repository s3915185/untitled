package com.example.mcp_untitled_server.domain.identifant.lender;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface LenderRepository extends JpaRepository<Lender, Long>, LenderRepositoryCustom {
}

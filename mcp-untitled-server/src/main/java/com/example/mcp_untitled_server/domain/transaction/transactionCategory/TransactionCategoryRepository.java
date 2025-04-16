package com.example.mcp_untitled_server.domain.transaction.transactionCategory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionCategoryRepository extends JpaRepository<TransactionCategory, Long>, TransactionCategoryRepositoryCustom {
}

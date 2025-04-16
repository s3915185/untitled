package com.example.mcp_untitled_server.domain.transaction.transactionCategory;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class TransactionCategoryServiceImpl implements TransactionCategoryService {
    private final TransactionCategoryRepository transactionCategoryRepository;
}

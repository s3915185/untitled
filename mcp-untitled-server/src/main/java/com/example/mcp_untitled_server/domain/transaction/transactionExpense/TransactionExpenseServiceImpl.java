package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
class TransactionExpenseServiceImpl implements TransactionExpenseService {
    private final TransactionExpenseRepository transactionExpenseRepository;

    @Override
    public List<TransactionExpenseDTO> addListOfTransaction(List<TransactionExpenseDTO> transactionExpenseDTOS) {
        return transactionExpenseRepository.saveAll(transactionExpenseDTOS.stream()
                .map(TransactionExpenseMapper.INSTANCE::toEntity)
                .toList())
                .stream()
                .map(TransactionExpenseMapper.INSTANCE::toDto)
                .toList();
    }
}

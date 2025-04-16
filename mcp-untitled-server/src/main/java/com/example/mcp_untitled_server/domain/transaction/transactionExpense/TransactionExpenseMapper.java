package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionExpenseMapper {
    TransactionExpenseMapper INSTANCE = Mappers.getMapper(TransactionExpenseMapper.class);

    TransactionExpenseDTO toDto(TransactionExpense entity);

    TransactionExpense toEntity(TransactionExpenseDTO object);
}

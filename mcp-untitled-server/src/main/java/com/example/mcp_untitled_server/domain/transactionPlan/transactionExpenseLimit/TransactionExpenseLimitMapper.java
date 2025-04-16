package com.example.mcp_untitled_server.domain.transactionPlan.transactionExpenseLimit;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionExpenseLimitMapper {
    TransactionExpenseLimitMapper INSTANCE = Mappers.getMapper(TransactionExpenseLimitMapper.class);

    TransactionExpenseLimitDTO toDto(TransactionExpenseLimit entity);

    TransactionExpenseLimit toEntity(TransactionExpenseLimitDTO object);
}

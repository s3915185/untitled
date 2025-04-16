package com.example.mcp_untitled_server.domain.transaction.transactionExpenseRecurrent;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionExpenseRecurrentMapper {
    TransactionExpenseRecurrentMapper INSTANCE = Mappers.getMapper(TransactionExpenseRecurrentMapper.class);

    TransactionExpenseRecurrentDTO toDto(TransactionExpenseRecurrent entity);

    TransactionExpenseRecurrent toEntity(TransactionExpenseRecurrentDTO object);
}

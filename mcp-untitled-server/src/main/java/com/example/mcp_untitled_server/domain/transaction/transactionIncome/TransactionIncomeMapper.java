package com.example.mcp_untitled_server.domain.transaction.transactionIncome;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionIncomeMapper {
    TransactionIncomeMapper INSTANCE = Mappers.getMapper(TransactionIncomeMapper.class);

    TransactionIncomeDTO toDto(TransactionIncome entity);

    TransactionIncome toEntity(TransactionIncomeDTO object);
}

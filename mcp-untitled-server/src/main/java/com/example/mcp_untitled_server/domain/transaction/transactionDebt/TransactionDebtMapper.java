package com.example.mcp_untitled_server.domain.transaction.transactionDebt;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionDebtMapper {
    TransactionDebtMapper INSTANCE = Mappers.getMapper(TransactionDebtMapper.class);

    TransactionDebtDTO toDto(TransactionDebt entity);

    TransactionDebt toEntity(TransactionDebtDTO object);
}

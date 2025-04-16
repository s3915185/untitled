package com.example.mcp_untitled_server.domain.transactionPlan.transactionDebtToPay;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionDebtToPayMapper {
    TransactionDebtToPayMapper INSTANCE = Mappers.getMapper(TransactionDebtToPayMapper.class);

    TransactionDebtToPayDTO toDto(TransactionDebtToPay entity);

    TransactionDebtToPay toEntity(TransactionDebtToPayDTO object);
}

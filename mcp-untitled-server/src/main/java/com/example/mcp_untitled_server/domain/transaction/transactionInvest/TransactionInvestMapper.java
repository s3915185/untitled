package com.example.mcp_untitled_server.domain.transaction.transactionInvest;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionInvestMapper {
    TransactionInvestMapper INSTANCE = Mappers.getMapper(TransactionInvestMapper.class);

    TransactionInvestDTO toDto(TransactionInvest entity);

    TransactionInvest toEntity(TransactionInvestDTO object);
}

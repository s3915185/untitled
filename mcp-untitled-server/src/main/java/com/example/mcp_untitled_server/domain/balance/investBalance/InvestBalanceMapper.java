package com.example.mcp_untitled_server.domain.balance.investBalance;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface InvestBalanceMapper {
    InvestBalanceMapper INSTANCE = Mappers.getMapper(InvestBalanceMapper.class);

    InvestBalanceDTO toDto(InvestBalance entity);

    InvestBalance toEntity(InvestBalanceDTO object);
}

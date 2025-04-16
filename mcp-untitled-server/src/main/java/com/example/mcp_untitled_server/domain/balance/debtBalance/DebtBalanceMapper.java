package com.example.mcp_untitled_server.domain.balance.debtBalance;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface DebtBalanceMapper {
    DebtBalanceMapper INSTANCE = Mappers.getMapper(DebtBalanceMapper.class);

    DebtBalanceDTO toDto(DebtBalance entity);

    DebtBalance toEntity(DebtBalanceDTO object);
}

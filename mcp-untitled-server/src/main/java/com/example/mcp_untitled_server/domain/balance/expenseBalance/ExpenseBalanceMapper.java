package com.example.mcp_untitled_server.domain.balance.expenseBalance;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface ExpenseBalanceMapper {
    ExpenseBalanceMapper INSTANCE = Mappers.getMapper(ExpenseBalanceMapper.class);

    ExpenseBalanceDTO toDto(ExpenseBalance entity);

    ExpenseBalance toEntity(ExpenseBalanceDTO object);
}

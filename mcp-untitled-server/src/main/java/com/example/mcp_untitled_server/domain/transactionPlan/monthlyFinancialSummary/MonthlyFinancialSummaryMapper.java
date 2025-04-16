package com.example.mcp_untitled_server.domain.transactionPlan.monthlyFinancialSummary;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface MonthlyFinancialSummaryMapper {
    MonthlyFinancialSummaryMapper INSTANCE = Mappers.getMapper(MonthlyFinancialSummaryMapper.class);

    MonthlyFinancialSummaryDTO toDto(MonthlyFinancialSummary entity);

    MonthlyFinancialSummary toEntity(MonthlyFinancialSummaryDTO object);
}

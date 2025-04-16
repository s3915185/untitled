package com.example.mcp_untitled_server.domain.transactionPlan.transactionInvestToSave;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionInvestToSaveMapper {
    TransactionInvestToSaveMapper INSTANCE = Mappers.getMapper(TransactionInvestToSaveMapper.class);

    TransactionInvestToSaveDTO toDto(TransactionInvestToSave entity);

    TransactionInvestToSave toEntity(TransactionInvestToSaveDTO object);
}

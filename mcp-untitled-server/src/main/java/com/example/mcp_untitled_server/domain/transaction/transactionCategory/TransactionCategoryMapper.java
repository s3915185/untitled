package com.example.mcp_untitled_server.domain.transaction.transactionCategory;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface TransactionCategoryMapper {
    TransactionCategoryMapper INSTANCE = Mappers.getMapper(TransactionCategoryMapper.class);

    TransactionCategoryDTO toDto(TransactionCategory entity);

    TransactionCategory toEntity(TransactionCategoryDTO object);
}

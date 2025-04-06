package com.example.mcp_untitled_server.userTransaction;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserTransactionMapper {
    UserTransactionMapper INSTANCE = Mappers.getMapper(UserTransactionMapper.class);

    UserTransactionDTO toDto(UserTransaction entity);

    UserTransaction toEntity(UserTransactionDTO object);
}

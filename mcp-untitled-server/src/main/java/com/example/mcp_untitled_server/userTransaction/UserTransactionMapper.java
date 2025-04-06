package com.example.mcp_untitled_server.userTransaction;

import org.mapstruct.*;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserTransactionMapper {
    UserTransactionMapper INSTANCE = Mappers.getMapper(UserTransactionMapper.class);

    UserTransactionDTO toDto(UserTransaction entity);

    UserTransaction toEntity(UserTransactionDTO object);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "userInfoId", ignore = true)
    void updateEntityFromDto(@MappingTarget UserTransaction entity, UserTransactionDTO dto);

}

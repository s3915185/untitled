package com.example.mcp_untitled_server.userConfiguration;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserConfigurationMapper {
    UserConfigurationMapper INSTANCE = Mappers.getMapper(UserConfigurationMapper.class);

    UserConfigurationDTO toDto(UserConfiguration entity);

    UserConfiguration toEntity(UserConfigurationDTO object);
}

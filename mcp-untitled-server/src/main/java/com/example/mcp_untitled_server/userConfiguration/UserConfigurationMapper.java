package com.example.mcp_untitled_server.userConfiguration;

import org.mapstruct.*;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserConfigurationMapper {
    UserConfigurationMapper INSTANCE = Mappers.getMapper(UserConfigurationMapper.class);

    UserConfigurationDTO toDto(UserConfiguration entity);

    UserConfiguration toEntity(UserConfigurationDTO object);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "userInfoId", ignore = true)
    void updateEntityFromDto(@MappingTarget UserConfiguration entity, UserConfigurationDTO dto);
}

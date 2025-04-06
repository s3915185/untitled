package com.example.mcp_untitled_server.userInfo;

import org.mapstruct.*;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserInfoMapper {
    UserInfoMapper INSTANCE = Mappers.getMapper(UserInfoMapper.class);

    UserInfoDTO toDto(UserInfo entity);

    UserInfo toEntity(UserInfoDTO object);

    @Mapping(target = "id", ignore = true)
    void updateEntityFromDto(@MappingTarget UserInfo entity, UserInfoDTO dto);
}

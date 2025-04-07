package com.example.mcp_untitled_server.userConfiguration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.mapstruct.*;
import org.mapstruct.factory.Mappers;

import java.io.IOException;
import java.util.List;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface UserConfigurationMapper {

    UserConfigurationMapper INSTANCE = Mappers.getMapper(UserConfigurationMapper.class);

    @Mapping(target = "categories", source = "categories", qualifiedByName = "stringToList")
    @Mapping(target = "name", ignore = true)
    UserConfigurationDTO toDto(UserConfiguration entity);

    @Mapping(target = "categories", source = "categories", qualifiedByName = "listToString")
    UserConfiguration toEntity(UserConfigurationDTO object);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "userInfoId", ignore = true)
    @Mapping(target = "categories", source = "categories", qualifiedByName = "listToString")
    void updateEntityFromDto(@MappingTarget UserConfiguration entity, UserConfigurationDTO dto);

    // Custom method to convert String (JSON) to List<String>
    @Named("stringToList")
    default List<String> stringToList(String categoriesJson) {
        if (categoriesJson == null || categoriesJson.isEmpty()) {
            return null;
        }
        try {
            return new ObjectMapper().readValue(categoriesJson, new TypeReference<List<String>>() {});
        } catch (IOException e) {
            throw new RuntimeException("Error converting JSON to List<String>", e);
        }
    }

    // Custom method to convert List<String> to String (JSON)
    @Named("listToString")
    default String listToString(List<String> categories) {
        if (categories == null || categories.isEmpty()) {
            return "[]"; // Return empty JSON array if the list is empty
        }
        try {
            return new ObjectMapper().writeValueAsString(categories);
        } catch (IOException e) {
            throw new RuntimeException("Error converting List<String> to JSON", e);
        }
    }
}
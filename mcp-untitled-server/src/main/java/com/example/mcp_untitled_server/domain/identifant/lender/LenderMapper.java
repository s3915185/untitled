package com.example.mcp_untitled_server.domain.identifant.lender;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface LenderMapper {
    LenderMapper INSTANCE = Mappers.getMapper(LenderMapper.class);

    LenderDTO toDto(Lender entity);

    Lender toEntity(LenderDTO object);
}

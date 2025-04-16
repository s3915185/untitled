package com.example.mcp_untitled_server.domain.identifant.investor;

import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface InvestorMapper {
    InvestorMapper INSTANCE = Mappers.getMapper(InvestorMapper.class);

    InvestorDTO toDto(Investor entity);

    Investor toEntity(InvestorDTO object);
}

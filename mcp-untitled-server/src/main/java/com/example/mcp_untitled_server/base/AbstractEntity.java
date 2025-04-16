package com.example.mcp_untitled_server.base;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@MappedSuperclass
@Access(AccessType.FIELD)
public abstract class AbstractEntity {

    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false, nullable = false)
    @Access(AccessType.PROPERTY)
    protected Long id;
}

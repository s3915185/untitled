package com.example.mcp_untitled_server.base;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@MappedSuperclass
@Getter
@Setter
public abstract class AbstractAuditableEntity extends AbstractEntity{
    @Column(name = "DTE_LOG_I", updatable = false)
    private LocalDateTime creationDate;

    @Column(name = "DTE_LOG_U")
    private LocalDateTime lastMondificationDate;

    @Version
    @Column(name = "VERSION")
    private Integer version;

    @PrePersist
    public void beforeSave() {
        setCreationDate(LocalDateTime.now());
        setLastMondificationDate(LocalDateTime.now());
    }

    @PreUpdate
    public void beforeUpdate() {
        setLastMondificationDate(LocalDateTime.now());
    }
}

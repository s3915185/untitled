package com.example.mcp_untitled_server.domain.identifant.investor;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
@Entity
@Table(name = "INVESTOR")
@AttributeOverride(name = "id", column = @Column(name = "INVESTOR_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class Investor extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_CONFIGURATION_ID")
    private Long userConfigurationId;

    @Size(max = 128)
    @NotNull
    @Column(name = "NAME")
    private String name;

    @Size(max = 256)
    @Column(name = "DESCRIPTION")
    private String description;
}

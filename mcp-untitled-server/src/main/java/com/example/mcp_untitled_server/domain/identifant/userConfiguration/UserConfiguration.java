package com.example.mcp_untitled_server.domain.identifant.userConfiguration;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
@Data
@Entity
@Table(name = "USER_CONFIGURATION_2")
@AttributeOverride(name = "id", column = @Column(name = "USER_CONFIGURATION_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserConfiguration extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;
}
package com.example.mcp_untitled_server.domain.transaction.transactionCategory;

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
@Table(name = "TRANSACTION_CATEGORY")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_CATEGORY_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionCategory extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_CONFIGURATION_ID")
    private Long userConfigurationId;

    @Size(max = 128)
    @NotNull
    @Column(name = "TRANSACTION_CATEGORY_NAME")
    private String transactionCategoryName;
}

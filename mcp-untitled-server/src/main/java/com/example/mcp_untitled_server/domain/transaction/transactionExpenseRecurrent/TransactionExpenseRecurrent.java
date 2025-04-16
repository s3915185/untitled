package com.example.mcp_untitled_server.domain.transaction.transactionExpenseRecurrent;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;


@Data
@Entity
@Table(name = "TRANSACTION_EXPENSE_RECURRENT")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_EXPENSE_RECURRENT_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionExpenseRecurrent extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_CONFIGURATION_ID")
    private Long userConfigurationId;

    @Column(name = "TRANSACTION_CATEGORY_ID")
    private Long transactionCategoryId;

    @NotNull
    @Column(name = "NAME")
    private String name;

    @Size(max = 256)
    @Column(name = "DESCRIPTION")
    private String description;

    @NotNull
    @Column(name = "RECURRENT_DATE")
    private LocalDate recurrentDate;
}

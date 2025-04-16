package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

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
@Table(name = "TRANSACTION_EXPENSE")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_EXPENSE_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionExpense extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "TRANSACTION_CATEGORY_ID")
    private Long transactionCategoryId;

    @NotNull
    @Column(name = "NAME")
    private String name;

    @Size(max = 256)
    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "TRANSACTION_EXPENSE_LIMIT_ID")
    private Long transactionExpenseLimitId;

    @Column(name = "TRANSACTION_EXPENSE_RECURRENT_ID")
    private Long transactionExpenseRecurrentId;
}

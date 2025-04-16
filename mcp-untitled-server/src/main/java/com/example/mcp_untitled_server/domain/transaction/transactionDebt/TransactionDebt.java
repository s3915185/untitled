package com.example.mcp_untitled_server.domain.transaction.transactionDebt;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import com.example.mcp_untitled_server.enums.TransactionDebtType;
import jakarta.persistence.*;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;


@Data
@Entity
@Table(name = "TRANSACTION_DEBT")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_DEBT_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionDebt extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;

    @NotNull
    @Column(name = "LENDER_ID")
    private Long lenderId;

    @NotNull
    @Column(name = "PRINCIPAL")
    private BigDecimal principal;

    @NotNull
    @Column(name = "APR")
    private BigDecimal apr;

    @NotNull
    @Column(name = "NUMBER_OF_YEAR")
    private Integer numberOfYear;

    @NotNull
    @Column(name = "TYPE")
    private TransactionDebtType type;
}

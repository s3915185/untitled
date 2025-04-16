package com.example.mcp_untitled_server.domain.transaction.transactionInvest;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import com.example.mcp_untitled_server.enums.TransactionInvestType;
import jakarta.persistence.*;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;


@Data
@Entity
@Table(name = "TRANSACTION_INVEST")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_INVEST_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionInvest extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;

    @NotNull
    @Column(name = "INVESTOR_ID")
    private Long investorId;

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
    private TransactionInvestType type;
}
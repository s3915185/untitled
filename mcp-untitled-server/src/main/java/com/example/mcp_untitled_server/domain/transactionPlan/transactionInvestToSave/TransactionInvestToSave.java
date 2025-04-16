package com.example.mcp_untitled_server.domain.transactionPlan.transactionInvestToSave;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;


@Data
@Entity
@Table(name = "TRANSACTION_INVEST_TO_SAVE")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_INVEST_TO_SAVE_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionInvestToSave extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "MONTHLY_FINANCIAL_SUMMARY_ID")
    private Long monthlyFinancialSummaryId;

    @NotNull
    @Column(name = "INVESTOR_ID")
    private Long investorId;

    @NotNull
    @Column(name = "AMOUNT")
    private BigDecimal amount;
}
package com.example.mcp_untitled_server.domain.balance.debtBalance;

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
@Table(name = "DEBT_BALANCE")
@AttributeOverride(name = "id", column = @Column(name = "DEBT_BALANCE_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class DebtBalance extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;

    @NotNull
    @Column(name = "BALANCE")
    private BigDecimal balance;
}
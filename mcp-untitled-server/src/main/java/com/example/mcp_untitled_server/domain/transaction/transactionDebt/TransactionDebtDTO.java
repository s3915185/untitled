package com.example.mcp_untitled_server.domain.transaction.transactionDebt;

import com.example.mcp_untitled_server.enums.TransactionDebtType;
import jakarta.persistence.Column;
import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionDebtDTO {
    private Long id;
    private Long userId;
    private Long lenderId;
    private BigDecimal principal;
    private BigDecimal apr;
    private Integer numberOfYear;
    private TransactionDebtType type;
}

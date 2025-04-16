package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import com.example.mcp_untitled_server.enums.TransactionDebtType;
import com.example.mcp_untitled_server.enums.TransactionType;
import jakarta.persistence.Column;
import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionExpenseDTO {
    private Long id;
    private Long userId;
    private Long transactionCategoryId;
    private String name;
    private String description;
    private Long transactionExpenseLimitId;
    private Long transactionExpenseRecurrentId;
}

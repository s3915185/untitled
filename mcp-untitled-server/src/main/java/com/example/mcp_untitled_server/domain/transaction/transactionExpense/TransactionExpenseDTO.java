package com.example.mcp_untitled_server.domain.transaction.transactionExpense;
import lombok.*;

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

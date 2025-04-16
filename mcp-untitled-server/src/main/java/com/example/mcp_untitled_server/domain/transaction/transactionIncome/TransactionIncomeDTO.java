package com.example.mcp_untitled_server.domain.transaction.transactionIncome;

import com.example.mcp_untitled_server.enums.TransactionType;
import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionIncomeDTO {
    private Long id;
    private Long userId;
    private Long transactionCategoryId;
    private String name;
    private String description;
}

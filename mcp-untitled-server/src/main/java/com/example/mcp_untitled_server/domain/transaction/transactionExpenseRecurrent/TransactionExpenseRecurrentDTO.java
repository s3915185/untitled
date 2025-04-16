package com.example.mcp_untitled_server.domain.transaction.transactionExpenseRecurrent;

import lombok.*;
import java.time.LocalDate;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionExpenseRecurrentDTO {
    private Long id;
    private Long userConfigurationId;
    private Long transactionCategoryId;
    private String name;
    private String description;
    private LocalDate recurrentDate;
}

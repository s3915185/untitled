package com.example.mcp_untitled_server.domain.transaction.transactionCategory;

import com.example.mcp_untitled_server.enums.TransactionDebtType;
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
public class TransactionCategoryDTO {
    private Long id;
    private Long userConfigurationId;
    private String transactionCategoryName;
}

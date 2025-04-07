package com.example.mcp_untitled_server.userTransaction;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserTransactionCalendarDTO {
    private LocalDate date;
    private BigDecimal upAmount;
    private BigDecimal downAmount;
}

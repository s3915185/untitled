package com.example.mcp_untitled_server.userTransaction;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "USER_TRANSACTION")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserTransaction {
    @Id
    @Column(name = "USER_TRANSACTION_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_INFO_ID")
    private Long userInfoId;

    @Column(name = "AMOUNT", precision = 10, scale = 3)
    private BigDecimal amount;
    @Column(name = "TRANSACTION_CATEGORY", nullable = false)
    private String transactionCategory;

    @Column(name = "NAME")
    private String name;

    @Column(name = "LOCAL_DATE_TIME")
    private LocalDate localDate;
}

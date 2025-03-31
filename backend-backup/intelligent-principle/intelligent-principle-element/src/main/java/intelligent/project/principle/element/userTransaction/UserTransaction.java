package intelligent.project.principle.element.userTransaction;

import intelligent.project.common.domain.dto.TransactionCategory;
import intelligent.project.common.domain.dto.TransactionType;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

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

    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "AMOUNT", precision = 10, scale = 3)
    private BigDecimal amount;

    @Column(name = "TRANSACTION_TYPE", nullable = false)
    private TransactionType transactionType;

    @Column(name = "TRANSACTION_CATEGORY", nullable = false)
    private TransactionCategory transactionCategory;

    @Column(name = "DESCRIPTION")
    private String description;
}

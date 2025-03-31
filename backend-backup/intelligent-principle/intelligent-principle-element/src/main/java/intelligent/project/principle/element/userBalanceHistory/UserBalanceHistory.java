package intelligent.project.principle.element.userBalanceHistory;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Data
@Entity
@Table(name = "USER_BALANCE_HISTORY")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserBalanceHistory {
    @Id
    @Column(name = "USER_BALANCE_HISTORY_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "PREVIOUS_BALANCE", precision = 10, scale = 3)
    private BigDecimal previousBalance;

    @Column(name = "NEW_BALANCE", precision = 10, scale = 3)
    private BigDecimal newBalance;

    @Column(name = "CHANGE_REASON")
    private String changeReason;
}

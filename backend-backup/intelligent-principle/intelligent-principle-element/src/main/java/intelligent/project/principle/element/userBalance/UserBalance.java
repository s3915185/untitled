package intelligent.project.principle.element.userBalance;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Data
@Entity
@Table(name = "USER_BALANCE")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserBalance {
    public long getId() {
        return id;
    }

    public Long getUserId() {
        return userId;
    }

    public BigDecimal getCurrentBalance() {
        return currentBalance;
    }

    public BigDecimal getEstimatedSpending() {
        return estimatedSpending;
    }

    public BigDecimal getGoalBalance() {
        return goalBalance;
    }

    @Id
    @Column(name = "USER_BALANCE_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "CURRENT_BALANCE", precision = 10, scale = 3)
    private BigDecimal currentBalance;

    @Column(name = "ESTIMATED_SPENDING", precision = 10, scale = 3)
    private BigDecimal estimatedSpending;

    @Column(name = "GOAL_BALANCE", precision = 10, scale = 3)
    private BigDecimal goalBalance;
}

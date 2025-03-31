package intelligent.project.principle.element.userMonthlyGoal;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.YearMonth;

@Data
@Entity
@Table(name = "USER_MONTHLY_GOAL")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserMonthlyGoal {
    @Id
    @Column(name = "USER_MONTHLY_GOAL_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "YEAR_MONTH", nullable = false)
    private YearMonth month;

    @Column(name = "SPENDING_LIMIT", precision = 10, scale = 3)
    private BigDecimal spendingLimit;

    @Column(name = "SAVINGS_TARGET", precision = 10, scale = 3)
    private BigDecimal savingsTarget;
}

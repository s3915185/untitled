package intelligent.project.principle.element.userBalance;

import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
class UserBalanceRepositoryCustomImpl implements UserBalanceRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
    @Override
    public UserBalance findUserBalanceByUserId(Long userId) {
        return new JPAQuery<UserBalance>(em)
                .from(QUserBalance.userBalance)
                .where(QUserBalance.userBalance.userId.eq(userId))
                .fetchFirst();
    }
}

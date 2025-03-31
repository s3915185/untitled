package intelligent.project.principle.element.userBalanceHistory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserBalanceHistoryRepository extends JpaRepository<UserBalanceHistory, Long>, UserBalanceHistoryRepositoryCustom {
}

package intelligent.project.principle.element.userBalance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserBalanceRepository extends JpaRepository<UserBalance, Long>, UserBalanceRepositoryCustom {
}

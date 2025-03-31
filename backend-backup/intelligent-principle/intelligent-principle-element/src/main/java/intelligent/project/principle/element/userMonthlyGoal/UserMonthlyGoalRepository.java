package intelligent.project.principle.element.userMonthlyGoal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserMonthlyGoalRepository extends JpaRepository<UserMonthlyGoal, Long>, UserMonthlyGoalRepositoryCustom {
}

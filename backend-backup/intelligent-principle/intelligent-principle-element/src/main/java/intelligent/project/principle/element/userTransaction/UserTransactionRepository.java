package intelligent.project.principle.element.userTransaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserTransactionRepository extends JpaRepository<UserTransaction, Long>, UserTransactionRepositoryCustom {
}

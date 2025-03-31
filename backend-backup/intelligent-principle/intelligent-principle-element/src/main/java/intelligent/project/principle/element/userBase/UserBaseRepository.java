package intelligent.project.principle.element.userBase;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserBaseRepository extends JpaRepository<User, Long>, UserBaseRepositoryCustom {
}

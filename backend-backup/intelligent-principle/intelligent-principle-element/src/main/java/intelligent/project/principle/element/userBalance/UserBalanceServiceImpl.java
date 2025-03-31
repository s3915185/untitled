package intelligent.project.principle.element.userBalance;

import intelligent.project.common.domain.dto.NewBalanceRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
class UserBalanceServiceImpl implements UserBalanceService {
    @Autowired
    private UserBalanceRepository userBalanceRepository;
    @Override
    public boolean changeToNewBalance(NewBalanceRequest request) {
        UserBalance userBalance = userBalanceRepository.findUserBalanceByUserId(request.getId());
        return false;
    }
}

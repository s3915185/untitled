package intelligent.project.principle.element.userBalance;


import intelligent.project.common.domain.dto.NewBalanceRequest;

public interface UserBalanceGlobalService {
    public boolean changeToNewBalance(NewBalanceRequest request);
}

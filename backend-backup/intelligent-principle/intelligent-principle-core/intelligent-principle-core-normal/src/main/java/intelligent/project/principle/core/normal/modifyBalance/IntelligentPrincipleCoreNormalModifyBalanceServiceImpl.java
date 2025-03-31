package intelligent.project.principle.core.normal.modifyBalance;

import intelligent.project.principle.element.userBalance.UserBalanceGlobalService;
import intelligent.project.principle.element.userBalanceHistory.UserBalanceHistoryGlobalService;
import intelligent.project.principle.element.userBase.UserBaseGlobalService;
import intelligent.project.principle.element.userMonthlyGoal.UserMonthlyGoalGlobalService;
import intelligent.project.principle.element.userTransaction.UserTransactionGlobalService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
@NoArgsConstructor
class IntelligentPrincipleCoreNormalModifyBalanceServiceImpl implements IntelligentPrincipleCoreNormalModifyBalanceService {
    @Autowired
    private UserBaseGlobalService userBaseGlobalService;
    @Autowired
    private UserBalanceGlobalService userBalanceGlobalService;
    @Autowired
    private UserBalanceHistoryGlobalService userBalanceHistoryGlobalService;
    @Autowired
    private UserTransactionGlobalService userTransactionGlobalService;
    @Autowired
    private UserMonthlyGoalGlobalService userMonthlyGoalGlobalService;
}

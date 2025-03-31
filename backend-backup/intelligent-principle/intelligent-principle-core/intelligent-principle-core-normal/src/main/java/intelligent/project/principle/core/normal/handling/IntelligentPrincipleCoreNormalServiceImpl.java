package intelligent.project.principle.core.normal.handling;

import intelligent.project.principle.core.normal.modifyBalance.IntelligentPrincipleCoreNormalModifyBalanceGlobalService;
import intelligent.project.principle.core.normal.newTransaction.IntelligentPrincipleCoreNormalNewTransactionGlobalService;
import intelligent.project.principle.core.normal.setMontlyGoal.IntelligentPrincipleCoreNormalSetMonthlyGoalGlobalService;
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
class IntelligentPrincipleCoreNormalServiceImpl implements IntelligentPrincipleCoreNormalService {
    @Autowired
    private IntelligentPrincipleCoreNormalModifyBalanceGlobalService intelligentPrincipleCoreNormalModifyBalanceGlobalService;
    @Autowired
    private IntelligentPrincipleCoreNormalNewTransactionGlobalService intelligentPrincipleCoreNormalNewTransactionGlobalService;
    @Autowired
    private IntelligentPrincipleCoreNormalSetMonthlyGoalGlobalService intelligentPrincipleCoreNormalSetMonthlyGoalGlobalService;
}

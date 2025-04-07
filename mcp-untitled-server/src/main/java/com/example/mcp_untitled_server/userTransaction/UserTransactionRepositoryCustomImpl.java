package com.example.mcp_untitled_server.userTransaction;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.CaseBuilder;
import com.querydsl.core.types.dsl.DateTemplate;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
class UserTransactionRepositoryCustomImpl implements UserTransactionRepositoryCustom {
    @PersistenceContext
    private EntityManager em;
    @Override
    public List<UserTransaction> getListOfTransactionByUserInfoIdAndPeriods(Long userInfoId,
                                                                            LocalDate dateStart,
                                                                            LocalDate dateEnd) {
        return new JPAQuery<UserTransaction>(em)
                .from(QUserTransaction.userTransaction)
                .where(QUserTransaction.userTransaction.userInfoId.eq(userInfoId)
                        .and(QUserTransaction.userTransaction.localDate.between(dateStart, dateEnd)))
                .fetch();
    }

    @Override
    public List<UserTransactionCalendarDTO> getEachDayUpAndDownInfoByUserInfoIdAndPeriods(Long userInfoId,
                                                                                          LocalDate dateStart,
                                                                                          LocalDate dateEnd) {
        QUserTransaction txn = QUserTransaction.userTransaction;

        return new JPAQuery<UserTransactionCalendarDTO>(em)
                .select(Projections.constructor(UserTransactionCalendarDTO.class,
                        txn.localDate,
                        new CaseBuilder()
                                .when(txn.amount.gt(BigDecimal.ZERO))
                                .then(txn.amount)
                                .otherwise(BigDecimal.ZERO)
                                .sum().as("upAmount"),
                        new CaseBuilder()
                                .when(txn.amount.lt(BigDecimal.ZERO))
                                .then(txn.amount)
                                .otherwise(BigDecimal.ZERO)
                                .sum().as("downAmount")
                ))
                .from(txn)
                .where(txn.userInfoId.eq(userInfoId)
                        .and(txn.localDate.between(dateStart, dateEnd)))
                .groupBy(txn.localDate)
                .orderBy(txn.localDate.asc())
                .fetch();
    }

}

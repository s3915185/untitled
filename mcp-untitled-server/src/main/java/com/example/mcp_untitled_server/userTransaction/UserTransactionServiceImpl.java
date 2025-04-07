package com.example.mcp_untitled_server.userTransaction;

import com.example.mcp_untitled_server.userConfiguration.UserConfigurationDTO;
import com.example.mcp_untitled_server.userConfiguration.UserConfigurationGlobalService;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
class UserTransactionServiceImpl implements UserTransactionService {
    private final UserTransactionRepository userTransactionRepository;
    private final UserConfigurationGlobalService userConfigurationGlobalService;

    @Autowired
    public UserTransactionServiceImpl(UserTransactionRepository userTransactionRepository,
                                      UserConfigurationGlobalService userConfigurationGlobalService) {
        this.userTransactionRepository = userTransactionRepository;
        this.userConfigurationGlobalService = userConfigurationGlobalService;
    }

    @Override
    public UserTransactionDTO addNewOneTransaction(UserTransactionDTO transaction) {
        UserConfigurationDTO userConfigurationDTO = userConfigurationGlobalService
                .getConfigurationByUserInfoId(transaction.getUserInfoId());

        List<String> categories = userConfigurationDTO.getCategories();
        String transactionCategory = transaction.getTransactionCategory();
        boolean categoryAllowed = categories.contains(transactionCategory);

        if (!categoryAllowed) {
            throw new IllegalArgumentException("Transaction category '" + transactionCategory + "' is not allowed for this user.");
        }

        return UserTransactionMapper.INSTANCE.toDto(
                userTransactionRepository.save(
                        UserTransactionMapper.INSTANCE.toEntity(transaction)
                )
        );
    }

    @Override
    public List<UserTransactionDTO> addListOfTransactions(List<UserTransactionDTO> transactionDTOList) {
        UserConfigurationDTO userConfigurationDTO = userConfigurationGlobalService
                .getConfigurationByUserInfoId(1L);
        List<String> categories = userConfigurationDTO.getCategories();

        boolean categoryAllowed = transactionDTOList.stream()
                .anyMatch(userTransactionDTO -> !categories.contains(userTransactionDTO.getTransactionCategory()));

        if (!categoryAllowed) {
            throw new IllegalArgumentException("There are some categories are not allowed for this user.");
        }
        return userTransactionRepository.saveAll(transactionDTOList.stream()
                        .map(UserTransactionMapper.INSTANCE::toEntity).toList())
                .stream().map(UserTransactionMapper.INSTANCE::toDto).toList();
    }

    @Override
    public UserTransactionDTO getOneTransactionById(Long id) {
        return UserTransactionMapper.INSTANCE.toDto(userTransactionRepository.findById(id).orElseThrow());
    }

    @Override
    public List<UserTransactionDTO> getListOfTransactionsByIds(Set<Long> ids) {
        return userTransactionRepository.findAllById(ids).stream().map(UserTransactionMapper.INSTANCE::toDto).toList();
    }

    @Override
    public List<UserTransactionDTO> getListOfTransactionsByUserInfoId(Long userInfoId) {
        return userTransactionRepository.findAllByUserInfoId(userInfoId)
                .stream().map(UserTransactionMapper.INSTANCE::toDto).toList();
    }

    @Override
    public UserTransactionDTO modifyOneTransaction(UserTransactionDTO modifiedTransaction) {
        UserTransaction storedUserTransaction = userTransactionRepository.findById(modifiedTransaction.getId()).orElseThrow();
        UserTransactionMapper.INSTANCE.updateEntityFromDto(storedUserTransaction, modifiedTransaction);
        return UserTransactionMapper.INSTANCE.toDto(userTransactionRepository.save(storedUserTransaction));
    }

    @Override
    public List<UserTransactionDTO> modifyListOfTransactions(List<UserTransactionDTO> modifiedTransactionDTOList) {
        Set<Long> userTransactionIds = modifiedTransactionDTOList.stream().map(UserTransactionDTO::getId).collect(Collectors.toSet());
        List<UserTransaction> storedUserTransactions = userTransactionRepository.findAllById(userTransactionIds);
        Map<Long, UserTransactionDTO> userTransactionDTOMap = modifiedTransactionDTOList.stream().collect(
                Collectors.toMap(
                        UserTransactionDTO::getId,
                        userTransactionDTO -> userTransactionDTO
                )
        );

        storedUserTransactions.forEach(
                userTransaction -> UserTransactionMapper.INSTANCE.updateEntityFromDto(
                        userTransaction, userTransactionDTOMap.get(userTransaction.getId())
                ));
        return userTransactionRepository.saveAll(storedUserTransactions)
                .stream().map(UserTransactionMapper.INSTANCE::toDto).toList();
    }

    @Override
    public boolean deleteOneTransactionById(Long id) {
        if (userTransactionRepository.existsById(id)) {
            userTransactionRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<Pair<Long, Boolean>> deleteListOfTransactionsByIds(Set<Long> ids) {
        userTransactionRepository.deleteAllById(ids);
        return Collections.emptyList();
    }

    @Override
    public List<UserTransactionCalendarDTO> getEachDayUpAndDownInfoByUserInfoIdAndPeriods(Long userInfoId, LocalDate dateStart, LocalDate dateEnd) {
        return userTransactionRepository.getEachDayUpAndDownInfoByUserInfoIdAndPeriods(userInfoId, dateStart, dateEnd);
    }

    @Override
    public List<UserTransactionDTO> getListOfTransactionByUserInfoIdAndPeriods(Long userInfoId, LocalDate dateStart, LocalDate dateEnd) {
        return userTransactionRepository.getListOfTransactionByUserInfoIdAndPeriods(userInfoId, dateStart, dateEnd)
                .stream().map(UserTransactionMapper.INSTANCE::toDto).toList();
    }
}

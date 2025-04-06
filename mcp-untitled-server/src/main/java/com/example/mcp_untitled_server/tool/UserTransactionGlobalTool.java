package com.example.mcp_untitled_server.tool;

import com.example.mcp_untitled_server.userTransaction.UserTransactionDTO;
import com.example.mcp_untitled_server.userTransaction.UserTransactionGlobalService;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

@Component
public class UserTransactionGlobalTool {
    private final UserTransactionGlobalService userTransactionGlobalService;

    @Autowired
    public UserTransactionGlobalTool(UserTransactionGlobalService userTransactionGlobalService) {
        this.userTransactionGlobalService = userTransactionGlobalService;
    }

    @Tool(description = "Adds a new user transaction to the system. Accepts a UserConfigurationDTO object containing transaction details and returns the added transaction, including any auto-generated fields like the ID.")
    public UserTransactionDTO addNewOneTransaction(UserTransactionDTO transaction) {
        return userTransactionGlobalService.addNewOneTransaction(transaction);
    }

    @Tool(description = "Adds multiple user transactions to the system. Accepts a list of UserConfigurationDTO objects and returns a list of the added transactions with auto-generated fields like IDs.")
    public List<UserTransactionDTO> addListOfTransactions(List<UserTransactionDTO> transactionDTOList) {
        return userTransactionGlobalService.addListOfTransactions(transactionDTOList);
    }

    @Tool(description = "Fetches a single user transaction by its unique identifier. Returns the UserConfigurationDTO object with the details of the transaction, or null if the transaction is not found.")
    public UserTransactionDTO getOneTransactionById(Long id) {
        return userTransactionGlobalService.getOneTransactionById(id);
    }

    @Tool(description = "Fetches a list of user transactions based on a set of unique transaction IDs. Returns the corresponding list of UserConfigurationDTO objects.")
    public List<UserTransactionDTO> getListOfTransactionsByIds(Set<Long> ids) {
        return userTransactionGlobalService.getListOfTransactionsByIds(ids);
    }

    @Tool(description = "Fetches a list of user transactions based on the userInfoId. Returns the corresponding list of UserConfigurationDTO objects.")
    public List<UserTransactionDTO> getListOfTransactionsByUserInfoId(Long userInfoId) {
        return userTransactionGlobalService.getListOfTransactionsByUserInfoId(userInfoId);
    }

    @Tool(description = "Updates an existing user transaction. Accepts a modified UserConfigurationDTO object and returns the updated transaction with the changes applied.")
    public UserTransactionDTO modifyOneTransaction(UserTransactionDTO modifiedTransaction) {
        return userTransactionGlobalService.modifyOneTransaction(modifiedTransaction);
    }

    @Tool(description = "Updates a list of user transactions. Accepts a list of modified UserConfigurationDTO objects and returns a list of updated transactions.")
    public List<UserTransactionDTO> modifyListOfTransactions(List<UserTransactionDTO> modifiedTransactionDTOList) {
        return userTransactionGlobalService.modifyListOfTransactions(modifiedTransactionDTOList);
    }

    @Tool(description = "Deletes a user transaction by its unique ID. Returns true if the deletion was successful, false if the transaction could not be found or deleted.")
    public boolean deleteOneTransactionById(Long id) {
        return userTransactionGlobalService.deleteOneTransactionById(id);
    }

    @Tool(description = "Deletes a list of user transactions based on a set of transaction IDs. Returns a list of pairs containing the transaction ID and a boolean indicating the success of the deletion.")
    public List<Pair<Long, Boolean>> deleteListOfTransactionsByIds(Set<Long> ids) {
        return userTransactionGlobalService.deleteListOfTransactionsByIds(ids);
    }
}

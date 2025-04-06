package com.example.mcp_untitled_server.userTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user-transaction")
class UserTransactionController {
    private final UserTransactionService userTransactionService;

    @Autowired
    public UserTransactionController(UserTransactionService userTransactionService) {
        this.userTransactionService = userTransactionService;
    }

    @PostMapping
    public List<UserTransactionDTO> addListOfTransactions(@RequestBody List<UserTransactionDTO> transactionDTOList) {
        return userTransactionService.addListOfTransactions(transactionDTOList);
    }

    @GetMapping
    public List<UserTransactionDTO> getListOfTransactionsByUserInfoId(@RequestParam("userInfoId") Long userInfoId) {
        return userTransactionService.getListOfTransactionsByUserInfoId(userInfoId);
    }
}

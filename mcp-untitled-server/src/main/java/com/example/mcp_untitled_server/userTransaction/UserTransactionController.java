package com.example.mcp_untitled_server.userTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/user-transaction")
class UserTransactionController {
    private final UserTransactionService userTransactionService;

    @Autowired
    public UserTransactionController(UserTransactionService userTransactionService) {
        this.userTransactionService = userTransactionService;
    }

    @PostMapping("/add-one")
    public UserTransactionDTO addNewOneTransaction(@RequestBody UserTransactionDTO transaction) {
        return userTransactionService.addNewOneTransaction(transaction);
    }

    @PostMapping("/add-list")
    public List<UserTransactionDTO> addListOfTransactions(@RequestBody List<UserTransactionDTO> transactionDTOList) {
        return userTransactionService.addListOfTransactions(transactionDTOList);
    }

    @GetMapping
    public List<UserTransactionDTO> getListOfTransactionsByUserInfoId(@RequestParam("userInfoId") Long userInfoId) {
        return userTransactionService.getListOfTransactionsByUserInfoId(userInfoId);
    }

    @GetMapping("/calendar-period")
    public  List<UserTransactionCalendarDTO> getEachDayUpAndDownInfoByUserInfoIdAndPeriods(
            @RequestParam("userInfoId") Long userInfoId,
            @RequestParam("dateStart") String dateStartStr,
            @RequestParam("dateEnd") String dateStartEnd) {

        LocalDate dateStart = LocalDate.parse(dateStartStr);
        LocalDate dateEnd = LocalDate.parse(dateStartEnd);

        return userTransactionService.getEachDayUpAndDownInfoByUserInfoIdAndPeriods(userInfoId, dateStart, dateEnd);
    }

    @GetMapping("/transaction-period")
    public List<UserTransactionDTO> getListOfTransactionByUserInfoIdAndPeriods(
            @RequestParam("userInfoId") Long userInfoId,
            @RequestParam("dateStart") String dateStartStr,
            @RequestParam("dateEnd") String dateStartEnd) {

        LocalDate dateStart = LocalDate.parse(dateStartStr);
        LocalDate dateEnd = LocalDate.parse(dateStartEnd);

        return userTransactionService.getListOfTransactionByUserInfoIdAndPeriods(userInfoId, dateStart, dateEnd);
    }

    @DeleteMapping
    public boolean deleteOneTransactionById(@RequestParam("id") Long id) {
        return userTransactionService.deleteOneTransactionById(id);
    }
}

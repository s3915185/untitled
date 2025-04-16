package com.example.mcp_untitled_server.domain.identifant.investor;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class InvestorServiceImpl implements InvestorService {
    private final InvestorRepository investorRepository;
}

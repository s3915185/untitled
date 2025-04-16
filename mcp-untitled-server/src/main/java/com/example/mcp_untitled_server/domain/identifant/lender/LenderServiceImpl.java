package com.example.mcp_untitled_server.domain.identifant.lender;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class LenderServiceImpl implements LenderService {
    private final LenderRepository lenderRepository;
}

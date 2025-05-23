package com.example.mcp_untitled_server.domain.identifant.investor;

import lombok.*;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class InvestorDTO {
    private Long id;
    private Long userConfigurationId;
    private String name;
    private String description;
}

package com.example.mcp_untitled_server.domain.identifant.lender;

import lombok.*;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class LenderDTO {
    private Long id;
    private Long userConfigurationId;
    private String name;
    private String description;
}

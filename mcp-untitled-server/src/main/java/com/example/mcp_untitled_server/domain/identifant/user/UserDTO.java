package com.example.mcp_untitled_server.domain.identifant.user;

import lombok.*;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserDTO {
    private Long id;
    private String name;
}

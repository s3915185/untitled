package com.example.mcp_untitled_server.userConfiguration;
import lombok.*;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserConfigurationDTO {
    private Long id;
    private Long userInfoId;
    private String name;
    private List<String> categories;
}

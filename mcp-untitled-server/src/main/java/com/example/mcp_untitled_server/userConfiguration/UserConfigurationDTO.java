package com.example.mcp_untitled_server.userConfiguration;

import com.example.mcp_untitled_server.utils.CategoriesListConverter;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
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

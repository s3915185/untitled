package com.example.mcp_untitled_server.userConfiguration;

import com.example.mcp_untitled_server.utils.CategoriesListConverter;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Data
@Entity
@Table(name = "USER_CONFIGURATION")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserConfiguration {
    @Id
    @Column(name = "USER_CONFIGURATION_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "USER_INFO_ID")
    private Long userInfoId;

    @Column(name = "CATEGORIES", columnDefinition = "jsonb")
    @Convert(converter = CategoriesListConverter.class)
    private List<String> categories;
}

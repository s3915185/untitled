package com.example.mcp_untitled_server.userInfo;

import com.example.mcp_untitled_server.enums.TransactionCategory;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "USER_INFO")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class UserInfo {
    @Id
    @Column(name = "USER_INFO_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "NAME")
    private String name;
}

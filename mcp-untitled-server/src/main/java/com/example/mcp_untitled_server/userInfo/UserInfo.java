package com.example.mcp_untitled_server.userInfo;

import jakarta.persistence.*;
import lombok.*;


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

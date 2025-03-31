package intelligent.project.principle.element.userBase;

import jakarta.persistence.*;
import lombok.*;

@Data
@Entity
@Table(name = "USER")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class User {
    @Id
    @Column(name = "USER_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "FIRST_NAME")
    private String firstName;

    @Column(name = "LAST_NAME")
    private String lastName;

    @Column(name = "EMAIL")
    private String email;
}

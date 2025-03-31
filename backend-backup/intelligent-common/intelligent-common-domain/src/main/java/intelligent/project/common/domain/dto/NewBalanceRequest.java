package intelligent.project.common.domain.dto;


import lombok.*;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class NewBalanceRequest implements Serializable {
    private Long id;

    public Long getId() {
        return id;
    }

    public BigDecimal getNewBalance() {
        return newBalance;
    }

    private BigDecimal newBalance;
}

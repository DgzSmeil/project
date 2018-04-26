
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

public class SpringTransaction {

    @Transactional(isolation = Isolation.READ_COMMITTED)
    public void isolation(){}
}

package mn.jdbc.bug;

import edu.umd.cs.findbugs.annotations.NonNull;
import io.micronaut.data.annotation.Join;
import io.micronaut.data.jdbc.annotation.JdbcRepository;
import io.micronaut.data.model.query.builder.sql.Dialect;
import io.micronaut.data.repository.CrudRepository;
import mn.jdbc.bug.data.Challenge;

import javax.validation.constraints.NotNull;
import java.util.Optional;

@JdbcRepository(dialect = Dialect.H2)
public interface ChallengeRepository extends CrudRepository<Challenge, Long> {
    @Override
    @Join(value = "authentication")
    @Join(value = "authentication.device")
    @Join(value = "authentication.device.user")
    @NonNull
    Optional<Challenge> findById(@NonNull @NotNull Long aLong);
}

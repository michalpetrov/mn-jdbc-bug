package mn.jdbc.bug;

import io.micronaut.context.annotation.Context;
import io.micronaut.runtime.Micronaut;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.inject.Singleton;
import javax.transaction.Transactional;

@Singleton
@Context
public class Application {
    public static void main(String[] args) {
        Micronaut.run(Application.class);
    }

    @Inject
    private ChallengeRepository challengeRepository;

    @PostConstruct
    @Transactional
    public void getData() {
        challengeRepository.findById(1L);
    }
}
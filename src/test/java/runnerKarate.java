import com.intuit.karate.junit5.Karate;

public class runnerKarate {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:/feature/listarUsuarios.feature");
    }
}

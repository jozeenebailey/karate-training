package examples.conduitApp.runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;


class ConduitTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples")
//                .tags("~@ignore")
                .tags("@debug")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

 /*   @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@debug").relativeTo(getClass());
    }*/

}

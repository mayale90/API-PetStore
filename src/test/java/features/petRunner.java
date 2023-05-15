package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

class petRunner {

    @Karate.Test
    Karate testPet() {
        return Karate.run("petStore/pet").relativeTo(getClass());
    }
}

package com.dfxy.rtrs;

import com.dfxy.pojo.Student;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RtrsApplicationTests {

    private Student student;
    @Test
    void contextLoads() {
        System.out.println(student);
    }

}

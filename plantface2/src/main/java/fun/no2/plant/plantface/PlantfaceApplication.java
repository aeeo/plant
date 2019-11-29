package fun.no2.plant.plantface;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("fun.no2.plant.plantface.mapper")
@EnableTransactionManagement
public class PlantfaceApplication {

    public static void main(String[] args) {
        SpringApplication.run(PlantfaceApplication.class, args);
    }

}

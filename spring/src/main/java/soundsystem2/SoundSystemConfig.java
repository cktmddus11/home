package soundsystem2;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;


@Configuration
@Import(CDPlayerConfig.class)
//@ComponentScan
/*@ComponentScan(basePackages = {"soundsystem2"}, excludeFilters={
@ComponentScan.Filter(type=FilterType.ASSIGNABLE_TYPE, value=SgtPeppers.class)})*/
@ImportResource("classpath:soundsystem2/cd-config.xml")
public class SoundSystemConfig {

}

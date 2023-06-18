package com.ruoyi.common.core.mybatis;

import com.ruoyi.common.core.mybatis.Interceptor.MyBatisInterceptorPlugin;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author FGQ
 * @Date 2023/5/21 11:45 AM
 * @PackageName:com.ruoyi.common.security.mybatis
 * @ClassName: MybatisConfig
 * @Description: TODO
 * @Version 1.0
 */
@Configuration
//@MapperScan("com.ruoyi.**.mapper") // 设置 MyBatis Mapper 接口的扫描路径
public class MybatisConfig {

    @Bean
    ConfigurationCustomizer mybatisConfigurationCustomizer() {
        return new ConfigurationCustomizer() {
            @Override
            public void customize(org.apache.ibatis.session.Configuration configuration) {
                configuration.addInterceptor(new MyBatisInterceptorPlugin());
            }
        };
    }
}
package com.ruoyi.common.core.mybatis.Interceptor;

import com.ruoyi.common.core.annotation.IdAnnotation;
import com.ruoyi.common.core.utils.SnowflakeIdWorker;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMap;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;
import java.util.function.Supplier;

/**
 * @Author FGQ
 * @Date 2023/5/21 11:49 AM
 * @PackageName:com.ruoyi.common.security.mybatis.Interceptor
 * @ClassName: SnowflakeKeyGenerator
 * @Description: TODO
 * @Version 1.0
 */
@Intercepts({@Signature(type = Executor.class,method = "update",args = {MappedStatement.class,Object.class})})
public class MyBatisInterceptorPlugin implements Interceptor {
    private static final Logger logger= LoggerFactory.getLogger(MyBatisInterceptorPlugin.class);
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();
        MappedStatement arg = (MappedStatement) args[0];
        if (SqlCommandType.INSERT.name().equals(arg.getSqlCommandType().name())) {
            ParameterMap parameterMap = arg.getParameterMap();
            Class<?> type = parameterMap.getType();
            Field[] fields = type.getDeclaredFields();
            Object arg1 = args[1];
            for (Field field : fields) {
                IdAnnotation annotation = field.getAnnotation(IdAnnotation.class);
                if (annotation != null) {
                    setField(arg1, field.getName(), SnowflakeIdWorker.getId());
                }
            }

        }
        return invocation.proceed();
    }
    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o,this);
    }
    @Override
    public void setProperties(Properties properties) {
        logger.warn(new Supplier<String>() {
            @Override
            public String get() {
                return properties.toString();
            }
        });
    }

    public static void setField(Object o,String args,Object attributeValue){
        Class cls = o.getClass();
        //判断该属性是否存在
        Field field = null;
        try {
            field = cls.getDeclaredField(args);
            if(field == null){
                field = cls.getField(args);
            }
            if(field == null){
                return;
            }
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }

        String fieldName = "set"+args.substring(0,1).toUpperCase()+(args.length()>1?args.substring(1):"");
        Method method = null;
        try {
            method = cls.getMethod(fieldName,attributeValue.getClass());
            method.invoke(o,attributeValue);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}


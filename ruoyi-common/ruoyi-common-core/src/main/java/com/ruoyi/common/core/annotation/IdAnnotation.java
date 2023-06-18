package com.ruoyi.common.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Author FGQ
 * @Date 2023/5/21 12:53 PM
 * @PackageName:com.ruoyi.common.security.annotation
 * @ClassName: IdAnnotation
 * @Description: TODO
 * @Version 1.0
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface IdAnnotation {
}

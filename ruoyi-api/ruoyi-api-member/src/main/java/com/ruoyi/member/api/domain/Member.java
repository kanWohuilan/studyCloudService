package com.ruoyi.member.api.domain;

/**
 * @Author FGQ
 * @Date 2023/5/19 1:32 AM
 * @PackageName:com.ruoyi.member.api.domain
 * @ClassName: Member
 * @Description: TODO
 * @Version 1.0
 */

import com.ruoyi.common.core.web.domain.BaseEntity;
import com.ruoyi.common.core.annotation.IdAnnotation;
import lombok.Data;

import java.util.Date;

/**
 * @description 会员表
 * @author zhengkai.blog.csdn.net
 * @date 2023-05-21
 */
@Data
public class Member extends BaseEntity {

    @IdAnnotation
    /**
     * id
     */
    private Long id;

    /**
     * member_level_id
     */
    private Long memberLevelId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 帐号启用状态:0->禁用；1->启用
     */
    private Integer status;

    /**
     * 注册时间
     */
    private Date createTime;

    /**
     * 头像
     */
    private String icon;

    /**
     * 性别：0->未知；1->男；2->女
     */
    private Integer gender;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 所做城市
     */
    private String city;

    /**
     * 职业
     */
    private String job;

    /**
     * 个性签名
     */
    private String personalizedSignature;

    /**
     * 用户来源
     */
    private Integer sourceType;

    /**
     * 积分
     */
    private Integer integration;

    /**
     * 成长值
     */
    private Integer growth;

    /**
     * 剩余抽奖次数
     */
    private Integer luckeyCount;

    /**
     * 历史积分数量
     */
    private Integer historyIntegration;
    /**
     * 历史积分数量
     */
    private Integer delFlag;
}

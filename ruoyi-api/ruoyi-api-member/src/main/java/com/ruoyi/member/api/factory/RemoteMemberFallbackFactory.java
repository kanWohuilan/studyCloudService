package com.ruoyi.member.api.factory;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.member.api.RemoteMemberService;
import com.ruoyi.member.api.domain.Member;
import com.ruoyi.member.api.model.LoginUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 用户服务降级处理
 *
 * @author ruoyi
 */
@Component
public class RemoteMemberFallbackFactory implements FallbackFactory<RemoteMemberService>
{
    private static final Logger log = LoggerFactory.getLogger(RemoteMemberFallbackFactory.class);

    @Override
    public RemoteMemberService create(Throwable throwable)
    {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteMemberService()
        {
            @Override
            public R<LoginUser<Member>> getUserInfo(String username, String source)
            {
                return R.fail("获取用户失败:" + throwable.getMessage());
            }

            @Override
            public R<Boolean> registerUserInfo(Member sysUser, String source) {
                return null;
            }

//            @Override
//            public R<Boolean> registerUserInfo(Member member, String source)
//            {
//                return R.fail("注册用户失败:" + throwable.getMessage());
//            }
        };
    }
}

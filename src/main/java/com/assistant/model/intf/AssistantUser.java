package com.assistant.model.intf;

import com.alibaba.fastjson.annotation.JSONField;
import com.assistant.constant.AssistantContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;

public interface AssistantUser extends Serializable, UserDetails {
    @Override
    @JSONField(serialize = false)
    default Collection<? extends GrantedAuthority> getAuthorities() {
        String name = AssistantContext.ROLE_ + this.getClass().getSimpleName().toUpperCase();
        return new HashSet<>() {{
            add(new SimpleGrantedAuthority(name));
        }};
    }

    @Override
    @JSONField(serialize = false)
    default boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JSONField(serialize = false)
    default boolean isAccountNonLocked() {
        return true;
    }

    @Override
    @JSONField(serialize = false)
    default boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JSONField(serialize = false)
    default boolean isEnabled() {
        return true;
    }
}

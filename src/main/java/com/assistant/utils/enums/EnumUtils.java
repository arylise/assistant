package com.assistant.utils.enums;


import org.springframework.util.StringUtils;

public final class EnumUtils {

    public static <T> boolean isExist(ValueEnum<T>[] enums, T value) {
        if (value == null) {
            return false;
        }
        for (ValueEnum<T> e : enums) {
            if (value.equals(e.getValue())) {
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    public static <E extends Enum<? extends ValueEnum<V>>, V> boolean isExist(Class<E> enumClass, V value) {
        for (Enum<? extends ValueEnum<V>> e : enumClass.getEnumConstants()) {
            if (((ValueEnum<V>) e).getValue().equals(value)) {
                return true;
            }
        }
        return false;
    }

    public static <T> String getNameByValue(NameValueEnum<T>[] enums, T value) {
        if (value == null) {
            return null;
        }
        for (NameValueEnum<T> e : enums) {
            if (value.equals(e.getValue())) {
                return e.getName();
            }
        }
        return null;
    }

    public static <T> T getValueByName(NameValueEnum<T>[] enums, String name) {
        if (StringUtils.isEmpty(name)) {
            return null;
        }
        for (NameValueEnum<T> e : enums) {
            if (name.equals(e.getName())) {
                return e.getValue();
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public static <E extends Enum<? extends ValueEnum<V>>, V> E getEnumByValue(E[] enums, V value) {
        for (E e : enums) {
            if (((ValueEnum<V>) e).getValue().equals(value)) {
                return e;
            }
        }
        return null;
    }

    public static <E extends Enum<? extends ValueEnum<V>>, V> E getEnumByValue(Class<E> enumClass, V value) {
        return getEnumByValue(enumClass.getEnumConstants(), value);
    }
}

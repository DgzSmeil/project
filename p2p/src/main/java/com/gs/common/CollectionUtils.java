package com.gs.common;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/9/29.
 */
public class CollectionUtils {

    public static <T> Set<T> listToSet(List<T> tList) {
        Set<T> tSet = new HashSet<T>();
        for (T t : tList) {
            tSet.add(t);
        }
        return tSet;
    }

}

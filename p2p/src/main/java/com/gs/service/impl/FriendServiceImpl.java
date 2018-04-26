package com.gs.service.impl;

import com.gs.bean.Friend;
import com.gs.dao.FriendDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/1/9.
 */
@Service
public class FriendServiceImpl extends AbstractBaseService implements FriendService {

    private FriendDAO friendDAO;

    @Autowired
    public void setFriendDAO(FriendDAO friendDAO) {
        super.setBaseDAO(friendDAO);
        this.friendDAO = friendDAO;
    }

    @Override
    public List<Friend> listFriendShow() {
        return friendDAO.listFriendShow();
    }
}

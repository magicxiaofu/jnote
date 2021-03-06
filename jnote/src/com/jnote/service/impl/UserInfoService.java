package com.jnote.service.impl;

import com.jnote.dao.UserInfoDAO;
import com.jnote.service.IUserInfoService;
import com.jnote.vo.UserInfo;


public class UserInfoService implements IUserInfoService {
	private UserInfoDAO userInfoDao;
	

	/* (non-Javadoc)
	 * @see com.jnote.service.IUserInfoService#updateUserInfo(com.jnote.vo.UserInfo)
	 */
	public UserInfoDAO getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDAO userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public int updateUserInfo(UserInfo ui) {
		int resultLine = 0;
		if(ui.getUserid() != null){
			if(this.findUserInfoByUserId(ui.getUserid()) == null){
				//
				//ui中加入headurl
//				ui.setHeadurl("${pageContext.request.contextPath}/head/" + ui.getUserid() + ".jpg");
//				System.out.println("userinfoservice:uiheadurl"+ui.getHeadurl());
				this.userInfoDao.save(ui);
				return 1;
			}else{
				UserInfo uiTemp = this.findUserInfoByUserId(ui.getUserid());
				uiTemp.setEmail(ui.getEmail());
				uiTemp.setTel(ui.getTel());
				resultLine = this.userInfoDao.updateUserInfo(uiTemp);
			}
		}
		return resultLine;
	}

	/* (non-Javadoc)
	 * @see com.jnote.service.IUserInfoService#findUserInfoByUserId(int)
	 */
	public UserInfo findUserInfoByUserId(int userid) {
		return this.userInfoDao.findByUserid(userid);
	}

	/* (non-Javadoc)
	 * @see com.jnote.service.IUserInfoService#updateUserInfoUrl(com.jnote.vo.UserInfo)
	 */
	public int updateUserInfoUrl(UserInfo ui) {
		int resultLine = 0;
		if(ui.getUserid() != null){
			if(this.findUserInfoByUserId(ui.getUserid()) == null){
				//数据库中还没有用户的信息就调用save保存
				this.userInfoDao.save(ui);
				return 1;
			}else{
				//数据库中已经存在用户信息，取出信息后将url加入再update操作
				UserInfo userInfo = this.findUserInfoByUserId(ui.getUserid());
				userInfo.setHeadurl(ui.getHeadurl());
				resultLine = this.userInfoDao.updateUserInfo(userInfo);
			}
		}
		return resultLine;
	}

}

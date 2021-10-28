package com.devpro.shop79.services;

import java.util.List;

import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.UserSearchModel;
import com.devpro.shop79.entities.Categories;
import org.springframework.stereotype.Service;

import com.devpro.shop79.entities.User;
import org.springframework.util.StringUtils;


@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.runTransactQuerySQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}

	public PagerData<User> search(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";

		if (searchModel != null) {
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and u.seo = '" + searchModel.getSeo() + "'";
			}

			//tìm theo Id
			if (!StringUtils.isEmpty(searchModel.getId())) {
				sql += " and u.id = '" + searchModel.getId() + "'";
			}
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (u.username like '%" + searchModel.keyword + "%'" + " or u.email like '%" + searchModel.keyword + "%'" + " or u.name_user like '%"
						+ searchModel.keyword + "%')";
			}
		}

		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}
	
}

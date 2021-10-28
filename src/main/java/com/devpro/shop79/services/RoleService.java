package com.devpro.shop79.services;

import com.devpro.shop79.dto.RoleSearchModel;
import com.devpro.shop79.dto.UserSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Role;
import com.devpro.shop79.entities.User;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class RoleService extends BaseService<Role> {
    @Override
    protected Class<Role> clazz(){
        return Role.class;
    }

    public PagerData<Role> search(RoleSearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_roles r WHERE 1=1";

        if (searchModel != null) {
            //tìm theo seo

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and r.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (r.name like '%" + searchModel.keyword + "%'" + " or r.description like '%" + searchModel.keyword + "%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }
}

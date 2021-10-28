//package com.devpro.shop79.services;
//
//import com.devpro.shop79.dto.RoleSearchModel;
//import com.devpro.shop79.dto.UserSearchModel;
//import com.devpro.shop79.entities.Role;
//import com.devpro.shop79.entities.UserRole;
//import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;
//
//@Service // là 1 bean<service>
//public class UserRoleService extends BaseService<UserRole> {
//    @Override
//    protected Class<UserRole> clazz(){
//        return UserRole.class;
//    }
//
//    public PagerData<UserRole> search(UserSearchModel searchModel) {
//
//        // khởi tạo câu lệnh
//        String sql = "SELECT * FROM tbl_users_roles r WHERE 1=1";
//
//        if (searchModel != null) {
//            //tìm theo seo
//
//            //tìm theo Id
//            if (searchModel != null) {
//                //tìm theo seo
//
//                //tìm theo Id
//                if (!StringUtils.isEmpty(searchModel.getId())) {
//                    sql += " and r.user_id = '" + searchModel.getId() + "'";
//                }
//            }
//        }
//
//        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
//    }
//}

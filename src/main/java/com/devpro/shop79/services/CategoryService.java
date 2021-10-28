package com.devpro.shop79.services;

import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.entities.Categories;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class CategoryService extends BaseService<Categories> {
    @Override
    protected Class<Categories> clazz() {
        return Categories.class;
    }

    /**
     * ở mỗi service sẽ cần định nghĩa 1 hàm search
     * @param searchModel
     * @return
     */
    public PagerData<Categories> search(CategorySearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_category c WHERE 1=1";

        if (searchModel != null) {
            //tìm theo seo
            if (!StringUtils.isEmpty(searchModel.getSeo())) {
                sql += " and c.seo = '" + searchModel.getSeo() + "'";
            }

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and c.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (c.name like '%" + searchModel.keyword + "%'" + " or c.description like '%"
                        + searchModel.keyword + "%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }

}

package com.devpro.shop79.services;

import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.ProductDetailsSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Details;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class DetailsService extends BaseService<Details> {
    @Override
    protected Class<Details> clazz() {
        return Details.class;
    }

    /**
     * ở mỗi service sẽ cần định nghĩa 1 hàm search
     * @param searchModel
     * @return
     */
    public PagerData<Details> search(ProductDetailsSearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_product_details c WHERE 1=1";

        if (searchModel != null) {

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and c.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (c.product_detail_id like '%" + searchModel.keyword +"%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }

}

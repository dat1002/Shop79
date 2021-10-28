package com.devpro.shop79.services;

import com.devpro.shop79.dto.CategorySearchModel;
import com.devpro.shop79.dto.SaleOrderSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.SaleOrder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class SaleOrderService extends BaseService<SaleOrder> {
    @Override
    protected Class<SaleOrder> clazz(){
        return SaleOrder.class;
    }

    public PagerData<SaleOrder> search(SaleOrderSearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1";

        if (searchModel != null) {
            //tìm theo seo
            if (!StringUtils.isEmpty(searchModel.getSeo())) {
                sql += " and s.seo = '" + searchModel.getSeo() + "'";
            }

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and s.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (s.customer_name like '%" + searchModel.keyword + "%'" + " or s.customer_email like '%"
                        + searchModel.keyword + "%'" + " or s.customer_phone like '%" + searchModel.keyword + "%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }
}

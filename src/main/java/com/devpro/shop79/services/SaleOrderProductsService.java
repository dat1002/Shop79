package com.devpro.shop79.services;

import com.devpro.shop79.dto.SaleOrderSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.SaleOrder;
import com.devpro.shop79.entities.SaleOrderProducts;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class SaleOrderProductsService extends BaseService<SaleOrderProducts> {
    @Override
    protected Class<SaleOrderProducts> clazz(){
        return SaleOrderProducts.class;
    }
    public PagerData<SaleOrderProducts> search(SaleOrderSearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_saleorder sp WHERE 1=1";

        if (searchModel != null) {
            //tìm theo saleorder_id
            if (!StringUtils.isEmpty(searchModel.getSaleOrderId())) {
                sql += " and sp.saleorder_id = '" + searchModel.getSaleOrderId() + "'";
            }

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and sp.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (sp.saleorder_id like '%" + searchModel.keyword  + "%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }
}

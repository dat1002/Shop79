package com.devpro.shop79.services;

import com.devpro.shop79.dto.ProductDetailsSearchModel;
import com.devpro.shop79.dto.ProductImageSearchModel;
import com.devpro.shop79.entities.Categories;
import com.devpro.shop79.entities.Details;
import com.devpro.shop79.entities.ProductImages;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service // là 1 bean<service>
public class ProductImagesService extends BaseService<ProductImages> {
    @Override
    protected Class<ProductImages> clazz(){
        return ProductImages.class;
    }
    public PagerData<ProductImages> search(ProductImageSearchModel searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT * FROM tbl_products_images i WHERE 1=1";

        if (searchModel != null) {

            //tìm theo Id
            if (!StringUtils.isEmpty(searchModel.getId())) {
                sql += " and i.id = '" + searchModel.getId() + "'";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (i.title like '%" + searchModel.keyword +"%')";
            }
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
    }
}

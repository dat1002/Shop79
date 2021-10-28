//package com.devpro.shop79.components;
//
//import java.math.BigDecimal;
//import java.util.Date;
//import java.util.HashSet;
//import java.util.Set;
//
//import com.devpro.shop79.entities.Product;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.context.event.ApplicationReadyEvent;
//import org.springframework.context.ApplicationListener;
//import org.springframework.stereotype.Component;
//
//import com.devpro.shop79.entities.Categories;
//import com.devpro.shop79.services.CategoryService;
//
//@Component // bean
//public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {
//
//	@Autowired // inject 1 bean vào trong 1 bean khác
//	private CategoryService categoryService;
//
//	/**
//	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
//	 */
//	@Override
//	public void onApplicationEvent(final ApplicationReadyEvent event)
//	{
//		this.seedCategoryJava();
//	}
//
//	private void seedCategoryJava(){
//		Categories cateJava = categoryService.getByTransactQuerySQL("SELECT * FROM test_import.tbl_category where Name = 'Java'");
//
//		if(cateJava == null){
//			cateJava = new Categories();
//			cateJava.setName("Java");
//			cateJava.setDescription("Java");
//			cateJava.setCreatedDate(new Date());
//			categoryService.saveOrUpdate(cateJava);
//
//			for (int i = 0; i < 20; i++) {
//				Product p = new Product();
//				p.setTitle("Java Title"+i);
//				p.setShortDes("Java ShortDes"+i);
//				p.setDetails("Java Details"+i);
//				p.setPrice(new BigDecimal("1000"));
//				p.setCreatedDate(new Date());
//				cateJava.addProduct(p);
//			}
//		}
//		else{
//			cateJava.setUpdatedDate(new Date());
//		}
//		// Thêm danh sách
//		categoryService.saveOrUpdate(cateJava);
//	}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////	private void seedCategoryJava(){
////		Categories cateJava = categoryService.getByTransactQuerySQL("SELECT * FROM test_import.tbl_category where name = 'Java';");
////		//Nếu không có thì thêm mới
////
////
////		if(cateJava == null ){
////			cateJava = new Categories();
////			cateJava.setName("Java");
////			cateJava.setDescription("Java");
////			cateJava.setCreatedDate(new Date());
////
////			// them danh sách sản phẩm cho java
////			Set<Product> products = new HashSet<Product>();
////			for (int i = 0; i < 20; i++) {
////				Product p = new Product();
////				p.setTitle("Java Title"+ i);
////				p.setShortDes("Java ShortDes"+i);
////				p.setDetails("Java Details"+i);
////				p.setPrice(new BigDecimal("1000"));
////				p.setCreatedDate(new Date());
////
////				cateJava.addProduct(p);
////			}
////		} else { // chỉnh sửa
////			cateJava.setUpdatedDate(new Date());
////		}
////		categoryService.saveOrUpdate(cateJava);
////	}
//}

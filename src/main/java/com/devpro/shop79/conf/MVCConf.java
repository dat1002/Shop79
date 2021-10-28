package com.devpro.shop79.conf;

import com.devpro.shop79.Constants;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration // -> đây là 1 BEAN cho loại Cấu hình.


/***
 * Thực hiện định nghĩa các static resources
 * classpath: tương ứng với folder: src/main/resources
 * @author NVDat
 *
 */
public class MVCConf implements WebMvcConfigurer, Constants {
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");

		// đăng kí thêm static resource handler
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+ UPLOAD_FOLDER_ROOT);
	}

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		// thiet lap engine
		bean.setViewClass(JstlView.class);
		// duong dan
		bean.setPrefix("/WEB-INF/views/");
		//
		bean.setSuffix(".jsp");
		return bean;
	}
}

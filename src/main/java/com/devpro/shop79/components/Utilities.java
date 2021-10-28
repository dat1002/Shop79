package com.devpro.shop79.components;

import com.github.slugify.Slugify;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Utilities {

	public static String slugify(String text) {
		return new Slugify().slugify(text);
	}
	public static String encode(String text){return new BCryptPasswordEncoder(4).encode(text);}
	public static void main(String[] args) {
		
		// sử dụng slugify tạo seo
		String productTitle = "Java Title 6"; // -> java-title-6
		String productTitleSeo = new Slugify().slugify(productTitle);
		System.out.println(productTitleSeo);
		System.out.println(new BCryptPasswordEncoder(4).encode("nvdat"));;
		String pass ="datnv";
		String passWord = encode(pass);
		System.out.println(passWord);
	}
	
}

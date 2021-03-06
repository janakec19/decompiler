package com.mkyong.webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//https://www.agilegroup.co.jp/technote/springboot-fileupload-error-handling.html
@SpringBootApplication
@Configuration
@ComponentScan(value = { "com.mkyong.*" })
public class SpringBootWebApplication extends SpringBootServletInitializer {

	private int maxUploadSizeInMb = 10 * 1024 * 1024; // 10 MB

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringBootWebApplication.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(SpringBootWebApplication.class, args);
	}

	// Tomcat large file upload connection reset
	// http://www.mkyong.com/spring/spring-file-upload-and-connection-reset-issue/
	/*
	 * @Bean public TomcatEmbeddedServletContainerFactory tomcatEmbedded() {
	 * 
	 * TomcatEmbeddedServletContainerFactory tomcat = new
	 * TomcatEmbeddedServletContainerFactory();
	 * 
	 * tomcat.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
	 * if ((connector.getProtocolHandler() instanceof
	 * AbstractHttp11Protocol<?>)) { //-1 means unlimited
	 * ((AbstractHttp11Protocol<?>)
	 * connector.getProtocolHandler()).setMaxSwallowSize(-1); } });
	 * 
	 * return tomcat;
	 * 
	 * }
	 */

}
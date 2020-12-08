package edu.ues21.tattoo.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[]{WebApplicationContextConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		//return new Class[]{WebApplicationContextConfig.class};
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}

}

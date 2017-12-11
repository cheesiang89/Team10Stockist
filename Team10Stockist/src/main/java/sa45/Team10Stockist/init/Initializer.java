package sa45.Team10Stockist.init;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

public class Initializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebAppConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Filter[] getServletFilters() {

		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[] { characterEncodingFilter, new SiteMeshFilter() };
	}

	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(WebAppConfig.class);
		ctx.setServletContext(servletContext);
		Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);
		servlet.setInitParameter("throwExceptionIfNoHandlerFound", "true");

		// UTF-8 Encoding
		FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
		fr.setInitParameter("encoding", "UTF-8");
		fr.setInitParameter("forceEncoding", "true");
		fr.addMappingForUrlPatterns(null, true, "/*");

		// SiteMesh
		fr = servletContext.addFilter("sitemesh", new SiteMeshFilter());
		fr.addMappingForUrlPatterns(null, true, "/*");
	}

}

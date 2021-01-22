package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 요청을 가로채서 필터링을 하는 역할
// web.xml 필터 설정 대신에 annotation 을 활용해서 필터를 동작하게 할 수 있다.
// users 아래 private 안의 *(모든) 파일들
// urlPatterns = {} 를 이용하면 여러개의 필터를 넣을 수 있다.
@WebFilter(urlPatterns = {"/gallery/private/*","/users/private/*","/cafe/private/*", "/file/private/*"})
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1. 로그인된 클라이언트인지 확인
		// 부모 type 을 자식 type 으로 casting
		HttpServletRequest req=(HttpServletRequest)request;
		// 자식 type 을 이용해서 HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session=req.getSession();
		// 로그인된 아이디가 있는지 읽어온다.
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			// 2. 만일 로그인 했으면 관여하지 않고 요청의 흐름을 이어간다.
			chain.doFilter(request, response);
		}else {
			/*
			 *  로그인 페이지로 강제 리다일렉트 됬다면
			 *  로그인 성공 후에 원래 가려던 목적지로 다시 보내야 하고
			 *  GET 방식 전송 파라미터가 있다면 파라미터 정보도 같이 가지고 갈 수 있도록 해야한다.
			 */
			// 원래 가려던 url 정보 읽어오기
			// URL => Uniform Resource Location / URI 를 포함한 상위 개념이다.
			// URI => Uniform Resource Identifier
			// /member/list.jsp 와 같은 특정 자원을 찾는 식별자이다.
			String url=req.getRequestURI();
			// GET 방식 전송 파라미터를 query 문자열로 읽어오기 ( a=xxx&b=yyy&c=xxx )
			String query=req.getQueryString();
			// 특수 문자는 인코딩을 해야한다.
			String encodedUrl=null;
			if(query==null) { // 전송 파라미터가 없다면
				encodedUrl=URLEncoder.encode(url);
			}else {
				// 원래 목적지가 /test/xxx.jsp 라고 가정하면 아래와 같은 형식의 문자열을 만든다.
				// "/test/xxx.jsp?a=xxx&b=yyy ..."
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			// 3. 로그인을 하지 않았으면 로그인폼으로 이동할 수 있도록 리다일렉트 응답을 준다.
			String cPath=req.getContextPath();
			// ServletResponse type 을 HttpServletResponse type 으로 casting
			HttpServletResponse res=(HttpServletResponse)response;
			// 리다일렉트 시킬때 원래 목적지 정보를 url 이라는 파라미터명으로 같이 보낸다.
			res.sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}

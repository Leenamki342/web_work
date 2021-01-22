package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 오늘의 운세를 얻어오는 비즈니스 로직을 수행했다고 가정하자
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
		
		//2. 로직의 수행결과 데이터 (모델) 을 HttpServletRequest 객체에 담는다.
		// request scope (요청 영역) 에 담는다고도 한다.
		
		// "fortuneToday" 라는 키값으로 String type 담기 (어떤 type 이든 담을수 있다)
		req.setAttribute("fortuneToday", fortuneToday);
		
		//3. jsp 페이지로 forward 이동해서 응답한다. 
		// forward 이동은 응답을 위임하는 이동 방법이다. (서버내에서 이동)
		// html 을 사용하기 쉽기 때문에 jsp 페이지로 forward 이동을 해서 처리를 한다.
		// "/test/fortune.jsp" 는 WebContent/test/fortune.jsp 페이지를 가리킨다.
		// forward 이동할때는 context path 를 사용하지 않는다. 
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		// RequestDispatcher  객체의 forward()  메소드를 호출하면서 
		// HttpServletRequest 객체와 HttpServletResponse  객체의 참조값을 전달하면
		// forward 이동이 된다. 
		rd.forward(req, resp);
		
		// request 영역에 저장하는 방법 ( 응답하고나서 바로 사라짐 / 응답하기 전까지 일정시간 유지됨 )
		// HttpServletRequest 객체.setAttribute(key, value)
		// 읽어오는 방법
		// .getAttribute(key)
		// 지우는 방법
		// .removeAttribute(key)
		
		// session 영역에 저장 ( 응답 후 유지됨 ) => 이전에 사용했던 기록을 가짐
		// HttpSession 객체.setAttribute(key, value)
		// 읽어오는 방법
		// .getAttribute(key)
		// 지우는 방법
		// .removeAtrribute(key)
		
		// servlet 은 복잡한 로직을 요청받아 처리 => Data(Model) 처리 결과(int, String...)를
		// request에 담아서 jsp에 넘겨주고 client에게 응답한다.
		// 여기서 다양한 타입의 값을 담아서 넘겨주기 때문에 캐스팅이 필요할때가 있다.
	}
}













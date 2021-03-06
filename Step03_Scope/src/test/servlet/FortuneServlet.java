package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.오늘의 운세를 얻어오는 비즈니스 로직을 수행했다고 가정하자
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
		
		//2.로직의 수행결과 데이터(모델)을 HttpServletRequest 객체에 담는다.
		// request scope(요청영역)에 담는다고도 한다.
		
		// "fortuneToday" 라는 키값으로 String type 담기 (어떤 type 이든 담을 수 있다.)
		req.setAttribute("fortuneToday", fortuneToday);
	
		
		//3. jsp 페이지로 forward 이동해서 응답한다.
		// forward 이동은 응답을 위임하는 이동 방법이다.
		// "/test/fortune.jsp" 는 WebContent/test/fortune.jsp 페이지를 가리킨다.
		// forward 이동할때는 context path를 사용하지 않는다.
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		// RequestDispatcher 객체의 forward() 메소드를 호출하면서
		// HttpServletRequest 객체와 HttpServletResponse 객체의 참조값을 전달하면
		// forward 이동이 된다.
		rd.forward(req,resp);
		
		
				
		
	}
}

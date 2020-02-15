package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class HTMLUtils {

	public static void writeJson(HttpServletResponse response,String jsonStr){
		
		try {
			
			response.setContentType("text/html");
			response.setHeader("Pragma", "No-cache");//设置页面不缓存
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out= null;
			out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

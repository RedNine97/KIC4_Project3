package action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class U_kakaoTokenAction implements CommandAction {
	/*
	 * kakaoAPI에게 받은 authorization_code를 다시 kakaoAPI에게 
	 * 넘겨서 access_token과 refresh_token을 받아온다.
	 */
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String code=request.getParameter("code");
		System.out.println("code==>"+code);
		String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
		
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=68b5d62555197f364178583e0abab8a1");
            sb.append("&redirect_uri=http://localhost:8090/KIC4_Project3/U_kakaoToken.shop");
            sb.append("&code=" + code);
            sb.append("&scope=profile_nickname&scope=profile_image&scope=account_email&scope=age_range");
            bw.write(sb.toString());
            bw.flush();
            
            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            //toString()은 Json파싱을 할때 사용X (""가 2개가 들어가기 때문이다.)
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        } 
		
        request.setAttribute("access_Token", access_Token);
        request.setAttribute("refresh_Token", refresh_Token);
        request.setAttribute("code", code);
		return "/U_kakaoToken.jsp";
	}

}

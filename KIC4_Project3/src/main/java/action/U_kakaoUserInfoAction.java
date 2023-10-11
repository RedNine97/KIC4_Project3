package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class U_kakaoUserInfoAction implements CommandAction {
	/*
	 * 전달받은 access_Token을 이용해서 사용자 정보를 조회하기
	 */
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String access_Token=request.getParameter("access_Token");
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        
	        //요청에 필요한 Header에 포함될 내용, access_token전송
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        //코드가 200이면 성공, 400~은 실패
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode(UserInfo) : " + responseCode);
	        
	        //JSON타입의 Response 메세지
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body(UserInfo) : " + result);
	        
	        //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	      
	        int memid = element.getAsJsonObject().get("id").getAsInt();
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        //선택(연령) - 체크 안했다면 로그인 실패
	        if(kakao_account.get("age_range")==null) {
	        	return "/U_KakaoLogError.shop";
	        }
	        String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	        
	        boolean has_age_range = kakao_account.get("has_age_range").getAsBoolean();
	        if(!has_age_range){
	        	return "/U_KakaoLogError.shop?age_range="+age_range;
	        }
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
	        
	        request.setAttribute("memid", String.valueOf(memid));
	        request.setAttribute("email", email);
	        request.setAttribute("nickname", nickname);
	        request.setAttribute("age_range", age_range);
	        request.setAttribute("thumbnail_image", thumbnail_image);
	        request.setAttribute("access_Token", access_Token);
	        
	        br.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
		return "/U_kakaoUserInfo.jsp";
	}

}

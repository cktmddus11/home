package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoController {

	/* static 메서드로 선언해서 객체가 생성되지 않은 상황에서도
	 * 사용이 가능. 그래서 static 멤버들만 사용 가능 */
	
	
	private final static String K_CLIENT_ID = "e26813a1bfbea6b3df6f9370af454e33";
	private final static String K_REDIRECT_URl = "http://localhost:8080/kakaofriends/user/login.store";

	// 카카오 로그인 화면이로 이동하는 주소값 리턴
	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URl + "&response_type=code";
		return kakaoUrl;

	}
	// 사용자 정보가 저장되어있는 토큰 불러오는 함수
	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));// REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URl)); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 코드
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
	return returnNode;
	}
	// 사용자 정보를 jsonNode 타입으로 리턴시킴
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
			// v1으로 하면 이메일 정보정도만 가져옴 
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		//String accessToken = getAccessToken(accessToken2);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);

		JsonNode returnNode = null;

		try {

			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println(returnNode);
			/*
			 * {"id":1252312376,"connected_at":"2020-01-05T04:24:08Z",
				"properties":{"nickname":"test"}
				,"kakao_account":{
				"profile_needs_agreement":false,
				"profile":{"nickname":"test"},
				"has_email":true,
				"email_needs_agreement":false,
				"is_email_valid":true,
				"is_email_verified":true,
				"email":"cktmddus11@naver.com",
				"has_age_range":true,
				"age_range_needs_agreement":false,
				"age_range":"20~29",
				"has_birthday":true,
				"birthday_needs_agreement":false,
				"birthday":"1016",
				"has_gender":true,
				"gender_needs_agreement":false,
				"gender":"female"
				}}
			 *  
			 *  
			 *  */
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		} catch (ClientProtocolException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} finally {

			// clear resources
		}
		return returnNode;

	}
	
	/* 
	 * 헤더에 Authorization : "Bearer {access_Token}" 을 
	 * 포함하여 요청하면 로그아웃을 수행한 클라이언트의 아이디를 반환
	 * */
	public static void kakaoLogout(String access_Token) {
		System.out.println(access_Token);
		final String reqUrl = "https://kapi.kakao.com/v2/user/logout";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer"+access_Token);
			
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result = "";
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
}

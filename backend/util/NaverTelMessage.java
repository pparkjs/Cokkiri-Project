package util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


public class NaverTelMessage {

	public void sendMessage(String tel, String rand) {
		
		// HTTP
		String hostUrl = "https://sens.apigw.ntruss.com";
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		
		// 프로젝트에 할당된 SMS 서비스 ID  ncp:sms:kr:305933441253:cokkiri
		String serviceId = "ncp:sms:kr:305933441253:cokkiri";
		// 현재시간
		String timestamp = Long.toString(System.currentTimeMillis());
		// accessKey (설정된값)
		String accessKey = "Ho2a3Wp4oRuyD0BUeJnh";
		// secretKey
		String secretKey = "1eB2yd6DrmtG9Eb56ECxBKAoTBSoXv2dvxcAldpW";
		// 요청 URL
		requestUrl += serviceId + requestUrlType;
		
		System.out.println("requestUrl => " + requestUrl);
		// 요청메소드
		String method = "POST";
		String apiUrl = hostUrl + requestUrl;
		
		// JSON body값 생성
		Gson gson = new Gson();
		JsonObject messagesArrIner = new JsonObject();
		JsonObject jsonObj = new JsonObject();
		JsonArray jsonArray = new JsonArray();
		
		// 난수와 함께 전송
		messagesArrIner.addProperty("to", tel); // 전화번호 (붙임표 ( - )를 제외한 숫자만 입력 가능)
//		messagesArrIner.addProperty("content", "[Cokkiri] 인증번호 ["+rand+"]를 입력해주세요"); // 메시지 내용
		
		// messages
		// 메시지 type
		jsonObj.addProperty("type", "SMS"); // SMS타입
		jsonObj.addProperty("contentType", "COMM"); // 메시지Type
		jsonObj.addProperty("countryCode", "82"); // 국가코드
		// 발신번호
		jsonObj.addProperty("from", "01049047917");
		jsonObj.addProperty("content", "[Cokkiri] 인증번호 ["+rand+"]를 입력해주세요"); // 메시지 내용
		
		// body 합치기
		jsonArray.add(messagesArrIner);
		jsonObj.add("messages", jsonArray);
		
//		String jsonbody = jsonObj.toString();
		String jsonbody = gson.toJson(jsonObj);
		
		// 요청값 확인
		System.out.println("jsonbody" + jsonbody);
		
		// 헤더값 생성
		try {
			URL url = new URL(apiUrl);
			
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setUseCaches(false); // 캐시 사용 안함
			conn.setDoOutput(true); // 데이터 보냄
			conn.setDoInput(true); // 데이터 받아옴
		
			String scrStr =  makeSignature(requestUrl, timestamp, method, accessKey, secretKey);
			System.out.println("scrStr = " + scrStr);
			System.out.println("time = " + timestamp);
			System.out.println("access = " + accessKey);
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			conn.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			conn.setRequestProperty("x-ncp-iam-access-key", accessKey);
//			conn.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			conn.setRequestProperty("x-ncp-apigw-signature-v2", scrStr);
			conn.setRequestMethod(method);
			// 출력 스트림을 사용해 데이터 전송(요청 메소드가 GET이더라도 데이터 전송)
			conn.setDoInput(true);
			
			
			// 요청바디 전송
			DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
			System.out.println("dos : " + dos);
			dos.write(jsonbody.getBytes("utf-8"));
//			dos.writeUTF(jsonbody);
			dos.flush();
			dos.close();
			
			
			// 정상 호출될 경우 BufferedReader을 사용하여 응답 본문 읽기
			int responseCode = conn.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + responseCode);
			if(responseCode == 202) { // 정상호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			
			// 응답 본문을 StringBuffer에 추가
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	// x-ncp-apigw-signature-v2	에서 사용하는 암호화 알고리즘
	public String makeSignature(
			String url, 
	        String timestamp, 
	        String method, 
	        String accessKey, 
	        String secretKey	
		) throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException {
		String space = " ";					// one space
		String newLine = "\n";					// new line

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		
		Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.encodeBase64String(rawHmac);

        return encodeBase64String;
	}
}

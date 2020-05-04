package jsontest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MapConvertJson {
	public static void main(String [] args) throws JsonProcessingException {
		
		Map<String, Map<String, Object>> map = new HashMap<>();
		List<HashMap<String, Object>> list = new ArrayList<>();
		Map map2 = new HashMap<>();
		
		map2.put("이름", "차승연");
		map2.put("나이",  "23");
		map.put("사람1", (HashMap<String, Object>) map2);
		
		Map map3 = new HashMap<>();
		
		map3.put("이름", "정진영");
		map3.put("나이",  "30");
		map.put("사람2", (HashMap<String, Object>) map3);
	
		JSONObject object = getJsonStringFromMap(map);
		System.out.println("=======\n"+object);
		
		List<Map<String, Map<String, Object>>> list2 = new ArrayList<>();
		Map mapt = new HashMap<>();
		mapt.put("사람1", map2);
		mapt.put("사람2", map3);
		list2.add(mapt);
		
		
		
		JSONArray object2 = getJsonArrayFromList(list2);
		System.out.println("=======\n"+object2);
		String res =new ObjectMapper().writeValueAsString(map);
		System.out.println("=======\n"+res);
		Map<String, Map<String, Object>> mapc = getMapFromJsonObject(object);
		System.out.println("========\n"+mapc);
		List<Map<String, Map<String, Object>>> list4 = getListMapFromJsonArray(object2);
		System.out.println("========\n"+list4);
		
	}
	
	

	private static JSONArray getJsonArrayFromList(List<Map<String, Map<String, Object>>> list2) {
		JSONArray jsonArray = new JSONArray();
		for(Map<String, Map<String, Object>> map : list2) {
			jsonArray.add(getJsonStringFromMap(map));
		}
		return jsonArray;
	}

	private static JSONObject getJsonStringFromMap(Map<String, Map<String, Object>> map) {
		JSONObject jsonObject = new JSONObject();
		for(Entry<String, Map<String, Object>> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			jsonObject.put(key, value);
		}
		return jsonObject;
	}
	
	// jsonObject를 Map으로 변환
	private static Map<String, Map<String, Object>> getMapFromJsonObject(JSONObject object){
		Map<String, Map<String, Object>> map = new HashMap<>();
		try {
			map = new ObjectMapper().readValue(object.toJSONString(), Map.class);
		}catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
		return map;
		
	}
	// [{"사람1":{"이름":"차승연","나이":"23"},"사람2":{"이름":"정진영","나이":"30"}}]
	private static List<Map<String, Map<String, Object>>> getListMapFromJsonArray(JSONArray object2) {
		List<Map<String, Map<String, Object>>> list2 = new ArrayList<>();
		if(object2 != null) {
			int jsonSize = object2.size();
			for(int i = 0;i<jsonSize;i++) {
				Map<String, Map<String, Object>> map = getMapFromJsonObject((JSONObject) object2.get(i));
				list2.add(map);
			}
		}
		return list2;
	}
	
}

package spittr.web;
//import static org.mockito.Mockito.*;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
//import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.mockito.Mockito.*;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.test.web.servlet.setup.StandaloneMockMvcBuilder;
import org.springframework.web.servlet.view.InternalResourceView;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.hamcrest.Matchers.hasItems;

import spittr.Spitter;
import spittr.Spittle;
import spittr.data.SpitterRepository;
import spittr.data.SpittleRepository;

public class SpittleControllerTest {
	@Test
	public void shouldShowRecentSpittles() throws Exception {
		List<Spittle> expectedSpittles = createSpittleList(20);
		// 인터페이스의 구현클래스가 완성되지 않았으므로 mock로 모의 객체를 생성
		SpittleRepository mockRepository = mock(SpittleRepository.class);
		// 20개의 객체 리턴
		// SpittleRepository 인터페이스의 모의 구현 생성
		when(mockRepository.findSpittles(Long.MAX_VALUE, 20)).thenReturn(expectedSpittles);
		// when(mockRepository.findSpittles(Long.MAX_VALUE,
		// 20)).thenReturn(expectedSpittles);
		// 저장소를 SpittleController에 연결하고
		SpittleController controller = new SpittleController(mockRepository);
		// 이 컨트롤러를 사용하기 위해서 MockMvc를 설정한다
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller)
				.setSingleView(new InternalResourceView("/WEB-INF/viws/spittles.jsp")).build();

		// andExpect : 예상값 검증 assert* 메소드들과 유사
		mockMvc.perform(get("/spittles")).andExpect(view().name("spittles"))
				.andExpect(model().attributeExists("spittleList"))
				.andExpect(model().attribute("spittleList", hasItems(expectedSpittles.toArray())));

	}

	private List<Spittle> createSpittleList(int count) {
		List<Spittle> spittles = new ArrayList<Spittle>();
		for (int i = 0; i < count; i++) {
			spittles.add(new Spittle("spittle " + i, new Date(), 0d, 0d));
		}
		return spittles;
	}

	@Test
	public void testSpittle() throws Exception {
		Spittle expectedSpittle = new Spittle("Hello", new Date(), null, null);
		SpittleRepository mockRepository = mock(SpittleRepository.class);
		when(mockRepository.findOne(12345)).thenReturn(expectedSpittle);

		SpittleController controller = new SpittleController(mockRepository);
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();

		mockMvc.perform(get("/spittles/12345")).andExpect(view().name("spittle"))
				.andExpect(model().attributeExists("spittle")).andExpect(model().attribute("spittle", expectedSpittle));

	}

	@Test
	public void shouldShowPagedSpittles() throws Exception {
		List<Spittle> expectedSpittles = createSpittleList(50);
		SpittleRepository mockRepository = mock(SpittleRepository.class);
		when(mockRepository.findSpittles(238900, 50)).thenReturn(expectedSpittles);

		SpittleController controller = new SpittleController(mockRepository);
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller)
				.setSingleView(new InternalResourceView("/WEB-INF/views/spittles.jsp")).build();
		mockMvc.perform(get("/spittles?max=238900&count=50")).andExpect(view().name("spittles"))
				.andExpect(model().attributeExists("spittleList"))
				.andExpect(model().attribute("spittleList", hasItems(expectedSpittles.toArray())));

	}
	@Test
	public void shouldShowRegistration() throws Exception{
		SpitterRepository mockRepository = 
				mock(SpitterRepository.class);
		SpitterController controller = new SpitterController(mockRepository);
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
		
		mockMvc.perform(get("/spitter/register")).andExpect(view().name("registerForm"));
	}
	
	@Test
	public void shouldProcessRegisteration() throws Exception{
		// SpittleRepository 모의구현 설정, 컨트롤러 생성
		SpitterRepository mockRepository = 
				mock(SpitterRepository.class);
		Spitter unsaved = new Spitter("jbauer", "24hours", "Jack", "Bauer");
		Spitter saved = new Spitter(24L, "jbauer", "24hours", "Jack", "Bauer");
		when(mockRepository.save(unsaved)).thenReturn(saved);
		
		
		SpitterController controller = new SpitterController(mockRepository);
		//MockMvc설정
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
		
		mockMvc.perform(post("/spitter/register") // 요청 수행
				.param("firstName", "Jack")
				.param("lastName", "Bauer")
				.param("username", "jbauer")
				.param("password", "24hours")) 
				.andExpect(redirectedUrl("/spitter/jbauer")); // 파라미터 전송 후 다음 url로 
		// 리다이렉션 시킴 => 브라우저 리프레시에 의한 중복된 폼 제출 방지
		System.out.println(saved);
		System.out.println(unsaved);
		verify(mockRepository, atLeastOnce()).save(refEq(unsaved)); // 저장 검증

		
	}
	
	
	
	
	

}

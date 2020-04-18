package spittr.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.mockito.Mockito.*;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceView;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.hamcrest.Matchers.hasItems;

import spittr.Spittle;
import spittr.data.SpittleRepository;

public class SpittleControllerTest {
	@Test
	public void shouldShowRecentSpittles() throws Exception {
		List<Spittle> expectedSpittles = createSpittleList(20);
		// 인터페이스의 구현클래스가 완성되지 않았으므로 mock로 모의 객체를 생성
		SpittleRepository mockRepository = mock(SpittleRepository.class);
		// 								     20개의 객체 리턴
		// SpittleRepository 인터페이스의 모의 구현 생성
		when(mockRepository.findSpittles(Long.MAX_VALUE, 20)).thenReturn(expectedSpittles);
		// 저장소를 SpittleController에 연결하고
		SpittleController controller = new SpittleController(mockRepository);
		// 이 컨트롤러를 사용하기 위해서 MockMvc를 설정한다
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller)
				.setSingleView(new InternalResourceView("/WEB-INF/viws/spittles.jsp")).build();
		
		// andExpect : 예상값 검증 assert* 메소드들과 유사
		mockMvc.perform(get("/spittles"))
				.andExpect(view().name("spittles"))
				.andExpect(model().attributeExists("spittlesList"))
				.andExpect(model().attribute("spittleList", hasItems(expectedSpittles.toArray())));
		
	}

	private List<Spittle> createSpittleList(int count) {
		List<Spittle> spittles = new ArrayList<Spittle>();
		for(int i = 0;i<count;i++) {
			spittles.add(new Spittle("spittle " + i, new Date(), 0d,0d));
		}
		return spittles;
	}
}

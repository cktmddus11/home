package spittr.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spittr.data.SpittleRepository;

@Controller
@RequestMapping("/spittles")
public class SpittleController {
	
	private SpittleRepository spittleRepository;
	
	@Autowired
	public SpittleController(SpittleRepository spittleRepository) {
		this.spittleRepository = spittleRepository;		
	}
	@RequestMapping(method=RequestMethod.GET)
	public String spittles(Model model) {
		// model은 키와 값으로 구성되어있는게 보통인데 없으면
		// 자동으로 타입을 보고 spittleList라고 이름지음
		//model.addAttribute(spittleRepository.findSpittles(Long.MAX_VALUE, 20));
		// 명시적으로 쓸거면 아래처럼하고
		model.addAttribute("spittleList", spittleRepository.findSpittles(Long.MAX_VALUE, 20));
		return "spittles"; // 뷰 이름 리턴
	}
	/* non -spring 타입으로 작업할거면 Map써도됨
	 * public String spittles(Map model){
	 *  	model.put("spittleList", spittleRepository.findSpittles(Long.MAX_VALUE, 20));
	 *  	return "spittles";
	 * }
	 * */
}

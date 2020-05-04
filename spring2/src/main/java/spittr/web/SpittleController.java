package spittr.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spittr.Spittle;
import spittr.data.SpittleRepository;

@Controller
@RequestMapping("/spittles")
public class SpittleController {

	private SpittleRepository spittleRepository;
	
	@Autowired
	public SpittleController(SpittleRepository spittleRepository) {
		this.spittleRepository = spittleRepository;		
	}
//	@RequestMapping(method=RequestMethod.GET)
//	public String spittles(Model model) {
//		// model은 키와 값으로 구성되어있는게 보통인데 없으면
//		// 자동으로 타입을 보고 spittleList라고 이름지음
//		//model.addAttribute(spittleRepository.findSpittles(Long.MAX_VALUE, 20));
//		// 명시적으로 쓸거면 아래처럼하고
//		model.addAttribute("spittleList", spittleRepository.findSpittles(Long.MAX_VALUE, 20));
//		return "spittles"; // 뷰 이름 리턴
//	}
	/* non -spring 타입으로 작업할거면 Map써도됨
	 * public String spittles(Map model){
	 *  	model.put("spittleList", spittleRepository.findSpittles(Long.MAX_VALUE, 20));
	 *  	return "spittes";
	 * }
	 * */
	private static final String MAX_LONG_AS_STRING = ""+Long.MAX_VALUE;
	
	@RequestMapping(method=RequestMethod.GET)
	public List<Spittle> spittles(
			@RequestParam(value="max", defaultValue=MAX_LONG_AS_STRING) long max, 
			@RequestParam(value="count", defaultValue="20") int count, Model model){
		List<Spittle> list = spittleRepository.findSpittles(max,  count);
		model.addAttribute("spittleList", list);
		return list;
	}
	
//	@RequestMapping(value="/show", method=RequestMethod.GET)
//	public String showSpittle(@RequestParam("spittle_id") long spittleId, Model model) {
//		model.addAttribute(spittleRepository.findOne(spittleId));
//		return "spittle";
//	}
	// 위 방식보다 이게 더 좋은 방식
	@RequestMapping(value="/{spittleId}", method=RequestMethod.GET)
	//public String spittle(@PathVariable("spittleId") long spittleId, Model model) {
	public String spittle(@PathVariable long spittleId, Model model) {
		model.addAttribute(spittleRepository.findOne(spittleId));
		return "spittle";
	}
	
}

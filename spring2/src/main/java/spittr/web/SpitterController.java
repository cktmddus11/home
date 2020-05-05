package spittr.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spittr.Spitter;
import spittr.data.SpitterRepository;

@Controller
@RequestMapping("/spitter")
public class SpitterController {
	private SpitterRepository spitterRepository;
	@Autowired
	public SpitterController(SpitterRepository spitterRepository){
			this.spitterRepository = spitterRepository;
	}
	// 사용자에 폼을 나타내줌
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String showRegistrationForm(Model model) {
		model.addAttribute("spitter", new Spitter());
		return "registerForm";
	}
	// 사용자가 폼을 통해 제출한 데이터처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String processRegistration(@Valid Spitter spitter, Errors errors) {
		// @Valid : Spitter  입력 검증
		// 사용자가 제출한 데이터를 저장하기 전에 검증하여 잘못된값을 확인하고 
		// 사용자에게 다시 등록 폼을 보여주는 코드 추가
		if(errors.hasErrors()) { // 검증 오류 발생 시 폼으로 되돌아감
			return "registerForm";
		}
		spitterRepository.save(spitter);
		return "redirect:/spitter/"+spitter.getUsername();
	}
	@RequestMapping(value="/{username}", method=RequestMethod.GET)
	public String showSpitterProfile(@PathVariable String username, Model model) {
		Spitter spitter = spitterRepository.findByUsername(username);
		model.addAttribute(spitter);
		return "profile";
	}
	
}

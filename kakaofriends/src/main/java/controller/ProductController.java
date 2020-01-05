package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("product")
public class ProductController {

	@GetMapping("*") // get으로 들어온 요청중 정해진게 없으면 이걸로 실행?
	public String form(Model model) {
		return null; // null : url로  보고 이동?
	}
}

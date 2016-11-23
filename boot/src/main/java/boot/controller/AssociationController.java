package boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Association;
import boot.service.AssociationService;

@Controller
public class AssociationController {
	@Autowired
	private AssociationService associationService;

	@GetMapping("/all-associations")
	public String allAssociation(HttpServletRequest request) {
		request.setAttribute("associations", associationService.findAll());
		request.setAttribute("mode", "MODE_ASSOCIATIONS");
		return "association";
	}

	@GetMapping("/new-association")
	public String newAssociation(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_NEW");
		return "association";
	}

	@PostMapping("/save-association")
	public String newAssociation(@ModelAttribute Association association, BindingResult bindingResult,
			HttpServletRequest request) {
		associationService.save(association);
		request.setAttribute("associations", associationService.findAll());
		request.setAttribute("mode", "MODE_ASSOCIATIONS");
		return "association";
	}

	@GetMapping("/update-association")
	public String updateAssociation(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("association", associationService.findAssociation(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "association";
	}

	@GetMapping("/delete-association")
	public String deleteAssociation(@RequestParam int id, HttpServletRequest request) {
		associationService.delete(id);
		request.setAttribute("associations", associationService.findAll());
		request.setAttribute("mode", "MODE_ASSOCIATIONS");
		return "association";
	}
}

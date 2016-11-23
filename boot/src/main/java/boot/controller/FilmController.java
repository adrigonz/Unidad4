package boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Film;
import boot.service.FilmService;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService;
	
	@GetMapping("/all-films")
	public String allFilms(HttpServletRequest request){
		request.setAttribute("films", filmService.findAll());
		request.setAttribute("mode", "MODE_FILMS");
		return "film";
	}
	
	@GetMapping("/new-film")
	public String newFilm(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "film";
	}
	
	@PostMapping("/save-film")
	public String newFilm(@ModelAttribute Film film,BindingResult bindingResult,HttpServletRequest request){
		filmService.save(film);
		request.setAttribute("films", filmService.findAll());
		request.setAttribute("mode", "MODE_FILMS");
		return "film";
	}
	
	@GetMapping("/update-film")
	public String updateFilm(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("film", filmService.findFilm(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "film";
	}
	
	@GetMapping("/delete-film")
	public String deleteFilm(@RequestParam int id,HttpServletRequest request){
		filmService.delete(id);
		request.setAttribute("films", filmService.findAll());
		request.setAttribute("mode", "MODE_FILMS");
		return "film";
	}
}

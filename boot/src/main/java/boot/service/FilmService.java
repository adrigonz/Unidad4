package boot.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import boot.dao.FilmRepository;
import boot.model.Film;

@Service @Transactional
public class FilmService {
	private final FilmRepository filmRepository;

	public FilmService(FilmRepository filmRepository) {
		super();
		this.filmRepository = filmRepository;
	}
	
	public List<Film> findAll(){
		List<Film> films = new ArrayList<Film>();
		for (Film film : filmRepository.findAll()) {
			films.add(film);
		}
		return films;
	}
	
	public void save(Film film){
		filmRepository.save(film);
	}
	
	public void delete(int id){
		filmRepository.delete(id);
	}
	
	public Film findFilm(int id){
		return filmRepository.findOne(id);
	}
}

package boot.dao;

import org.springframework.data.repository.CrudRepository;

import boot.model.Film;

public interface FilmRepository extends CrudRepository<Film, Integer> {

}

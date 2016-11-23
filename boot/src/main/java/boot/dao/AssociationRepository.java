package boot.dao;

import org.springframework.data.repository.CrudRepository;

import boot.model.Association;

public interface AssociationRepository  extends CrudRepository<Association, Integer>{

}

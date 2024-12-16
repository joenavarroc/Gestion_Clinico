package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.User;
@Repository
public interface UserRepository  extends CrudRepository<User,Integer>{
    
}

package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.JornadaMedico;
@Repository
public interface JornadaMedicoRepository extends CrudRepository<JornadaMedico,Integer>{
    
}

package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.Turno;
@Repository
public interface TurnoRepository extends CrudRepository<Turno,Integer>{
    
}
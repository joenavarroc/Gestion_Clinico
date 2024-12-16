package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.Especialidad;
@Repository
public interface EspecialidadRepository extends CrudRepository<Especialidad,Integer>{
    
}

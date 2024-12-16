package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.RegistroSalida;
@Repository
public interface RegistroSalidaRepository extends CrudRepository<RegistroSalida,Integer>{
    
}

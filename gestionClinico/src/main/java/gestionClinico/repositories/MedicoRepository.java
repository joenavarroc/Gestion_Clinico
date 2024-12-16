package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.Medico;

@Repository
public interface MedicoRepository extends CrudRepository<Medico,Integer>{

} 
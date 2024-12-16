package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.MedicoEspecialidad;

@Repository
public interface MedicoEspecialidadRepository extends CrudRepository<MedicoEspecialidad,Integer>{

} 
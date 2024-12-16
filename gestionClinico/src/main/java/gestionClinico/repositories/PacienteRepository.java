package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.Paciente;

@Repository
public interface PacienteRepository extends CrudRepository<Paciente,Integer> {

    
} 

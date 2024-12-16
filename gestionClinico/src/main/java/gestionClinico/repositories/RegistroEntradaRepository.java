package gestionClinico.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gestionClinico.entities.RegistroEntrada;

@Repository
public interface RegistroEntradaRepository extends CrudRepository<RegistroEntrada,Integer> {
    
}

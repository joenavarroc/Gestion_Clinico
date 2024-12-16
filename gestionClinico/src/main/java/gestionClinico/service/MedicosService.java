package gestionClinico.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;

import gestionClinico.Interfaces.I_Medico;
import gestionClinico.entities.Medico;

@Service
@ConditionalOnProperty(name = "service.medicos", havingValue = "List")
public class MedicosService implements I_Medico {

    
    
    
}
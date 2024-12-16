package gestionClinico.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;

import gestionClinico.Interfaces.I_Paciente;
import gestionClinico.entities.Paciente;

@Service
@ConditionalOnProperty(name = "service.pacientes", havingValue = "List")
public class PacientesService implements I_Paciente {

    
    
}

package gestionClinico.service;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;

@Service
@ConditionalOnProperty(name = "service.medicos", havingValue = "List")
public class UserService {
    
}

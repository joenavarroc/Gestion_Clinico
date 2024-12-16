package gestionClinico.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import gestionClinico.enums.TipoDocumento;
import jakarta.persistence.*;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "pacientes")
public class Paciente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_paciente;
    @Column(nullable = false,length = 50)
    private String nombre;
    @Column(nullable = false,length = 50)
    private String apellido;
    @Column(nullable = false)
    private LocalDate fenaci;
    @Column(nullable = false,length = 100)
    private String direccion;
    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_doc", nullable = false)
    private TipoDocumento tipoDocumento;
    @Column( nullable = false,length = 10)
    private String documento; 
    @Column( nullable = false,length = 50)
    private String telefono;
    @Column( nullable = false,length = 50)
    private String whatsapp;
    @Column(nullable = false,length = 50)
    private String userName;
    @Column(nullable = false,length = 255)
    private String password;
     

   
}

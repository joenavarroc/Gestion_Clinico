package gestionClinico.entities;

import gestionClinico.enums.TipoDocumento;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "medicos")
public class Medico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idMedico;

    @Column(nullable = false, length = 50)
    private String nombre;

    @Column(nullable = false, length = 50)
    private String apellido;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_doc", nullable = false)
    private TipoDocumento tipoDoc;

    @Column(nullable = false, length = 10)
    private String documento;

    @Column(name = "num_Matricula", nullable = false, length = 50)
    private String numMatricula;

    @Column(nullable = false, length = 50)
    private String telefono;

    @Column(nullable = false, length = 50)
    private String whatsapp;

    @Column(nullable = false, length = 50)
    private String mail;

    @Column(nullable = false, length = 50)
    private String userName;

    @Column(nullable = false, length = 255)
    private String password;
}


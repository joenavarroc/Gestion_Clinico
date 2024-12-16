package gestionClinico.entities;

import gestionClinico.enums.Dia;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "jornada_medico")
public class JornadaMedico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idJornadaMedico;
    @Column(nullable = false, length = 20)
    private String sala;
    @Column(name = "id_medico_especialidad", nullable = false)
    private int idMedicoEspecialidad;
    @Enumerated(EnumType.STRING)
    @Column(name = "dia", nullable = false)
    private Dia Dia;
    @Column(name = "hora_inicio",nullable = false)
    private java.time.LocalDateTime horaInicio;
    @Column(name = "cantidad_turnos",nullable = false)
    private int cantidadTurnos;

}

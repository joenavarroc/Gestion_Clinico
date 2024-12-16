package gestionClinico.entities;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "registros_entrada")
public class RegistroEntrada {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRegistroEntrada;
    @Column(name = "id_paciente",nullable = false)
    private int idPaciente;
    @Column(name = "id_jornada_medico",nullable = false)
    private int idJornadaMedico;
    @Column(name = "fecha_actual", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime fechaActual;
}

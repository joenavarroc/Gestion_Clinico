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
@Table(name = "registros_salida")
public class RegistroSalida {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRegistroSalida;
    @Column(name = "id_registro_entrada",nullable = false)
    private int idRegistroEntrada;
    @Column(name = "fecha_actual", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime fechaActual;
    @Column(name = "historia_clinica",nullable = false)
    private int historiaClinica;
}
package gestionClinico.entities;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "medico_especialidad")
public class MedicoEspecialidad {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "id_medico", nullable = false)
    private int idMedico;
    @Column(name = "id_especialidad", nullable = false)
    private String idEspecialidad;
}

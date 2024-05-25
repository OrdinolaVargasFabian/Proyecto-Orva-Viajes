package Interfaces;

import Modelo.DTOBuses;
import java.util.LinkedList;

public interface CRUDBuses {
    public LinkedList<DTOBuses> ListarBuses();
    public LinkedList<DTOBuses> ListarBusesDisponibles();
    //Seguir con el CRUD
}

package Interfaces;

import Modelo.DTOChofer;
import java.util.LinkedList;

public interface CRUDChoferes {
    public LinkedList<DTOChofer> ListarChoferes();
    public LinkedList<DTOChofer> ListarChoferesDisponibles();
}

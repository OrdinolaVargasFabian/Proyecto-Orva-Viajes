package Interfaces;

import Modelo.DTOBuses;
import java.util.ArrayList;
import java.util.LinkedList;

public interface CRUDBuses {
    public ArrayList<DTOBuses> getBuses();
    public ArrayList<DTOBuses> getBusesDisponibles();
    public DTOBuses getBus(int id);
    public boolean addBus(DTOBuses bus);
    public boolean updateBus(DTOBuses bus);
    public boolean deleteBus(int id);
}

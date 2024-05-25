package DAO;

import Modelo.DTOBuses;
import Interfaces.CRUDBuses;
import Persistencia.*;
import java.util.LinkedList;

public class DAOBuses extends Conexion implements CRUDBuses{
    DTOBuses bus;

    public DAOBuses() {}
    
    @Override
    public LinkedList<DTOBuses> ListarBuses() {
        LinkedList Lista = new LinkedList();
        String consulta = "SELECT * FROM bus";
        try {
            rs = smt.executeQuery(consulta);
            while (rs.next()) {
                bus = new DTOBuses();
                bus.setId(rs.getInt(1));
                bus.setPlaca(rs.getString(2));
                bus.setCapacidadAsientos(rs.getInt(3));
                bus.setDescripcion(rs.getString(4));
                bus.setEstado(rs.getInt(5));
                Lista.add(bus);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Lista;
    }

    @Override
    public LinkedList<DTOBuses> ListarBusesDisponibles() {
        LinkedList Lista = new LinkedList();
        String consulta = "SELECT * FROM bus WHERE estado = 1";
        try {
            rs = smt.executeQuery(consulta);
            while (rs.next()) {
                bus = new DTOBuses();
                bus.setId(rs.getInt(1));
                bus.setPlaca(rs.getString(2));
                bus.setCapacidadAsientos(rs.getInt(3));
                bus.setDescripcion(rs.getString(4));
                bus.setEstado(rs.getInt(5));
                Lista.add(bus);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Lista;
    }
    
}

package DAO;

import Modelo.DTOBuses;
import Interfaces.CRUDBuses;
import Persistencia.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBuses extends Conexion implements CRUDBuses{
    DTOBuses bus;

    public DAOBuses() {}
    

    @Override
    public ArrayList<DTOBuses> getBuses() {
      ArrayList<DTOBuses> listaBuses = new ArrayList<DTOBuses>();
        String sql = "SELECT * FROM bus";
        try {
            rs = smt.executeQuery(sql);
            while (rs.next()) {
                bus = new DTOBuses();
                
                bus.setId(rs.getInt(1));
                bus.setPlaca(rs.getString(2));
                bus.setCapacidadAsientos(rs.getInt(3));
                bus.setDescripcion(rs.getString(4));
                bus.setEstado(rs.getInt(5));
                
                listaBuses.add(bus);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return listaBuses;
    }
    
    @Override
    public ArrayList<DTOBuses> getBusesDisponibles() {
        ArrayList<DTOBuses> listaBusesDisponibles = new ArrayList<>();
        String sql = "select idBus, placa, capacidadAsientos, descripcion, estado from bus where estado = 1";
        try {
            rs = smt.executeQuery(sql);
            while (rs.next()) {
                bus = new DTOBuses();
                
                bus.setId(rs.getInt(1));
                bus.setPlaca(rs.getString(2));
                bus.setCapacidadAsientos(rs.getInt(3));
                bus.setDescripcion(rs.getString(4));
                bus.setEstado(rs.getInt(5));
                
                listaBusesDisponibles.add(bus);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return listaBusesDisponibles;
    }

    @Override
    public DTOBuses getBus(int id) {
        String sql = "select idBus, placa, capacidadAsientos, descripcion, estado from bus where idBus = ?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                bus = new DTOBuses();
                
                bus.setId(rs.getInt(1));
                bus.setPlaca(rs.getString(2));
                bus.setCapacidadAsientos(rs.getInt(3));
                bus.setDescripcion(rs.getString(4));
                bus.setEstado(rs.getInt(5));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOBuses.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bus;
    }

    @Override
    public boolean addBus(DTOBuses bus) {
      String sql = "INSERT INTO bus (placa, capacidadAsientos, descripcion, creador, fechaCreacion, estado) VALUES (?,?,?,?,now(),1);";
        
        try {
            ps = con.prepareStatement(sql);
            
            ps.setString(1, bus.getPlaca());
            ps.setInt(2, bus.getCapacidadAsientos());
            ps.setString(3, bus.getDescripcion());
            ps.setInt(4, bus.getCreador());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }  
      return false;
    }

    @Override
    public boolean updateBus(DTOBuses bus) {
        String sql = "UPDATE bus SET placa = ?, capacidadAsientos = ?, "
                + "descripcion = ? WHERE idBus = ?";
        try {
            ps = con.prepareStatement(sql);
            
            ps.setString(1, bus.getPlaca());
            ps.setInt(2, bus.getCapacidadAsientos());
            ps.setString(3, bus.getDescripcion());
            
            ps.setInt(4, bus.getId());
            
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteBus(int id) {
        String sql = "update bus set estado = 2 where idBus = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       return false;
    }
    
}

package DAO;

import Modelo.DTOChofer;
import Interfaces.CRUDChoferes;
import Persistencia.*;
import java.util.LinkedList;
//import java.util.ArrayList;
//import javax.swing.JOptionPane;

public class DAOChoferes extends Conexion implements CRUDChoferes {

    DTOChofer chofer;
    

    public DAOChoferes() {
 //       super();
    }

    @Override
    public LinkedList<DTOChofer> ListarChoferes() {
        LinkedList <DTOChofer> Lista = new LinkedList();
        String consulta = "select * from chofer WHERE estado = 1";
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) { 
        //        DTOChofer chofer = new DTOChofer();
                chofer = new DTOChofer();
                chofer.setId(rs.getInt(1));
                chofer.setAppat(rs.getString(2));
                chofer.setApmat(rs.getString(3));
                chofer.setNombre(rs.getString(4));
                chofer.setDni(rs.getInt(5));
                chofer.setLicenciaConducir(rs.getString(6));
                chofer.setFechaContratacion(rs.getDate(7));
                chofer.setFechaVencimientoLicencia(rs.getDate(8));
                chofer.setTelefono(rs.getInt(9));
                chofer.setDisponibilidad(rs.getInt(10));
                chofer.setEstado(rs.getInt(11));
                Lista.add(chofer);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Lista;
    }

    @Override
    public LinkedList<DTOChofer> ListarChoferesDisponibles() {
        LinkedList Lista = new LinkedList();
        String consulta = "SELECT * FROM chofer WHERE disponibilidad = 1 AND estado = 1";
        try {
            rs = smt.executeQuery(consulta);
            while (rs.next()) {
                rs = smt.executeQuery(consulta);
                while (rs.next()) {
                    DTOChofer chofer = new DTOChofer();
                    chofer = new DTOChofer();
                    chofer.setId(rs.getInt(1));
                    chofer.setAppat(rs.getString(2));
                    chofer.setApmat(rs.getString(3));
                    chofer.setNombre(rs.getString(4));
                    chofer.setDni(rs.getInt(5));
                    chofer.setLicenciaConducir(rs.getString(6));
                    chofer.setFechaContratacion(rs.getDate(7));
                    chofer.setFechaVencimientoLicencia(rs.getDate(8));
                    chofer.setTelefono(rs.getInt(9));
                    chofer.setDisponibilidad(rs.getInt(10));
                    chofer.setEstado(rs.getInt(11));
                    Lista.add(chofer);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Lista;
    }
    @Override
    public DTOChofer ObtenerChofer(int id) {
        DTOChofer chofer = null;
        String consulta = "SELECT * FROM chofer WHERE idChofer = ?";
        try {            
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                chofer = new DTOChofer();
                chofer.setId(rs.getInt(1));
                chofer.setAppat(rs.getString(2));
                chofer.setApmat(rs.getString(3));
                chofer.setNombre(rs.getString(4));
                chofer.setDni(rs.getInt(5));
                chofer.setLicenciaConducir(rs.getString(6));
                chofer.setFechaContratacion(rs.getDate(7));
                chofer.setFechaVencimientoLicencia(rs.getDate(8));
                chofer.setTelefono(rs.getInt(9));
                chofer.setDisponibilidad(rs.getInt(10));
                chofer.setEstado(rs.getInt(11));
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return chofer;
    }
    @Override
    public boolean AgregarChofer(DTOChofer chofer) {
        String consulta = "INSERT INTO chofer (`appat`,`apmat`, `nombre`, `dni`, `licenciaConducir`, `fechaContratacion`, `fechaVencimientoLicencia`, `telefono`, `disponibilidad`,`creador`,`fechaCreacion`, `estado`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,now(), ?)";
        try {
            ps = con.prepareStatement(consulta);
            ps.setString(1, chofer.getAppat());
            ps.setString(2, chofer.getApmat());
            ps.setString(3, chofer.getNombre());
            ps.setInt(4, chofer.getDni());
            ps.setString(5, chofer.getLicenciaConducir());
//            ps.setDate(6, new java.sql.Date(chofer.getFechaContratacion().getTime()));
//            ps.setDate(7, new java.sql.Date(chofer.getFechaVencimientoLicencia().getTime()));
            ps.setDate(6, chofer.getFechaContratacion());
            ps.setDate(7, chofer.getFechaVencimientoLicencia());
            ps.setInt(8, chofer.getTelefono());
            ps.setInt(9, chofer.getDisponibilidad());
            ps.setInt(10, chofer.getEstado());
            ps.setInt(11, chofer.getCreador());
            ps.executeUpdate();
            int rowsInserted = ps.executeUpdate();           
            return rowsInserted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean ActualizarChofer(DTOChofer chofer) {
        String consulta = "UPDATE chofer SET appat = ?, apmat = ?, nombre = ?, dni = ?, licenciaConducir = ?, fechaVencimientoLicencia = ?, telefono = ?, WHERE idChofer = ?";
        try {         
            ps = con.prepareStatement(consulta);
            ps.setString(1, chofer.getAppat());
            ps.setString(2, chofer.getApmat());
            ps.setString(3, chofer.getNombre());
            ps.setInt(4, chofer.getDni());
            ps.setString(5, chofer.getLicenciaConducir());
//            ps.setDate(6, new java.sql.Date(chofer.getFechaContratacion().getTime()));
//            ps.setDate(7, new java.sql.Date(chofer.getFechaVencimientoLicencia().getTime()));
 //           ps.setDate(6, chofer.getFechaContratacion());
            ps.setDate(6, chofer.getFechaVencimientoLicencia());
            ps.setInt(7, chofer.getTelefono());
//            ps.setInt(9, chofer.getDisponibilidad());
//            ps.setInt(10, chofer.getEstado());
            ps.setInt(8, chofer.getId());
            int rowsUpdated = ps.executeUpdate();
            
            return rowsUpdated > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    
    }
     @Override
    public boolean EliminarChofer(int id) {
    //    String consulta = "UPDATE chofer SET estado = 2 WHERE idChofer = ?";
        String consulta = "DELETE FROM chofer WHERE idChofer = ?";
        try {
            
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            ps.executeUpdate();
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}

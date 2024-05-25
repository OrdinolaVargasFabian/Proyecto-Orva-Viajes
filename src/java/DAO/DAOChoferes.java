package DAO;

import Modelo.DTOChofer;
import Interfaces.CRUDChoferes;
import Persistencia.*;
import java.util.LinkedList;

public class DAOChoferes extends Conexion implements CRUDChoferes {

    DTOChofer chofer;

    public DAOChoferes() {}

    @Override
    public LinkedList<DTOChofer> ListarChoferes() {
        LinkedList Lista = new LinkedList();
        String consulta = "SELECT * FROM chofer";
        try {
            rs = smt.executeQuery(consulta);
            while (rs.next()) {
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

}

package DAO;

import Modelo.DTORuta;
import Interfaces.CRUDRutas;
import Persistencia.*;
import java.util.LinkedList;

public class DAORutas extends Conexion implements CRUDRutas{
    DTORuta ruta;

    public DAORutas() {}
    
    @Override
    public LinkedList<DTORuta> ListarRutas() {
        LinkedList Lista = new LinkedList();
        String consulta = "SELECT * FROM ruta_viaje WHERE estado = 1";
        try {
            rs = smt.executeQuery(consulta);
            while (rs.next()) {
                ruta = new DTORuta();
                ruta.setId(rs.getInt(1));
                ruta.setIdBus(rs.getInt(2));
                ruta.setIdChofer(rs.getInt(3));
                ruta.setFechaSalida(rs.getDate(4));
                ruta.setHoraSalida(rs.getTime(5));
                ruta.setOrigen(rs.getInt(6));
                ruta.setFechaLlegada(rs.getDate(7));
                ruta.setHoraLlegada(rs.getTime(8));
                ruta.setDestino(rs.getInt(9));
                ruta.setPrecio(rs.getDouble(10));
                ruta.setBoletosRestantes(rs.getInt(11));
                ruta.setEstado(rs.getInt(12));
                Lista.add(ruta);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Lista;
    }

    @Override
    public DTORuta ObtenerRuta(int id) {
        String consulta = "SELECT * FROM ruta_viaje WHERE idViaje = ?";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ruta = new DTORuta();
                ruta.setId(rs.getInt(1));
                ruta.setIdBus(rs.getInt(2));
                ruta.setIdChofer(rs.getInt(3));
                ruta.setFechaSalida(rs.getDate(4));
                ruta.setHoraSalida(rs.getTime(5));
                ruta.setOrigen(rs.getInt(6));
                ruta.setFechaLlegada(rs.getDate(7));
                ruta.setHoraLlegada(rs.getTime(8));
                ruta.setDestino(rs.getInt(9));
                ruta.setPrecio(rs.getDouble(10));
                ruta.setBoletosRestantes(rs.getInt(11));
                ruta.setEstado(rs.getInt(12));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ruta;
    }

    @Override
    public boolean AgregarRuta(DTORuta ruta) {
        String consulta = "INSERT INTO ruta_viaje VALUES (?,?,?,?,?,?,?,?,?,?,?,1)";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, ruta.getId());
            ps.setInt(2, ruta.getIdBus());
            ps.setInt(3, ruta.getIdChofer());
            ps.setDate(4, ruta.getFechaSalida());
            ps.setTime(5, ruta.getHoraSalida());
            ps.setInt(6, ruta.getOrigen());
            ps.setDate(7, ruta.getFechaLlegada());
            ps.setTime(8, ruta.getHoraLlegada());
            ps.setInt(9, ruta.getDestino());
            ps.setDouble(10, ruta.getPrecio());
            ps.setInt(11, ruta.getBoletosRestantes());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean EditarRuta(DTORuta ruta) {
        String consulta = "UPDATE ruta_viaje SET idBus = ?, idChofer = ?, "
                + "fechaSalida = ?, horaSalida = ?,origen = ?, fechaLlegada = ?, "
                + "horaLlegada = ?, destino = ?, precio = ?, boletosRestantes = ?, "
                + "estado = ? WHERE idViaje = ?";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, ruta.getId());
            ps.setInt(2, ruta.getIdBus());
            ps.setInt(3, ruta.getIdChofer());
            ps.setDate(4, ruta.getFechaSalida());
            ps.setTime(5, ruta.getHoraSalida());
            ps.setInt(6, ruta.getOrigen());
            ps.setDate(7, ruta.getFechaLlegada());
            ps.setTime(8, ruta.getHoraLlegada());
            ps.setInt(9, ruta.getDestino());
            ps.setDouble(10, ruta.getPrecio());
            ps.setInt(11, ruta.getBoletosRestantes());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean EliminarRuta(int id) {
        String consulta = "UPDATE ruta_viaje SET estado = 2 WHERE idViaje = ?";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;    }
    
}

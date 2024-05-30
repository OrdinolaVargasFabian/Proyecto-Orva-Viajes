package DAO;

import Interfaces.CRUDClientes;
import Modelo.DTOCliente;
import Persistencia.Conexion;
import java.sql.*;
import java.util.LinkedList;

public class DAOClientes extends Conexion implements CRUDClientes {

    @Override
    public LinkedList<DTOCliente> ListarClientes() {
        LinkedList<DTOCliente> Lista = new LinkedList<>();
        String consulta = "SELECT * FROM cliente";
        
        try (PreparedStatement ps = con.prepareStatement(consulta);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DTOCliente cliente = new DTOCliente();
                cliente.setId(rs.getInt("idCliente"));
                cliente.setAppat(rs.getString("appat"));
                cliente.setApmat(rs.getString("apmat"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getInt("dni"));
                cliente.setFechaNacimiento(rs.getDate("fechaNacimiento").toString());
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setGenero(rs.getString("genero"));
                Lista.add(cliente);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return Lista;
    }

    @Override
    public DTOCliente ObtenerCliente(int id) {
        DTOCliente cliente = null;
        String consulta = "SELECT * FROM cliente WHERE idCliente = ?";
        
        try (PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cliente = new DTOCliente();
                    cliente.setId(rs.getInt("idCliente"));
                    cliente.setAppat(rs.getString("appat"));
                    cliente.setApmat(rs.getString("apmat"));
                    cliente.setNombre(rs.getString("nombre"));
                    cliente.setDni(rs.getInt("dni"));
                    cliente.setFechaNacimiento(rs.getDate("fechaNacimiento").toString());
                    cliente.setTelefono(rs.getInt("telefono"));
                    cliente.setGenero(rs.getString("genero"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return cliente;
    }

    @Override
    public boolean AgregarCliente(DTOCliente cliente) {
        String consulta = "INSERT INTO cliente (appat, apmat, nombre, dni, fechaNacimiento, telefono, genero, creador, fechaCreacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())";
        try (PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, cliente.getAppat());
            ps.setString(2, cliente.getApmat());
            ps.setString(3, cliente.getNombre());
            ps.setInt(4, cliente.getDni());
            ps.setDate(5, Date.valueOf(cliente.getFechaNacimiento()));
            ps.setInt(6, cliente.getTelefono());
            ps.setString(7, cliente.getGenero());
            ps.setInt(8, cliente.getCreador());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean ActualizarCliente(DTOCliente cliente) {
        String consulta = "UPDATE cliente SET appat = ?, apmat = ?, nombre = ?, dni = ?, fechaNacimiento = ?, telefono = ?, genero = ? WHERE idCliente = ?";
        try (PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, cliente.getAppat());
            ps.setString(2, cliente.getApmat());
            ps.setString(3, cliente.getNombre());
            ps.setInt(4, cliente.getDni());
            ps.setDate(5, Date.valueOf(cliente.getFechaNacimiento()));
            ps.setInt(6, cliente.getTelefono());
            ps.setString(7, cliente.getGenero());
            ps.setInt(8, cliente.getId());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean EliminarCliente(int id) {
        String consulta = "DELETE FROM cliente WHERE idCliente = ?";
        try (PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}


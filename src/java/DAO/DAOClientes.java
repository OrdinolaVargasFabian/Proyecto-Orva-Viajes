package DAO;

import Interfaces.CRUDClientes;
import Modelo.DTOCliente;
import Persistencia.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class DAOClientes extends Conexion implements CRUDClientes {

    @Override
    public LinkedList<DTOCliente> ListarClientes() {
        LinkedList<DTOCliente> Lista = new LinkedList();
        String consulta = "SELECT * FROM cliente";
        //capturar error
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();

            while (rs.next()) {
                DTOCliente cliente = new DTOCliente();
                cliente = new DTOCliente();
                cliente.setId(rs.getInt("idCliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getInt("dni"));
                cliente.setFechaNacimiento(rs.getString("fechaNacimiento"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setGenero(rs.getString("genero"));
                cliente.setEstado(rs.getInt("estado"));
                Lista.add(cliente); //agrega un clinete a la lista
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Muestra la Excepcion
        }

        return Lista;
    }

    @Override
    public DTOCliente ObtenerCliente(int id) {
        DTOCliente cliente = null;  // Declaracion de variable
        String consulta = "SELECT * FROM clientes WHERE id = ?;";
        //capturar error
        try {
            ps = super.con.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new DTOCliente();
                cliente.setId(rs.getInt("idCliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getInt("dni"));
                cliente.setFechaNacimiento(rs.getString("fechaNacimiento"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setGenero(rs.getString("genero"));
                cliente.setEstado(rs.getInt("estado"));

            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Muestra la Excepcion
        }

        return cliente;
    }

    @Override
    public boolean AgregarCliente(DTOCliente cliente) {
        String consulta = "INSERT INTO clientes (nombre, dni, fecha_nacimiento, telefono, genero, estado) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(consulta);
            ps.setString(1, cliente.getNombre());
            ps.setInt(2, cliente.getDni());
            ps.setString(3, cliente.getFechaNacimiento());
            ps.setInt(4, cliente.getTelefono());
            ps.setString(5, cliente.getGenero());
            ps.setInt(6, cliente.getEstado());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean ActualizarCliente(DTOCliente cliente) {
        String consulta = "UPDATE clientes SET nombre = ?, dni = ?, fecha_nacimiento = ?, telefono = ?, genero = ?, estado = ? WHERE id = ?";
    
        try {
            ps = con.prepareStatement(consulta);
            ps.setString(1, cliente.getNombre());
            ps.setInt(2, cliente.getDni());
            ps.setString(3, cliente.getFechaNacimiento());
            ps.setInt(4, cliente.getTelefono());
            ps.setString(5, cliente.getGenero());
            ps.setInt(6, cliente.getEstado());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean EliminarCliente(int id) {
        String consulta = "DELETE FROM clientes WHERE id = ?";

        try {
            
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public DTOCliente ValidarSesion(String correo, String contra) {
        DTOCliente cliente = null;  // Declaracion de variable
        String consulta = "SELECT * FROM cliente WHERE correo = ? AND contraseña = ?";
        try {
            ps = super.con.prepareStatement(consulta);
            ps.setString(1, correo);
            ps.setString(2, contra);
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new DTOCliente();
                cliente.setId(rs.getInt("idCliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setAppat(rs.getString("appat"));
                cliente.setApmat(rs.getString("apmat"));
                cliente.setDni(rs.getInt("dni"));
                cliente.setFechaNacimiento(rs.getString("fechaNacimiento"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setGenero(rs.getString("genero"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setContra(rs.getString("contraseña"));
                cliente.setEstado(rs.getInt("estado"));
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Muestra la Excepcion
        }
        return cliente;
    }

}

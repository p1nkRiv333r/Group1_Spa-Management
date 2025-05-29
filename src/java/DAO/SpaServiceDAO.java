/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.SpaService;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class SpaServiceDAO extends DBContext {

    private Connection connection;

    public SpaServiceDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public List<SpaService> getTopSpaServices(int i) {
        List<SpaService> list = new ArrayList<>();
        String sql = "SELECT TOP " + i + " * FROM SpaService WHERE IsActive = 1";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                SpaService spaService = new SpaService(
                        rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getInt("DurationMinutes"),
                        rs.getBigDecimal("Price"),
                        rs.getString("Image")
                );
                list.add(spaService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SpaService> getActiveSpaServices(int page) {
        List<SpaService> services = new ArrayList<>();
        String sql = "SELECT * FROM spaservice WHERE isactive = 1 ORDER BY id OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            int offset = (page - 1) * 6;
            stmt.setInt(1, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SpaService service = new SpaService();
                    service.setId(rs.getInt("id"));
                    service.setName(rs.getString("name"));
                    service.setDescription(rs.getString("description"));
                    service.setDurationMinutes(rs.getInt("durationminutes"));
                    service.setPrice(rs.getBigDecimal("price"));
                    service.setActive(rs.getBoolean("isactive"));
                    service.setCategoryId(rs.getInt("categoryid"));
                    service.setImage(rs.getString("image"));

                    services.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // hoặc xử lý logging
        }

        return services;
    }

    public SpaService getSpaServiceById(int id) {
        SpaService service = null;
        String sql = "SELECT * FROM spaservice WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    service = new SpaService();
                    service.setId(rs.getInt("id"));
                    service.setName(rs.getString("name"));
                    service.setDescription(rs.getString("description"));
                    service.setDurationMinutes(rs.getInt("durationminutes"));
                    service.setPrice(rs.getBigDecimal("price"));
                    service.setActive(rs.getBoolean("isactive"));
                    service.setCategoryId(rs.getInt("categoryid"));
                    service.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // hoặc ghi log
        }

        return service;
    }

    public int getTotalActiveSpaServicePages() {
        String sql = "SELECT COUNT(*) FROM spaservice WHERE isactive = 1";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                int count = rs.getInt(1);
                return (int) Math.ceil(count / 6.0);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}

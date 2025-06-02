package DAO;

import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Read (Get User by Id)
    public User getUserById(int id) {
        String query = "SELECT * FROM [User] WHERE ID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("ID"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setIsDeleted(rs.getBoolean("IsDeleted"));
                user.setCreatedAt(rs.getDate("CreatedAt"));
                user.setCreatedBy(rs.getInt("CreatedBy"));
                user.setAvatar(rs.getString("Avatar"));
                user.setChangeHistory(rs.getString("ChangeHistory"));
                return user;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return null;
    }

    // Update (Update User)
    public boolean updateUser(User user) {
        String query = "UPDATE [User] SET Email=?, Password=?, Fullname=?, Gender=?, Address=?, Phone=?, IsDeleted=?, CreatedBy=?, Avatar=?, ChangeHistory=? WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhone());
            ps.setBoolean(7, user.isIsDeleted());
            ps.setInt(8, user.getCreatedBy());
            ps.setString(9, user.getAvatar());
            ps.setString(10, user.getChangeHistory());
            ps.setInt(11, user.getId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return false;
    }

    public List<User> getUsersBySpaServiceId(int spaServiceId) {
        List<User> users = new ArrayList<>();
        String query = "SELECT u.Id, u.Email, u.Password, u.Fullname, u.Gender, u.Address, u.Phone, "
                + "u.IsDeleted, u.CreatedAt, u.CreatedBy, u.Avatar, u.ChangeHistory, u.RoleId "
                + "FROM [dbo].[User] u "
                + "JOIN [Spa].[dbo].[SpaServiceStaff] sss ON u.Id = sss.UserId "
                + "WHERE sss.SpaServiceId = ? AND u.IsDeleted = 0";

        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, spaServiceId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("Id"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setIsDeleted(rs.getBoolean("IsDeleted"));
                user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                user.setCreatedBy(rs.getInt("CreatedBy"));
                user.setAvatar(rs.getString("Avatar"));
                user.setChangeHistory(rs.getString("ChangeHistory"));
                user.setRoleId(rs.getInt("RoleId"));

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception properly
        }

        return users;
    }

    private void closeResources() {

    }
}

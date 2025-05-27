/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Feedback;
import Model.SpaService;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class FeedbackDAO extends DBContext{
     private Connection connection;

    public FeedbackDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public List<Feedback> getRecentFeedbacks(int limit) {
    List<Feedback> list = new ArrayList<>();
    String sql = "SELECT TOP " + limit + " * FROM Feedback ORDER BY CreatedAt DESC";
    
    try (PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet rs = statement.executeQuery()) {

        while (rs.next()) {
            int userId = rs.getInt("UserId");
            User user = new UserDAO().getUserById(userId); // Fetch user details

            Feedback feedback = new Feedback();
            feedback.setId(rs.getInt("Id"));
            feedback.setContent(rs.getString("Content"));
            feedback.setRating(rs.getInt("Rating"));
            feedback.setUser(user);

            list.add(feedback);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}

}

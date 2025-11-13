package packagep1;

import java.sql.Timestamp;

public class Feedback {

    private int id;
    private String name;
    private String email;
    private String foodItem;
    private int foodQuality;
    private int serviceRating;
    private int overallExperience;
    private String comments;
    private Timestamp submittedAt;

  
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getFoodItem() {
        return foodItem;
    }
    public void setFoodItem(String foodItem) {
        this.foodItem = foodItem;
    }

    public int getFoodQuality() {
        return foodQuality;
    }
    public void setFoodQuality(int foodQuality) {
        this.foodQuality = foodQuality;
    }

    public int getServiceRating() {
        return serviceRating;
    }
    public void setServiceRating(int serviceRating) {
        this.serviceRating = serviceRating;
    }

    public int getOverallExperience() {
        return overallExperience;
    }
    public void setOverallExperience(int overallExperience) {
        this.overallExperience = overallExperience;
    }

    public String getComments() {
        return comments;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }

    public Timestamp getSubmittedAt() {
        return submittedAt;
    }
    public void setSubmittedAt(Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }
}

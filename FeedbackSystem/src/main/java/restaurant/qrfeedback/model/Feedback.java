package restaurant.qrfeedback.model;



import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Feedback {

    private int id;
    private String name;
    private String email;
    private String foodItem;
    private String foodquality;
    private int servicerating;
    private int overallexperience;
    private String comments;
    private Timestamp submittedAt;  

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFoodItem() { return foodItem; }
    public void setFoodItem(String foodItem) { this.foodItem = foodItem; }

    public String getFoodquality() { return foodquality; }
    public void setFoodQuality(int foodQuality) { this.foodquality = foodquality;  }

    public int getServicerating() { return servicerating; }
    public void setServicerating(int servicerating) { this.servicerating = servicerating; }

    public int getOverallexperience() { return overallexperience; }
    public void setOverallexperience(int overallexperience) { this.overallexperience = overallexperience; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }

    public Timestamp getSubmittedAt() { return submittedAt; }        
    public void setSubmittedAt(Timestamp localDateTime) {              
        this.submittedAt = localDateTime;
    }
}

package src.model;

public class ModuleFeedback {

    private String mod;
    private double attr1;
    private double attr2;
    private double attr3;
    private double attr4;
    private String comment;
    private String user;
    private int likes;
    private String year;
    private String semester;
    private String date;

    public ModuleFeedback(String mod, double attr1, double attr2, double attr3, double attr4, String comment, String user, int likes, String year, String semester, String date) {
        this.mod = mod;
        this.attr1 = attr1;
        this.attr2 = attr2;
        this.attr3 = attr3;
        this.attr4 = attr4;
        this.comment = comment;
        this.user = user;
        this.likes = likes;
        this.year = year;
        this.semester = semester;
        this.date = date;
    }

    /**
     * @return the mod
     */
    public String getMod() {
        return mod;
    }

    /**
     * @param mod the mod to set
     */
    public void setMod(String mod) {
        this.mod = mod;
    }

    /**
     * @return the attr1
     */
    public double getAttr1() {
        return attr1;
    }

    /**
     * @param attr1 the attr1 to set
     */
    public void setAttr1(double attr1) {
        this.attr1 = attr1;
    }

    /**
     * @return the attr2
     */
    public double getAttr2() {
        return attr2;
    }

    /**
     * @param attr2 the attr2 to set
     */
    public void setAttr2(double attr2) {
        this.attr2 = attr2;
    }

    /**
     * @return the attr3
     */
    public double getAttr3() {
        return attr3;
    }

    /**
     * @param attr3 the attr3 to set
     */
    public void setAttr3(double attr3) {
        this.attr3 = attr3;
    }

    /**
     * @return the attr4
     */
    public double getAttr4() {
        return attr4;
    }

    /**
     * @param attr4 the attr4 to set
     */
    public void setAttr4(double attr4) {
        this.attr4 = attr4;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return the likes
     */
    public int getLikes() {
        return likes;
    }

    /**
     * @param likes the likes to set
     */
    public void setLikes(int likes) {
        this.likes = likes;
    }

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the semester
     */
    public String getSemester() {
        return semester;
    }

    /**
     * @param semester the semester to set
     */
    public void setSemester(String semester) {
        this.semester = semester;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }
}

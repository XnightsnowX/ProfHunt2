package src.model;

import java.util.ArrayList;

public class AveProfRating {
    
    String courseID;
    String profName;
    double profRating1;
    double profRating2;
    double profRating3;
    double profRating4;
    int aPlusRating;
    int aRating;
    int aMinusRating;
    int bPlusRating;
    int bRating;
    int bMinusRating;
    int cPlusRating;
    int cRating;
    int cMinusRating;
    int dPlusRating;
    int dRating;
    int fRating;

    public AveProfRating(String courseID, String profName, double profRating1, double profRating2, double profRating3, double profRating4, int aPlusRating, int aRating, int aMinusRating, int bPlusRating, int bRating, int bMinusRating, int cPlusRating, int cRating, int cMinusRating, int dPlusRating, int dRating, int fRating) {
        this.courseID = courseID;
        this.profName = profName;
        this.profRating1 = profRating1;
        this.profRating2 = profRating2;
        this.profRating3 = profRating3;
        this.profRating4 = profRating4;
        this.aPlusRating = aPlusRating;
        this.aRating = aRating;
        this.aMinusRating = aMinusRating;
        this.bPlusRating = bPlusRating;
        this.bRating = bRating;
        this.bMinusRating = bMinusRating;
        this.cPlusRating = cPlusRating;
        this.cRating = cRating;
        this.cMinusRating = cMinusRating;
        this.dPlusRating = dPlusRating;
        this.dRating = dRating;
        this.fRating = fRating;
    }

    public String getCourseID() {
        return courseID;
    }

    public String getProfName() {
        return profName;
    }

    public double getProfRating1() {
        return profRating1;
    }

    public double getProfRating2() {
        return profRating2;
    }

    public double getProfRating3() {
        return profRating3;
    }

    public double getProfRating4() {
        return profRating4;
    }

    public int getaPlusRating() {
        return aPlusRating;
    }

    public int getaRating() {
        return aRating;
    }

    public int getaMinusRating() {
        return aMinusRating;
    }

    public int getbPlusRating() {
        return bPlusRating;
    }

    public int getbRating() {
        return bRating;
    }

    public int getbMinusRating() {
        return bMinusRating;
    }

    public int getcPlusRating() {
        return cPlusRating;
    }

    public int getcRating() {
        return cRating;
    }

    public int getcMinusRating() {
        return cMinusRating;
    }

    public int getdPlusRating() {
        return dPlusRating;
    }

    public int getdRating() {
        return dRating;
    }

    public int getfRating() {
        return fRating;
    }

	
	
}

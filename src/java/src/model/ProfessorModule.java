package src.model;

import java.util.ArrayList;

public class ProfessorModule {
	
    String professorName;
    String moduleID;
    String courseName;
    int yearTaught1;
    int yearTaught2;
    int sem;

    public ProfessorModule(String professorName, String moduleID, String courseName, int yearTaught1, int yearTaught2, int sem) {
        this.professorName = professorName;
        this.moduleID = moduleID;
        this.courseName = courseName;
        this.yearTaught1 = yearTaught1;
        this.yearTaught2 = yearTaught2;
        this.sem = sem;
    }

    public String getProfessorName() {
        return professorName;
    }

    public String getModuleID() {
        return moduleID;
    }

    public String getCourseName() {
        return courseName;
    }

    public int getYearTaught1() {
        return yearTaught1;
    }

    public int getYearTaught2() {
        return yearTaught2;
    }

    public int getSem() {
        return sem;
    }

    public void setProfessorName(String professorName) {
        this.professorName = professorName;
    }

    public void setModuleID(String moduleID) {
        this.moduleID = moduleID;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setYearTaught1(int yearTaught1) {
        this.yearTaught1 = yearTaught1;
    }

    public void setYearTaught2(int yearTaught2) {
        this.yearTaught2 = yearTaught2;
    }

    public void setSem(int sem) {
        this.sem = sem;
    }

 
    
	
}

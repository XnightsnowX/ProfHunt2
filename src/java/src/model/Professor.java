package src.model;

import java.util.ArrayList;

public class Professor {

    String name;
    String faculty;
    ArrayList<String> currMod;
    ArrayList<String> prevMod;

    public Professor(String name, String faculty, ArrayList<String> currMod, ArrayList<String> prevMod) {
        this.name = name;
        this.faculty = faculty;
        this.currMod = currMod;
        this.prevMod = prevMod;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public ArrayList<String> getCurrMod() {
        return currMod;
    }

    public void setCurrMod(ArrayList<String> currMod) {
        this.currMod = currMod;
    }

    public ArrayList<String> gePrevMod() {
        return prevMod;
    }

    public void setPrevMod(ArrayList<String> prevMod) {
        this.prevMod = prevMod;
    }
}

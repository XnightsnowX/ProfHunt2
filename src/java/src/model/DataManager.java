package src.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DataManager implements ServletContextListener {

    public DataManager() {
    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        ServletContext context = arg0.getServletContext();
        String path = context.getRealPath("/data/prof.csv");
        String path2 = context.getRealPath("/data/profFeedback.csv");
        String path3 = context.getRealPath("/data/module.csv");
        String path4 = context.getRealPath("/data/modFeedback.csv");


    }

    public static ArrayList<Professor> readProf(ArrayList<Module> modList, ServletContext context) {
        
        String csvProfessor = context.getRealPath("/data/prof.csv");
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        ArrayList<Professor> resultList = new ArrayList<Professor>();
        //read professor
        try {

            br = new BufferedReader(new FileReader(csvProfessor));
            //skip first line
            br.readLine();
            while ((line = br.readLine()) != null) {
                ArrayList<String> profCurrMod = new ArrayList<String>();
                ArrayList<String> profPrevMod = new ArrayList<String>();
                // use comma as separator
                String[] professorLine = line.split(cvsSplitBy);
                String[] profCurrLine = professorLine[2].split(":");
                String[] profPrevLine = professorLine[3].split(":");

                /*
                 //trim and remove " from the first and last record
                 profCurrLine[0] = profCurrLine[0].substring(1, profCurrLine[0].length() - 1);
                 profCurrLine[profCurrLine.length - 1] = profCurrLine[profCurrLine.length - 1].substring(0, profCurrLine[0].length() - 2);
                 profPrevLine[0] = profPrevLine[0].substring(1, profPrevLine[0].length() - 1);
                 profPrevLine[profPrevLine.length - 1] = profPrevLine[profPrevLine.length - 1].substring(0, profPrevLine[0].length() - 2);
                 */
                //create an arraylist of curr mod the prof is teaching
                for (int i = 0; i < profCurrLine.length; i++) {
                    //Module modToAdd = searchMod(profCurrLine[i], modList);
                    profCurrMod.add(profCurrLine[i]);
                }

                //create an arraylist of previous mod the prof is teaching
                for (int i = 0; i < profPrevLine.length; i++) {
                    profPrevMod.add(profPrevLine[i]);
                }

                //crete new prof and add to profList
                Professor p = new Professor(professorLine[0], professorLine[1], profCurrMod, profPrevMod);
                resultList.add(p);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultList;
    }// end readFile

    public static ArrayList<Module> readModule(ServletContext context) {
        String csvModule = context.getRealPath("/data/module.csv");
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        ArrayList<Module> resultList = new ArrayList<Module>();

        //read professor
        try {
            br = new BufferedReader(new FileReader(csvModule));
            //skip first line
            br.readLine();
            while ((line = br.readLine()) != null) {

                // use comma as separator
                String[] modLine = line.split(cvsSplitBy);

                Module mod = new Module(modLine[0], modLine[1]);

                resultList.add(mod);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultList;
    }// end readFile

    public static ArrayList<ModuleFeedback> readModFeedback(ArrayList<Module> modList,ServletContext context) {
        String csvModule = context.getRealPath("/data/modFeedback.csv");
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        ArrayList<ModuleFeedback> resultList = new ArrayList<ModuleFeedback>();

        //read professor
        try {
            br = new BufferedReader(new FileReader(csvModule));
            //skip first line
            br.readLine();
            while ((line = br.readLine()) != null) {

                // use comma as separator
                String[] modLine = line.split(cvsSplitBy);
                Module m = searchMod(modLine[0], modList);
                ModuleFeedback modFeedback = new ModuleFeedback(modLine[0], Double.parseDouble(modLine[1]), Double.parseDouble(modLine[2]), Double.parseDouble(modLine[3]), Double.parseDouble(modLine[4]), modLine[5], modLine[6], Integer.parseInt(modLine[7]), modLine[8], modLine[9], modLine[10]);

                resultList.add(modFeedback);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultList;
    }// end readFile

    public static ArrayList<ProfessorFeedback> readProfFeedback(ArrayList<Professor> profList,ServletContext context) {
        String csvModule = context.getRealPath("/data/profFeedback.csv");
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        ArrayList<ProfessorFeedback> resultList = new ArrayList<ProfessorFeedback>();

        //read professor
        try {
            br = new BufferedReader(new FileReader(csvModule));
            //skip first line
            br.readLine();
            while ((line = br.readLine()) != null) {

                // use comma as separator
                String[] modLine = line.split(cvsSplitBy);
                ProfessorFeedback profFeedback = new ProfessorFeedback(modLine[0], Double.parseDouble(modLine[1]), Double.parseDouble(modLine[2]), Double.parseDouble(modLine[3]), Double.parseDouble(modLine[4]), modLine[5], modLine[6], Integer.parseInt(modLine[7]), modLine[8], modLine[9], modLine[10]);

                resultList.add(profFeedback);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultList;
    }// end readFile

    public static Module searchMod(String name, ArrayList<Module> modList) {
        for (int i = 0; i < modList.size(); i++) {
            Module tempMod = modList.get(i);
            if (tempMod.getCode().toLowerCase().equals(name.toLowerCase())) {
                return tempMod;
            }
        }
        return null;
    }

    public static Professor searchProf(String name, ArrayList<Professor> profList) {
        for (int i = 0; i < profList.size(); i++) {
            Professor tempProf = profList.get(i);
            if (tempProf.getName().toLowerCase().equals(name.toLowerCase())) {
                return tempProf;
            }
        }
        return null;
    }

    public static double profOverallRating(String profName, ArrayList<ProfessorFeedback> profFeedbackList) {
        double result = 0;
        double temp = 0.0;
        int counter = 0;
        for (int i = 0; i < profFeedbackList.size(); i++) {
            ProfessorFeedback p = profFeedbackList.get(i);
            String prof = p.getProf();

            if (prof.equals(profName)) {
                temp += p.getAttr4();
                counter++;
            }

        }
        DecimalFormat df = new DecimalFormat("#.##");
        result = temp / counter;
        return Double.parseDouble(df.format(result));
    }

    public static double modOverallRating(String mod, ArrayList<ModuleFeedback> modFeedbackList) {
        double result = 0;
        double temp = 0.0;
        int counter = 0;
        for (int i = 0; i < modFeedbackList.size(); i++) {
            ModuleFeedback p = modFeedbackList.get(i);
            if (p.getMod().equals(mod)) {
                temp += p.getAttr4();
                counter++;
            }
        }
        DecimalFormat df = new DecimalFormat("#.##");
        result = temp / counter;
        return Double.parseDouble(df.format(result));
    }

    public static ArrayList<Professor> modCurrProf(String mod, ArrayList<Professor> profList) {
        ArrayList<Professor> resultList = new ArrayList<Professor>();
        for (int i = 0; i < profList.size(); i++) {
            Professor p = profList.get(i);
            ArrayList<String> modList = p.getCurrMod();

            for (int j = 0; j < modList.size(); j++) {
                if (modList.get(j).equals(mod)) {
                    resultList.add(p);
                    break;
                }
            }
        }
        return resultList;
    }

    public static ArrayList<Professor> modPrevProf(String mod, ArrayList<Professor> profList) {
        ArrayList<Professor> resultList = new ArrayList<Professor>();
        for (int i = 0; i < profList.size(); i++) {
            Professor p = profList.get(i);
            ArrayList<String> modList = p.gePrevMod();

            for (int j = 0; j < modList.size(); j++) {
                if (modList.get(j).equals(mod)) {
                    resultList.add(p);
                    break;
                }
            }
        }
        return resultList;
    }
}//end class

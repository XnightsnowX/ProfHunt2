package src.process;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.model.DataManager;
import src.model.Module;
import src.model.ModuleFeedback;
import src.model.Professor;
import src.model.ProfessorFeedback;

/**
 * Servlet implementation class processInit
 */
@WebServlet("/processInit")
public class processInit extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public processInit() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataManager dm = new DataManager();
        HttpSession session = request.getSession();
        ServletContext context = session.getServletContext();
        //start the whole application
        ArrayList<Module> modList = new ArrayList<Module>();

        Module m1 = new Module("Information Systems 101", "IS101");
        Module m2 = new Module("Information Systems 102", "IS102");
        Module m3 = new Module("Information Systems 103", "IS103");
        Module m4 = new Module("Economic 101", "ECON101");
       // Module m5 = new Module("Busines 002", "BIZ002");
        // Module m6 = new Module("Business 003", "BIZ003");
        Module m7 = new Module("Accounting 101", "ACC101");
        Module m8 = new Module("Law 101", "LAW101");

        modList.add(m1);
        modList.add(m2);
        modList.add(m3);
        modList.add(m4);
       // modList.add(m5);
        // modList.add(m6);
        modList.add(m7);
        modList.add(m8);

        ArrayList<String> s1 = new ArrayList<String>();
        s1.add("IS101");
        s1.add("IS102");
        s1.add("IS103");

        ArrayList<String> s2 = new ArrayList<String>();
        s2.add("ACC101");

        ArrayList<String> s3 = new ArrayList<String>();
        s3.add("LAW101");

        ArrayList<String> s4 = new ArrayList<String>();
        s4.add("ECON101");

        Professor p1 = new Professor("Richard Davis", "School of Information Systems", s1, s1);
        Professor p2 = new Professor("Harry A", "School of Information Systems", s1, s1);
        Professor p3 = new Professor("Charlie Mich", "School of Accountancy", s2, s2);
        Professor p4 = new Professor("Alan Weater", "School of Law", s3, s3);
        Professor p5 = new Professor("Leb AA", "School of Economics", s4, s4);

ModuleFeedback mfb1 = new ModuleFeedback("IS101",8.651,9.872,9.816,9.44633333333333,"This is a wonderful slack module that taught us many IT concepts on how companies operate","snowball242",-36,"2008-09","T2","5/8/2012");
ModuleFeedback mfb2 = new ModuleFeedback("IS102",5.642,5.438,5.791,5.62366666666667,"I hated his class","Tillie Mahurin  ",59,"2008-09","T1","15/9/2012");
ModuleFeedback mfb3 = new ModuleFeedback("IS103",9,4,8,7,"nice","Alonzo Munger  ",-31,"2002-03","T2","25/12/2011");
ModuleFeedback mfb4 = new ModuleFeedback("ECON101",4,6,1,3.67,"awesome","Jamie Stever  ",67,"2011-12","T1","19/5/2011");
ModuleFeedback mfb5 = new ModuleFeedback("BIZ002",3,2,3,2.67,"Improve him believe opinion offered met and end cheered forbade. ","Camila Mcclintic  ",99,"2010-11","T2","3/10/2013");
ModuleFeedback mfb6 = new ModuleFeedback("BIZ003",9,6,9,8,"I enjoyed his class","Mitchell Tirado  ",30,"2003-04","T2","20/2/2010");
ModuleFeedback mfb7 = new ModuleFeedback("ACC101",4,3,2,3," Friendly as stronger speedily by recurred.","Jamie Stever  ",37,"2003-04","T1","23/1/2010");
ModuleFeedback mfb8 = new ModuleFeedback("LAW101",6,8,3,5.67,"I enjoyed his class","Tula Vanauken  ",-30,"2005-06","T2","27/3/2013");
ModuleFeedback mfb9 = new ModuleFeedback("IS101",8.415,9.003,9.331,8.91633333333333,"The exams were difficult like hell!","Hermoine  ",23,"2011-12","T1","10/3/2011");
ModuleFeedback mfb10 = new ModuleFeedback("IS102",3.271,4.019,5.576,4.28866666666667,"I enjoyed his class","Herta Wakefield  ",14,"2007-08","T2","25/4/2011");
ModuleFeedback mfb11 = new ModuleFeedback("IS103",4,9,9,7.33," Friendly as stronger speedily by recurred.","Johana Choice  ",-40,"2003-04","T1","3/8/2011");
ModuleFeedback mfb12 = new ModuleFeedback("ECON101",4,9,10,7.67,"good","Tillie Mahurin  ",4,"2010-11","T1","25/6/2010");
ModuleFeedback mfb13 = new ModuleFeedback("BIZ002",7,10,7,8,"good","Ola Thill  ",32,"2012-13","T1","11/11/2013");
ModuleFeedback mfb14 = new ModuleFeedback("BIZ003",2,5,6,4.33," Friendly as stronger speedily by recurred.","Pandora Kuether  ",60,"2013-14","T2","7/6/2012");
ModuleFeedback mfb15 = new ModuleFeedback("ACC101",1,1,8,3.33,"good","Lucius Guidi  ",43,"2007-08","T1","2/4/2012");
ModuleFeedback mfb16 = new ModuleFeedback("LAW101",6,3,2,3.67,"Improve him believe opinion offered met and end cheered forbade. ","Herta Wakefield  ",1,"2010-11","T1","6/3/2013");
ModuleFeedback mfb17 = new ModuleFeedback("IS101",8.048,9.882,8.738,8.88933333333333,"One of the easiest module!","Shanon Colin  ",97,"2011-12","T1","11/10/2010");
ModuleFeedback mfb18 = new ModuleFeedback("IS102",4.852,3.792,5.892,4.84533333333333," Friendly as stronger speedily by recurred.","Herta Wakefield  ",7,"2006-07","T2","23/4/2010");
ModuleFeedback mfb19 = new ModuleFeedback("IS103",7,2,9,6,"lousy","Ola Thill  ",-4,"2008-09","T1","21/9/2011");
ModuleFeedback mfb20 = new ModuleFeedback("ECON101",5,3,5,4.33," Friendly as stronger speedily by recurred.","Tula Vanauken  ",8,"2003-04","T2","4/7/2013");
ModuleFeedback mfb21 = new ModuleFeedback("BIZ002",7,5,2,4.67,"lousy","Lucius Guidi  ",-45,"2006-07","T2","15/5/2011");
ModuleFeedback mfb22 = new ModuleFeedback("BIZ003",4,6,5,5," Friendly as stronger speedily by recurred.","Adrienne Soileau  ",39,"2012-13","T1","9/1/2013");
ModuleFeedback mfb23 = new ModuleFeedback("ACC101",8,7,2,5.67,"I enjoyed his class","Pandora Kuether  ",-29,"2002-03","T1","9/4/2012");
ModuleFeedback mfb24 = new ModuleFeedback("LAW101",7,2,6,5,"I enjoyed his class","Tula Vanauken  ",67,"2003-04","T1","18/4/2010");
ModuleFeedback mfb25 = new ModuleFeedback("IS101",9.437,9.605,8.271,9.10433333333333,"Quite a good module.","Hershel Enloe  ",42,"2009-10","T1","16/3/2013");
ModuleFeedback mfb26 = new ModuleFeedback("IS102",5.866,5.919,4.554,5.44633333333333,"normal","Mitchell Tirado  ",2,"2005-06","T2","16/6/2010");
ModuleFeedback mfb27 = new ModuleFeedback("IS103",4,3,4,3.67,"normal","Alonzo Munger  ",65,"2009-10","T2","21/3/2012");
ModuleFeedback mfb28 = new ModuleFeedback("ECON101",1,2,10,4.33," Friendly as stronger speedily by recurred.","Cathrine Ruddell  ",85,"2007-08","T2","9/4/2013");
ModuleFeedback mfb29 = new ModuleFeedback("BIZ002",8,6,5,6.33,"boring claass","Mitchell Tirado  ",11,"2006-07","T1","30/11/2013");
ModuleFeedback mfb30 = new ModuleFeedback("BIZ003",4,6,6,5.33," Friendly as stronger speedily by recurred.","Cori Ishee  ",14,"2013-14","T1","1/9/2013");
ModuleFeedback mfb31 = new ModuleFeedback("ACC101",3,8,2,4.33," Friendly as stronger speedily by recurred.","Marianne Meloy  ",-13,"2002-03","T1","23/8/2012");
ModuleFeedback mfb32 = new ModuleFeedback("LAW101",6,4,8,6,":)","Tula Vanauken  ",49,"2005-06","T2","13/12/2012");
ModuleFeedback mfb33 = new ModuleFeedback("IS101",9.64,9.517,8.562,9.23966666666667,"Class presentation was one of the hardest! ","Jonny ",98,"2007-08","T1","26/4/2011");
ModuleFeedback mfb34 = new ModuleFeedback("IS102",5.454,3.654,5.136,4.748,"not good ","Ola Thill  ",70,"2003-04","T1","18/6/2010");
ModuleFeedback mfb35 = new ModuleFeedback("IS103",4,9,3,5.33," Friendly as stronger speedily by recurred.","Shanon Colin  ",60,"2011-12","T1","15/1/2010");
ModuleFeedback mfb36 = new ModuleFeedback("ECON101",3,5,7,5,"I enjoyed his class","Tula Vanauken  ",61,"2006-07","T1","11/6/2012");
ModuleFeedback mfb37 = new ModuleFeedback("BIZ002",7,9,4,6.67,"I enjoyed his class","Shanon Colin  ",-25,"2004-05","T2","26/3/2010");
ModuleFeedback mfb38 = new ModuleFeedback("BIZ003",7,1,7,5," Friendly as stronger speedily by recurred.","Marianne Meloy  ",-27,"2008-09","T1","11/4/2013");
ModuleFeedback mfb39 = new ModuleFeedback("ACC101",2,7,8,5.67,"interesting class","Tillie Mahurin  ",-4,"2010-11","T2","2/5/2013");
ModuleFeedback mfb40 = new ModuleFeedback("LAW101",4,1,7,4,"interesting class","Shanon Colin  ",-12,"2004-05","T1","17/1/2010");
ModuleFeedback mfb41 = new ModuleFeedback("IS101",9.543,8.424,9.887,9.28466666666667,"Class part, class part, and more class part.","Anja Mansir  ",-46,"2007-08","T1","24/6/2012");
ModuleFeedback mfb42 = new ModuleFeedback("IS102",5.718,4.663,5.524,5.30166666666667,"interesting class","Hershel Enloe  ",53,"2007-08","T2","27/8/2013");
ModuleFeedback mfb43 = new ModuleFeedback("IS103",6,10,9,8.33,"I enjoyed his class","Cathrine Ruddell  ",38,"2005-06","T1","12/10/2011");
ModuleFeedback mfb44 = new ModuleFeedback("ECON101",7,7,5,6.33,"I enjoyed his class","Jong Waldon  ",62,"2003-04","T2","17/1/2012");
ModuleFeedback mfb45 = new ModuleFeedback("BIZ002",7,4,3,4.67,"Improve him believe opinion offered met and end cheered forbade. ","Deonna Alkire  ",41,"2012-13","T2","24/9/2013");
ModuleFeedback mfb46 = new ModuleFeedback("BIZ003",1,7,3,3.67,"I enjoyed his class","Jamie Stever  ",62,"2003-04","T2","19/8/2010");
ModuleFeedback mfb47 = new ModuleFeedback("ACC101",9,5,8,7.33,"I enjoyed his class","Adrienne Soileau  ",-22,"2012-13","T2","24/4/2011");
ModuleFeedback mfb48 = new ModuleFeedback("LAW101",7,1,10,6," Friendly as stronger speedily by recurred.","Rebekah Jaime  ",73,"2009-10","T1","13/12/2011");
ModuleFeedback mfb49 = new ModuleFeedback("IS101",8.501,9.598,8.411,8.83666666666667,"Light workload except when its time for presentation!","Natalie Crofts  ",-38,"2006-07","T2","26/10/2013");
ModuleFeedback mfb50 = new ModuleFeedback("IS102",4.426,4.025,3.455,3.96866666666667," Friendly as stronger speedily by recurred.","Tillie Mahurin  ",68,"2008-09","T2","19/12/2013");
ModuleFeedback mfb51 = new ModuleFeedback("IS103",1,4,9,4.67,"interesting class","Jamie Stever  ",93,"2006-07","T1","6/3/2012");
ModuleFeedback mfb52 = new ModuleFeedback("ECON101",7,6,4,5.67,"useful class","Erasmo Frigo  ",6,"2005-06","T2","24/1/2012");
ModuleFeedback mfb53 = new ModuleFeedback("BIZ002",4,8,3,5,"Improve him believe opinion offered met and end cheered forbade. ","Latia Griffen  ",73,"2004-05","T2","19/4/2012");
ModuleFeedback mfb54 = new ModuleFeedback("BIZ003",9,9,9,9,"needs to improve ths material","Natalie Crofts  ",22,"2012-13","T1","20/6/2011");
ModuleFeedback mfb55 = new ModuleFeedback("ACC101",6,7,5,6,"not useful","Lucius Guidi  ",66,"2004-05","T2","20/12/2013");
ModuleFeedback mfb56 = new ModuleFeedback("LAW101",6,6,3,5," Friendly as stronger speedily by recurred.","Ola Thill  ",-27,"2009-10","T2","9/12/2012");
ModuleFeedback mfb57 = new ModuleFeedback("IS101",9.496,9.343,9.319,9.386,"This is a wonderful slack module that taught us many IT concepts on how companies operate","Tillie Mahurin  ",63,"2006-07","T2","4/12/2011");
ModuleFeedback mfb58 = new ModuleFeedback("IS102",4.573,5.99,3.089,4.55066666666667," Friendly as stronger speedily by recurred.","Latia Griffen  ",8,"2004-05","T2","29/9/2013");
ModuleFeedback mfb59 = new ModuleFeedback("IS103",7,4,3,4.67,"super heavy workload","Shanon Colin  ",65,"2011-12","T2","7/6/2012");
ModuleFeedback mfb60 = new ModuleFeedback("ECON101",1,9,10,6.67,"Improve him believe opinion offered met and end cheered forbade. ","Camila Mcclintic  ",80,"2009-10","T2","14/1/2013");
ModuleFeedback mfb61 = new ModuleFeedback("BIZ002",6,10,2,6,"best prof","Hyman Parrent  ",9,"2006-07","T2","16/12/2012");
ModuleFeedback mfb62 = new ModuleFeedback("BIZ003",3,4,6,4.33,"lousy","Johana Choice  ",70,"2005-06","T2","7/11/2011");
ModuleFeedback mfb63 = new ModuleFeedback("ACC101",8,10,10,9.33," Friendly as stronger speedily by recurred.","Pandora Kuether  ",-28,"2005-06","T1","29/4/2011");
ModuleFeedback mfb64 = new ModuleFeedback("LAW101",7,7,3,5.67,"need to improve communication","Hershel Enloe  ",-15,"2006-07","T1","27/1/2012");
ModuleFeedback mfb65 = new ModuleFeedback("IS101",9.802,9.477,9.329,9.536,"The exams were difficult like hell!","Jamie Stever  ",83,"2013-14","T1","5/6/2010");
ModuleFeedback mfb66 = new ModuleFeedback("IS102",5.954,3.356,5.818,5.04266666666667,"needs to improve ths material","Johana Choice  ",-18,"2005-06","T1","20/1/2012");
ModuleFeedback mfb67 = new ModuleFeedback("IS103",1,2,10,4.33,"not useful","Hershel Enloe  ",10,"2009-10","T2","5/8/2012");
ModuleFeedback mfb68 = new ModuleFeedback("ECON101",10,9,4,7.67," Friendly as stronger speedily by recurred.","Pandora Kuether  ",-24,"2004-05","T1","24/9/2013");
ModuleFeedback mfb69 = new ModuleFeedback("BIZ002",7,5,1,4.33,"can be better","Pandora Kuether  ",38,"2003-04","T2","13/7/2012");
ModuleFeedback mfb70 = new ModuleFeedback("BIZ003",4,5,10,6.33," Friendly as stronger speedily by recurred.","Pandora Kuether  ",14,"2007-08","T2","2/8/2010");
ModuleFeedback mfb71 = new ModuleFeedback("ACC101",8,8,4,6.67,"Improve him believe opinion offered met and end cheered forbade. ","Pansy Sanger  ",18,"2011-12","T2","9/6/2012");
ModuleFeedback mfb72 = new ModuleFeedback("LAW101",4,3,10,5.67,":)","Latia Griffen  ",59,"2003-04","T2","30/10/2012");
ModuleFeedback mfb73 = new ModuleFeedback("IS101",9.172,8.202,9.616,8.99666666666667,"One of the easiest module!","Pandora Kuether  ",-7,"2008-09","T2","23/8/2011");
ModuleFeedback mfb74 = new ModuleFeedback("IS102",5.4,5.333,5.748,5.49366666666667,"I enjoyed his class","Tula Vanauken  ",66,"2008-09","T1","13/6/2011");
ModuleFeedback mfb75 = new ModuleFeedback("IS103",7,4,2,4.33,"Improve him believe opinion offered met and end cheered forbade. ","Hershel Enloe  ",77,"2002-03","T2","3/12/2011");
ModuleFeedback mfb76 = new ModuleFeedback("ECON101",8,1,6,5,"normal","Mitchell Tirado  ",44,"2011-12","T1","1/4/2011");
ModuleFeedback mfb77 = new ModuleFeedback("BIZ002",5,8,9,7.33,"normal","Alonzo Munger  ",-44,"2010-11","T2","18/6/2012");
ModuleFeedback mfb78 = new ModuleFeedback("BIZ003",10,2,2,4.67," Friendly as stronger speedily by recurred.","Cathrine Ruddell  ",3,"2003-04","T2","16/10/2010");
ModuleFeedback mfb79 = new ModuleFeedback("ACC101",3,10,1,4.67,"boring claass","Mitchell Tirado  ",-8,"2003-04","T1","14/2/2010");
ModuleFeedback mfb80 = new ModuleFeedback("LAW101",4,8,8,6.67," Friendly as stronger speedily by recurred.","Cori Ishee  ",-47,"2005-06","T2","30/1/2012");
ModuleFeedback mfb81 = new ModuleFeedback("IS101",9.467,9.322,9.827,9.53866666666667," Quite a good module.","Marianne Meloy  ",80,"2011-12","T1","6/2/2011");
ModuleFeedback mfb82 = new ModuleFeedback("IS102",5.791,4.214,5.444,5.14966666666667,":)","Tula Vanauken  ",64,"2007-08","T2","2/11/2013");
ModuleFeedback mfb83 = new ModuleFeedback("IS103",8,2,8,6,"Improve him believe opinion offered met and end cheered forbade. ","Shanon Colin  ",45,"2003-04","T1","24/9/2011");
ModuleFeedback mfb84 = new ModuleFeedback("ECON101",7,8,4,6.33,"not good ","Ola Thill  ",-48,"2010-11","T1","17/5/2013");
ModuleFeedback mfb85 = new ModuleFeedback("BIZ002",5,6,5,5.33," Friendly as stronger speedily by recurred.","Shanon Colin  ",0,"2012-13","T1","11/5/2011");
ModuleFeedback mfb86 = new ModuleFeedback("BIZ003",8,6,8,7.33,"I enjoyed his class","Tula Vanauken  ",-45,"2013-14","T2","28/12/2013");
ModuleFeedback mfb87 = new ModuleFeedback("ACC101",4,10,8,7.33,"I enjoyed his class","Shanon Colin  ",-40,"2007-08","T1","17/7/2012");
ModuleFeedback mfb88 = new ModuleFeedback("LAW101",7,7,2,5.33," Friendly as stronger speedily by recurred.","Marianne Meloy  ",-18,"2010-11","T1","14/10/2013");
ModuleFeedback mfb89 = new ModuleFeedback("IS101",8.113,8.299,9.358,8.59,"Class presentation was one of the hardest!","GoldenRoger ",95,"2011-12","T1","15/7/2012");
ModuleFeedback mfb90 = new ModuleFeedback("IS102",5.174,3.108,5.639,4.64033333333333,"interesting class","Shanon Colin  ",52,"2006-07","T2","2/12/2011");
ModuleFeedback mfb91 = new ModuleFeedback("IS103",5,2,2,3,"interesting class","Anja Mansir  ",-21,"2008-09","T1","13/8/2010");
ModuleFeedback mfb92 = new ModuleFeedback("ECON101",10,5,5,6.67,"interesting class","Hershel Enloe  ",97,"2003-04","T2","15/7/2010");
ModuleFeedback mfb93 = new ModuleFeedback("BIZ002",4,10,1,5,"I enjoyed his class","Cathrine Ruddell  ",-32,"2006-07","T2","23/5/2010");
ModuleFeedback mfb94 = new ModuleFeedback("BIZ003",2,1,6,3,"I enjoyed his class","Jong Waldon  ",15,"2012-13","T1","7/11/2012");
ModuleFeedback mfb95 = new ModuleFeedback("ACC101",8,5,3,5.33,"Improve him believe opinion offered met and end cheered forbade. ","Deonna Alkire  ",-10,"2002-03","T1","1/1/2010");
ModuleFeedback mfb96 = new ModuleFeedback("LAW101",8,2,5,5,"I enjoyed his class","Jamie Stever  ",81,"2003-04","T1","20/8/2010");

        ArrayList<Professor> profList = new ArrayList<Professor>();
        ArrayList<ProfessorFeedback> profFeedbackList = new ArrayList<ProfessorFeedback>();
        ArrayList<ModuleFeedback> modFeedbackList = new ArrayList<ModuleFeedback>();
        boolean isPFB = false;
        boolean isMFB = false;

        profList.add(p1);
        profList.add(p2);
        profList.add(p3);
        profList.add(p4);
        profList.add(p5);

        modFeedbackList.add(mfb1);
        modFeedbackList.add(mfb2);
        modFeedbackList.add(mfb3);
        modFeedbackList.add(mfb4);
        modFeedbackList.add(mfb5);
        modFeedbackList.add(mfb6);
        modFeedbackList.add(mfb7);
        modFeedbackList.add(mfb8);
        modFeedbackList.add(mfb9);
        modFeedbackList.add(mfb10);
        modFeedbackList.add(mfb11);
        modFeedbackList.add(mfb12);
        modFeedbackList.add(mfb13);
        modFeedbackList.add(mfb14);
        modFeedbackList.add(mfb15);
        modFeedbackList.add(mfb16);
        modFeedbackList.add(mfb17);
        modFeedbackList.add(mfb18);
        modFeedbackList.add(mfb19);
        modFeedbackList.add(mfb20);
        modFeedbackList.add(mfb21);
        modFeedbackList.add(mfb22);
        modFeedbackList.add(mfb23);
        modFeedbackList.add(mfb24);
        modFeedbackList.add(mfb25);
        modFeedbackList.add(mfb26);
        modFeedbackList.add(mfb27);
        modFeedbackList.add(mfb28);
        modFeedbackList.add(mfb29);
        modFeedbackList.add(mfb30);
        modFeedbackList.add(mfb31);
        modFeedbackList.add(mfb32);
        modFeedbackList.add(mfb33);
        modFeedbackList.add(mfb34);
        modFeedbackList.add(mfb35);
        modFeedbackList.add(mfb36);
        modFeedbackList.add(mfb37);
        modFeedbackList.add(mfb38);
        modFeedbackList.add(mfb39);
        modFeedbackList.add(mfb40);
        modFeedbackList.add(mfb41);
        modFeedbackList.add(mfb42);
        modFeedbackList.add(mfb43);
        modFeedbackList.add(mfb44);
        modFeedbackList.add(mfb45);
        modFeedbackList.add(mfb46);
        modFeedbackList.add(mfb47);
        modFeedbackList.add(mfb48);
        modFeedbackList.add(mfb49);
        modFeedbackList.add(mfb50);
        modFeedbackList.add(mfb51);
        modFeedbackList.add(mfb52);
        modFeedbackList.add(mfb53);
        modFeedbackList.add(mfb54);
        modFeedbackList.add(mfb55);
        modFeedbackList.add(mfb56);
        modFeedbackList.add(mfb57);
        modFeedbackList.add(mfb58);
        modFeedbackList.add(mfb59);
        modFeedbackList.add(mfb60);
        modFeedbackList.add(mfb61);
        modFeedbackList.add(mfb62);
        modFeedbackList.add(mfb63);
        modFeedbackList.add(mfb64);
        modFeedbackList.add(mfb65);
        modFeedbackList.add(mfb66);
        modFeedbackList.add(mfb67);
        modFeedbackList.add(mfb68);
        modFeedbackList.add(mfb69);
        modFeedbackList.add(mfb70);
        modFeedbackList.add(mfb71);
        modFeedbackList.add(mfb72);
        modFeedbackList.add(mfb73);
        modFeedbackList.add(mfb74);
        modFeedbackList.add(mfb75);
        modFeedbackList.add(mfb76);
        modFeedbackList.add(mfb77);
        modFeedbackList.add(mfb78);
        modFeedbackList.add(mfb79);
        modFeedbackList.add(mfb80);
        modFeedbackList.add(mfb81);
        modFeedbackList.add(mfb82);
        modFeedbackList.add(mfb83);
        modFeedbackList.add(mfb84);
        modFeedbackList.add(mfb85);
        modFeedbackList.add(mfb86);
        modFeedbackList.add(mfb87);
        modFeedbackList.add(mfb88);
        modFeedbackList.add(mfb89);
        modFeedbackList.add(mfb90);
        modFeedbackList.add(mfb91);
        modFeedbackList.add(mfb92);
        modFeedbackList.add(mfb93);
        modFeedbackList.add(mfb94);
        modFeedbackList.add(mfb95);
        modFeedbackList.add(mfb96);

        ProfessorFeedback pfb1 = new ProfessorFeedback("Richard Davis", 10, 7, 7, 8, "I enjoyed his class", "Shanon Colin  ", 32, "2008-09", "T2", "19/12/2010");
        ProfessorFeedback pfb2 = new ProfessorFeedback("Harry A", 9, 9, 8, 8.67, "I hated his class", "Tillie Mahurin  ", 96, "2008-09", "T1", "18/8/2012");
        ProfessorFeedback pfb3 = new ProfessorFeedback("Harry B", 6, 8, 4, 6, "nice", "Alonzo Munger  ", 35, "2002-03", "T2", "8/12/2010");
        ProfessorFeedback pfb4 = new ProfessorFeedback("Charlie Mich", 4, 6, 1, 3.67, "awesome", "Jamie Stever  ", 26, "2011-12", "T1", "18/11/2013");
        ProfessorFeedback pfb5 = new ProfessorFeedback("Alan Weater", 6, 10, 8, 8, "Improve him believe opinion offered met and end cheered forbade. ", "Camila Mcclintic  ", 88, "2010-11", "T2", "22/2/2013");
        ProfessorFeedback pfb6 = new ProfessorFeedback("Leb AA", 8, 3, 4, 5, "I enjoyed his class", "Mitchell Tirado  ", -10, "2003-04", "T2", "16/9/2010");
        ProfessorFeedback pfb7 = new ProfessorFeedback("Richard Davis", 7, 1, 10, 6, " Friendly as stronger speedily by recurred.", "Jamie Stever  ", 96, "2003-04", "T1", "11/3/2012");
        ProfessorFeedback pfb8 = new ProfessorFeedback("Harry A", 9, 4, 9, 7.33, "I enjoyed his class", "Tula Vanauken  ", 74, "2005-06", "T2", "22/2/2013");
        ProfessorFeedback pfb9 = new ProfessorFeedback("Harry B", 5, 6, 1, 4, "Improve him believe opinion offered met and end cheered forbade. ", "Natalie Crofts  ", 80, "2011-12", "T1", "10/9/2010");
        ProfessorFeedback pfb10 = new ProfessorFeedback("Charlie Mich", 2, 10, 6, 6, "I enjoyed his class", "Herta Wakefield  ", -38, "2007-08", "T2", "23/11/2013");
        ProfessorFeedback pfb11 = new ProfessorFeedback("Alan Weater", 6, 7, 6, 6.33, " Friendly as stronger speedily by recurred.", "Johana Choice  ", -8, "2003-04", "T1", "22/5/2011");
        ProfessorFeedback pfb12 = new ProfessorFeedback("Leb AA", 10, 2, 6, 6, "good", "Tillie Mahurin  ", 98, "2010-11", "T1", "13/9/2013");
        ProfessorFeedback pfb13 = new ProfessorFeedback("Richard Davis", 1, 3, 5, 3, "good", "Ola Thill  ", 91, "2012-13", "T1", "11/12/2010");
        ProfessorFeedback pfb14 = new ProfessorFeedback("Harry A", 7, 2, 9, 6, " Friendly as stronger speedily by recurred.", "Pandora Kuether  ", 0, "2013-14", "T2", "19/9/2011");
        ProfessorFeedback pfb15 = new ProfessorFeedback("Harry B", 4, 3, 3, 3.33, "good", "Lucius Guidi  ", 16, "2007-08", "T1", "2/7/2011");
        ProfessorFeedback pfb16 = new ProfessorFeedback("Charlie Mich", 9, 8, 2, 6.33, "Improve him believe opinion offered met and end cheered forbade. ", "Herta Wakefield  ", -41, "2010-11", "T1", "4/1/2010");
        ProfessorFeedback pfb17 = new ProfessorFeedback("Alan Weater", 9, 5, 7, 7, "lousy", "Shanon Colin  ", 68, "2011-12", "T1", "22/11/2011");
        ProfessorFeedback pfb18 = new ProfessorFeedback("Leb AA", 9, 9, 8, 8.67, " Friendly as stronger speedily by recurred.", "Herta Wakefield  ", -36, "2006-07", "T2", "14/5/2010");
        ProfessorFeedback pfb19 = new ProfessorFeedback("Richard Davis", 3, 7, 7, 5.67, "lousy", "Ola Thill  ", 13, "2008-09", "T1", "5/11/2012");
        ProfessorFeedback pfb20 = new ProfessorFeedback("Harry A", 10, 2, 10, 7.33, " Friendly as stronger speedily by recurred.", "Tula Vanauken  ", 36, "2003-04", "T2", "8/10/2011");
        ProfessorFeedback pfb21 = new ProfessorFeedback("Harry B", 3, 1, 9, 4.33, "lousy", "Lucius Guidi  ", 31, "2006-07", "T2", "9/12/2011");
        ProfessorFeedback pfb22 = new ProfessorFeedback("Charlie Mich", 1, 3, 8, 4, " Friendly as stronger speedily by recurred.", "Adrienne Soileau  ", 65, "2012-13", "T1", "11/7/2010");
        ProfessorFeedback pfb23 = new ProfessorFeedback("Alan Weater", 8, 9, 10, 9, "I enjoyed his class", "Pandora Kuether  ", 37, "2002-03", "T1", "21/7/2012");
        ProfessorFeedback pfb24 = new ProfessorFeedback("Leb AA", 1, 5, 1, 2.33, "I enjoyed his class", "Tula Vanauken  ", 41, "2003-04", "T1", "7/10/2010");
        ProfessorFeedback pfb25 = new ProfessorFeedback("Richard Davis", 3, 6, 2, 3.67, "Improve him believe opinion offered met and end cheered forbade. ", "Hershel Enloe  ", -43, "2009-10", "T1", "11/2/2012");
        ProfessorFeedback pfb26 = new ProfessorFeedback("Harry A", 9, 9, 8, 8.67, "normal", "Mitchell Tirado  ", 62, "2005-06", "T2", "21/12/2011");
        ProfessorFeedback pfb27 = new ProfessorFeedback("Harry B", 3, 3, 3, 3, "normal", "Alonzo Munger  ", 79, "2009-10", "T2", "14/7/2012");
        ProfessorFeedback pfb28 = new ProfessorFeedback("Charlie Mich", 1, 8, 5, 4.67, " Friendly as stronger speedily by recurred.", "Cathrine Ruddell  ", 63, "2007-08", "T2", "2/7/2010");
        ProfessorFeedback pfb29 = new ProfessorFeedback("Alan Weater", 9, 10, 2, 7, "boring claass", "Mitchell Tirado  ", -10, "2006-07", "T1", "31/3/2012");
        ProfessorFeedback pfb30 = new ProfessorFeedback("Leb AA", 6, 1, 9, 5.33, " Friendly as stronger speedily by recurred.", "Cori Ishee  ", 47, "2013-14", "T1", "27/2/2010");
        ProfessorFeedback pfb31 = new ProfessorFeedback("Richard Davis", 2, 1, 6, 3, " Friendly as stronger speedily by recurred.", "Marianne Meloy  ", 63, "2002-03", "T1", "18/8/2012");
        ProfessorFeedback pfb32 = new ProfessorFeedback("Harry A", 5, 7, 8, 6.67, ":)", "Tula Vanauken  ", 69, "2005-06", "T2", "18/4/2011");
        ProfessorFeedback pfb33 = new ProfessorFeedback("Harry B", 1, 9, 6, 5.33, "Improve him believe opinion offered met and end cheered forbade. ", "Shanon Colin  ", 59, "2007-08", "T1", "11/6/2012");
        ProfessorFeedback pfb34 = new ProfessorFeedback("Charlie Mich", 10, 8, 7, 8.33, "not good ", "Ola Thill  ", 57, "2003-04", "T1", "7/8/2011");
        ProfessorFeedback pfb35 = new ProfessorFeedback("Alan Weater", 8, 7, 10, 8.33, " Friendly as stronger speedily by recurred.", "Shanon Colin  ", 25, "2011-12", "T1", "28/10/2010");
        ProfessorFeedback pfb36 = new ProfessorFeedback("Leb AA", 5, 8, 1, 4.67, "I enjoyed his class", "Tula Vanauken  ", 31, "2006-07", "T1", "25/12/2013");
        ProfessorFeedback pfb37 = new ProfessorFeedback("Richard Davis", 6, 3, 5, 4.67, "I enjoyed his class", "Shanon Colin  ", 86, "2004-05", "T2", "15/9/2010");
        ProfessorFeedback pfb38 = new ProfessorFeedback("Harry A", 10, 1, 2, 4.33, " Friendly as stronger speedily by recurred.", "Marianne Meloy  ", -43, "2008-09", "T1", "8/8/2010");
        ProfessorFeedback pfb39 = new ProfessorFeedback("Harry B", 8, 2, 1, 3.67, "interesting class", "Tillie Mahurin  ", -23, "2010-11", "T2", "22/6/2013");
        ProfessorFeedback pfb40 = new ProfessorFeedback("Charlie Mich", 3, 4, 4, 3.67, "interesting class", "Shanon Colin  ", -10, "2004-05", "T1", "8/7/2011");
        ProfessorFeedback pfb41 = new ProfessorFeedback("Alan Weater", 10, 10, 5, 8.33, "interesting class", "Anja Mansir  ", -39, "2007-08", "T1", "11/11/2011");
        ProfessorFeedback pfb42 = new ProfessorFeedback("Leb AA", 3, 6, 10, 6.33, "interesting class", "Hershel Enloe  ", -33, "2007-08", "T2", "17/2/2010");
        ProfessorFeedback pfb43 = new ProfessorFeedback("Richard Davis", 8, 6, 1, 5, "I enjoyed his class", "Cathrine Ruddell  ", -17, "2005-06", "T1", "21/1/2013");
        ProfessorFeedback pfb44 = new ProfessorFeedback("Harry A", 1, 4, 9, 4.67, "I enjoyed his class", "Jong Waldon  ", -1, "2003-04", "T2", "20/12/2012");
        ProfessorFeedback pfb45 = new ProfessorFeedback("Harry B", 10, 4, 2, 5.33, "Improve him believe opinion offered met and end cheered forbade. ", "Deonna Alkire  ", -43, "2012-13", "T2", "31/10/2012");
        ProfessorFeedback pfb46 = new ProfessorFeedback("Charlie Mich", 5, 1, 8, 4.67, "I enjoyed his class", "Jamie Stever  ", -4, "2003-04", "T2", "16/8/2013");
        ProfessorFeedback pfb47 = new ProfessorFeedback("Alan Weater", 3, 5, 6, 4.67, "I enjoyed his class", "Adrienne Soileau  ", 40, "2012-13", "T2", "12/2/2011");
        ProfessorFeedback pfb48 = new ProfessorFeedback("Leb AA", 1, 3, 5, 3, " Friendly as stronger speedily by recurred.", "Rebekah Jaime  ", 24, "2009-10", "T1", "8/6/2013");
        ProfessorFeedback pfb49 = new ProfessorFeedback("Richard Davis", 7, 3, 1, 3.67, "interesting class", "Natalie Crofts  ", 85, "2006-07", "T2", "6/5/2011");
        ProfessorFeedback pfb50 = new ProfessorFeedback("Harry A", 5, 5, 9, 6.33, " Friendly as stronger speedily by recurred.", "Tillie Mahurin  ", 69, "2008-09", "T2", "4/4/2013");
        ProfessorFeedback pfb51 = new ProfessorFeedback("Harry B", 10, 6, 5, 7, "interesting class", "Jamie Stever  ", 20, "2006-07", "T1", "30/8/2013");
        ProfessorFeedback pfb52 = new ProfessorFeedback("Charlie Mich", 7, 9, 3, 6.33, "useful class", "Erasmo Frigo  ", 43, "2005-06", "T2", "6/3/2011");
        ProfessorFeedback pfb53 = new ProfessorFeedback("Alan Weater", 10, 8, 2, 6.67, "Improve him believe opinion offered met and end cheered forbade. ", "Latia Griffen  ", -23, "2004-05", "T2", "22/2/2012");
        ProfessorFeedback pfb54 = new ProfessorFeedback("Leb AA", 8, 2, 2, 4, "needs to improve ths material", "Natalie Crofts  ", 60, "2012-13", "T1", "9/10/2011");
        ProfessorFeedback pfb55 = new ProfessorFeedback("Richard Davis", 7, 4, 2, 4.33, "not useful", "Lucius Guidi  ", 90, "2004-05", "T2", "27/9/2011");
        ProfessorFeedback pfb56 = new ProfessorFeedback("Harry A", 10, 5, 9, 8, " Friendly as stronger speedily by recurred.", "Ola Thill  ", -50, "2009-10", "T2", "20/2/2012");
        ProfessorFeedback pfb57 = new ProfessorFeedback("Harry B", 8, 5, 7, 6.67, "can be better", "Tillie Mahurin  ", -49, "2006-07", "T2", "30/11/2013");
        ProfessorFeedback pfb58 = new ProfessorFeedback("Charlie Mich", 2, 3, 10, 5, " Friendly as stronger speedily by recurred.", "Latia Griffen  ", 45, "2004-05", "T2", "2/7/2012");
        ProfessorFeedback pfb59 = new ProfessorFeedback("Alan Weater", 7, 6, 8, 7, "super heavy workload", "Shanon Colin  ", 64, "2011-12", "T2", "15/4/2012");
        ProfessorFeedback pfb60 = new ProfessorFeedback("Leb AA", 4, 2, 8, 4.67, "Improve him believe opinion offered met and end cheered forbade. ", "Camila Mcclintic  ", 61, "2009-10", "T2", "17/1/2010");
        ProfessorFeedback pfb61 = new ProfessorFeedback("Richard Davis", 6, 10, 6, 7.33, "best prof", "Hyman Parrent  ", 92, "2006-07", "T2", "29/1/2012");
        ProfessorFeedback pfb62 = new ProfessorFeedback("Harry A", 8, 6, 9, 7.67, "lousy", "Johana Choice  ", -11, "2005-06", "T2", "5/7/2013");
        ProfessorFeedback pfb63 = new ProfessorFeedback("Harry B", 6, 8, 7, 7, " Friendly as stronger speedily by recurred.", "Pandora Kuether  ", 7, "2005-06", "T1", "17/9/2011");
        ProfessorFeedback pfb64 = new ProfessorFeedback("Charlie Mich", 3, 7, 5, 5, "need to improve communication", "Hershel Enloe  ", 6, "2006-07", "T1", "5/12/2011");
        ProfessorFeedback pfb65 = new ProfessorFeedback("Alan Weater", 10, 9, 10, 9.67, "Improve him believe opinion offered met and end cheered forbade. ", "Jamie Stever  ", 9, "2013-14", "T1", "8/9/2011");
        ProfessorFeedback pfb66 = new ProfessorFeedback("Leb AA", 9, 3, 6, 6, "needs to improve ths material", "Johana Choice  ", -30, "2005-06", "T1", "25/5/2011");
        ProfessorFeedback pfb67 = new ProfessorFeedback("Richard Davis", 10, 5, 8, 7.67, "not useful", "Hershel Enloe  ", 9, "2009-10", "T2", "7/6/2010");
        ProfessorFeedback pfb68 = new ProfessorFeedback("Harry A", 8, 5, 7, 6.67, " Friendly as stronger speedily by recurred.", "Pandora Kuether  ", 88, "2004-05", "T1", "28/4/2013");
        ProfessorFeedback pfb69 = new ProfessorFeedback("Harry B", 3, 8, 8, 6.33, "can be better", "Pandora Kuether  ", 9, "2003-04", "T2", "27/3/2012");
        ProfessorFeedback pfb70 = new ProfessorFeedback("Charlie Mich", 5, 10, 7, 7.33, " Friendly as stronger speedily by recurred.", "Pandora Kuether  ", -21, "2007-08", "T2", "8/6/2012");
        ProfessorFeedback pfb71 = new ProfessorFeedback("Alan Weater", 8, 5, 6, 6.33, "Improve him believe opinion offered met and end cheered forbade. ", "Pansy Sanger  ", 53, "2011-12", "T2", "24/5/2011");
        ProfessorFeedback pfb72 = new ProfessorFeedback("Leb AA", 3, 4, 6, 4.33, ":)", "Latia Griffen  ", -6, "2003-04", "T2", "27/7/2013");

        profFeedbackList.add(pfb1);
        profFeedbackList.add(pfb2);
        profFeedbackList.add(pfb3);
        profFeedbackList.add(pfb4);
        profFeedbackList.add(pfb5);
        profFeedbackList.add(pfb6);
        profFeedbackList.add(pfb7);
        profFeedbackList.add(pfb8);
        profFeedbackList.add(pfb9);
        profFeedbackList.add(pfb10);
        profFeedbackList.add(pfb11);
        profFeedbackList.add(pfb12);
        profFeedbackList.add(pfb13);
        profFeedbackList.add(pfb14);
        profFeedbackList.add(pfb15);
        profFeedbackList.add(pfb16);
        profFeedbackList.add(pfb17);
        profFeedbackList.add(pfb18);
        profFeedbackList.add(pfb19);
        profFeedbackList.add(pfb20);
        profFeedbackList.add(pfb21);
        profFeedbackList.add(pfb22);
        profFeedbackList.add(pfb23);
        profFeedbackList.add(pfb24);
        profFeedbackList.add(pfb25);
        profFeedbackList.add(pfb26);
        profFeedbackList.add(pfb27);
        profFeedbackList.add(pfb28);
        profFeedbackList.add(pfb29);
        profFeedbackList.add(pfb30);
        profFeedbackList.add(pfb31);
        profFeedbackList.add(pfb32);
        profFeedbackList.add(pfb33);
        profFeedbackList.add(pfb34);
        profFeedbackList.add(pfb35);
        profFeedbackList.add(pfb36);
        profFeedbackList.add(pfb37);
        profFeedbackList.add(pfb38);
        profFeedbackList.add(pfb39);
        profFeedbackList.add(pfb40);
        profFeedbackList.add(pfb41);
        profFeedbackList.add(pfb42);
        profFeedbackList.add(pfb43);
        profFeedbackList.add(pfb44);
        profFeedbackList.add(pfb45);
        profFeedbackList.add(pfb46);
        profFeedbackList.add(pfb47);
        profFeedbackList.add(pfb48);
        profFeedbackList.add(pfb49);
        profFeedbackList.add(pfb50);
        profFeedbackList.add(pfb51);
        profFeedbackList.add(pfb52);
        profFeedbackList.add(pfb53);
        profFeedbackList.add(pfb54);
        profFeedbackList.add(pfb55);
        profFeedbackList.add(pfb56);
        profFeedbackList.add(pfb57);
        profFeedbackList.add(pfb58);
        profFeedbackList.add(pfb59);
        profFeedbackList.add(pfb60);
        profFeedbackList.add(pfb61);
        profFeedbackList.add(pfb62);
        profFeedbackList.add(pfb63);
        profFeedbackList.add(pfb64);
        profFeedbackList.add(pfb65);
        profFeedbackList.add(pfb66);
        profFeedbackList.add(pfb67);
        profFeedbackList.add(pfb68);
        profFeedbackList.add(pfb69);
        profFeedbackList.add(pfb70);
        profFeedbackList.add(pfb71);
        profFeedbackList.add(pfb72);

        session.setAttribute("profList", profList);
        session.setAttribute("modList", modList);
        session.setAttribute("profFeedback", profFeedbackList);
        session.setAttribute("modFeedback", modFeedbackList);

        response.sendRedirect("index.jsp");
    }

}

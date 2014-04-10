package src.process;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.model.Module;
import src.model.Professor;

/**
 * Servlet implementation class processSearch
 */
@WebServlet("/processSearch")
public class processSearch extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public processSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String radioValue = request.getParameter("optionRadio");
        String searchString = request.getParameter("searchString").toLowerCase();


        //create result arraylist and retrieve all the mods and profs.
        ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profList");
        ArrayList<Module> modList = (ArrayList<Module>) session.getAttribute("modList");
        ArrayList<Professor> profResultList = new ArrayList<Professor>();
        ArrayList<Module> modResultList = new ArrayList<Module>();
        
        if (radioValue.equals("prof")) {
            for (int i = 0; i < profList.size(); i++) {
                Professor p = profList.get(i);
                String profName = p.getName().toLowerCase();

                if (profName.contains(searchString)) {
                    profResultList.add(p);
                }
            }
            session.setAttribute("profResultList", profResultList);
            response.sendRedirect("profresult.jsp");
        } else {
            for (int i = 0; i < modList.size(); i++) {
                Module m = modList.get(i);
                String modName = m.getName().toLowerCase();
                String modCode = m.getCode().toLowerCase();

                if (modName.contains(searchString) || modCode.contains(searchString)) {
                    modResultList.add(m);
                }
            }
            session.setAttribute("modResultList", modResultList);
            response.sendRedirect("modresult.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}// end servlet

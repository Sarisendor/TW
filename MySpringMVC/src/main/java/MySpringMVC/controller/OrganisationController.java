package MySpringMVC.controller;

import MySpringMVC.dao.OrganisationDAO;
import MySpringMVC.model.Organisation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
public class OrganisationController {
    @Autowired
    private OrganisationDAO OrganisationDAO;

    @RequestMapping(value = "/viewOrganisation/{pageId}")
    public ModelAndView listOrganisation(ModelAndView model,@PathVariable Integer pageId) throws IOException {
        int total = 50;
        if(pageId == 1){
            model.addObject("pageId", pageId);
        }
        else {
            pageId = (pageId - 1) * total + 1;
            model.addObject("pageId", (pageId/total)+1);
        }
        List<Organisation> listOrganisation = OrganisationDAO.list(pageId, total);
        model.addObject("listOrganisation", listOrganisation);
        model.setViewName("OrganisationView");

        return model;
    }

    @RequestMapping(value = "/newOrganisation", method = RequestMethod.GET)
    public ModelAndView newOrganisation(ModelAndView model) {
        Organisation newOrganisation = new Organisation();
        model.addObject("Organisation", newOrganisation);
        model.setViewName("OrganisationForm");
        return model;
    }

    @RequestMapping(value = "/saveOrganisation", method = RequestMethod.POST)
    public ModelAndView saveOrganisation(@ModelAttribute Organisation Organisation) {
        OrganisationDAO.saveOrUpdate(Organisation);
        return new ModelAndView("redirect:/viewOrganisation/1");
    }

    @RequestMapping(value = "/deleteOrganisation", method = RequestMethod.GET)
    public ModelAndView deleteOrganisation(HttpServletRequest request) {
        int org_id = Integer.parseInt(request.getParameter("id"));
        OrganisationDAO.delete(org_id);
        return new ModelAndView("redirect:/viewOrganisation/1");
    }

    @RequestMapping(value = "/editOrganisation", method = RequestMethod.GET)
    public ModelAndView editOrganisation(HttpServletRequest request) {
        int org_id = Integer.parseInt(request.getParameter("id"));
        Organisation Organisation = OrganisationDAO.get(org_id);
        ModelAndView model = new ModelAndView("OrganisationForm");
        model.addObject("Organisation", Organisation);

        return model;
    }

}

package MySpringMVC.controller;

import MySpringMVC.dao.MunicipalityDAO;
import MySpringMVC.model.Municipality;

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
public class MunicipalityController {

    @Autowired
    private MunicipalityDAO MunicipalityDAO;

    @RequestMapping(value = "/viewMunicipality/{pageId}")
    public ModelAndView listMunicipality(ModelAndView model,@PathVariable Integer pageId) throws IOException {
        int total = 50;
        if(pageId == 1){
            model.addObject("pageId", pageId);
        }
        else {
            pageId = (pageId - 1) * total + 1;
            model.addObject("pageId", (pageId/total)+1);
        }
        List<Municipality> listMunicipality = MunicipalityDAO.list(pageId, total);
        model.addObject("listMunicipality", listMunicipality);
        model.setViewName("MunicipalityView");

        return model;
    }

    @RequestMapping(value = "/newMunicipality", method = RequestMethod.GET)
    public ModelAndView newMunicipality(ModelAndView model) {
        Municipality newMunicipality = new Municipality();
        model.addObject("Municipality", newMunicipality);
        model.setViewName("MunicipalityForm");
        return model;
    }

    @RequestMapping(value = "/saveMunicipality", method = RequestMethod.POST)
    public ModelAndView saveMunicipality(@ModelAttribute Municipality Municipality) {
        MunicipalityDAO.saveOrUpdate(Municipality);
        return new ModelAndView("redirect:/viewMunicipality/1");
    }

    @RequestMapping(value = "/deleteMunicipality", method = RequestMethod.GET)
    public ModelAndView deleteMunicipality(HttpServletRequest request) {
        int mun_id = Integer.parseInt(request.getParameter("id"));
        MunicipalityDAO.delete(mun_id);
        return new ModelAndView("redirect:/viewMunicipality/1");
    }

    @RequestMapping(value = "/editMunicipality", method = RequestMethod.GET)
    public ModelAndView editMunicipality(HttpServletRequest request) {
        int mun_id = Integer.parseInt(request.getParameter("id"));
        Municipality Municipality = MunicipalityDAO.get(mun_id);
        ModelAndView model = new ModelAndView("MunicipalityForm");
        model.addObject("Municipality", Municipality);

        return model;
    }

}

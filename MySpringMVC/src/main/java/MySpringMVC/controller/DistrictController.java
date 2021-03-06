package MySpringMVC.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import MySpringMVC.dao.DistrictDAO;
import MySpringMVC.model.District;

@Controller
public class DistrictController {

    @Autowired
    private DistrictDAO districtDAO;

    @RequestMapping(value = "/viewDistrict/{pageId}")
    public ModelAndView listDistrict(ModelAndView model,@PathVariable Integer pageId) throws IOException {
        int total = 50;
        if(pageId == 1){
            model.addObject("pageId", pageId);
        }
        else {
            pageId = (pageId - 1) * total + 1;
            model.addObject("pageId", (pageId/total)+1);
        }
        List<District> listDistrict = districtDAO.list(pageId, total);
        model.addObject("listDistrict", listDistrict);
        model.setViewName("DistrictView");

        return model;
    }

    @RequestMapping(value = "/newDistrict", method = RequestMethod.GET)
    public ModelAndView newDistrict(ModelAndView model) {
        District newDistrict = new District();
        model.addObject("district", newDistrict);
        model.setViewName("DistrictForm");
        return model;
    }

    @RequestMapping(value = "/saveDistrict", method = RequestMethod.POST)
    public ModelAndView saveDistrict(@ModelAttribute District district) {
        districtDAO.saveOrUpdate(district);
        return new ModelAndView("redirect:/viewDistrict/1");
    }

    @RequestMapping(value = "/deleteDistrict", method = RequestMethod.GET)
    public ModelAndView deleteDistrict(HttpServletRequest request) {
        int dis_id = Integer.parseInt(request.getParameter("id"));
        districtDAO.delete(dis_id);
        return new ModelAndView("redirect:/viewDistrict/1");
    }

    @RequestMapping(value = "/editDistrict", method = RequestMethod.GET)
    public ModelAndView editDistrict(HttpServletRequest request) {
        int dis_id = Integer.parseInt(request.getParameter("id"));
        District district = districtDAO.get(dis_id);
        ModelAndView model = new ModelAndView("DistrictForm");
        model.addObject("district", district);

        return model;
    }
}

package cn.xyvan.web.controller;

import cn.mithrandirw.tf.admin.commons.api.controller.admin.AdminController;
import cn.mithrandirw.tf.admin.commons.api.domain.ApiResponseEntity;
import cn.mithrandirw.tf.admin.commons.domain.Page;
import cn.mithrandirw.tf.utils.ValidationUtil;
import cn.xyvan.domain.entity.Train;
import cn.xyvan.domain.form.TrainForm;
import cn.xyvan.domain.vo.TrainVo;
import cn.xyvan.mapper.TrainMapper;
import cn.xyvan.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.Map;

/**
 * Train管理控制器
 *
 * @author yvan
 * @date 2019-03-27 00:53:13
 */
@Controller
@RequestMapping("/admin/train")
public class TrainController extends AdminController<Train, TrainVo, TrainForm> {

    @Autowired
    private TrainService trainService;

    @Autowired
    private TrainMapper trainMapper;

    @Override
    protected String getPageFolder() {
        return "train";
    }

    @Override
    @ResponseBody
    public ApiResponseEntity carefulDelete(@RequestParam Long id, String password) {
        boolean isPwdEqual = this.validateOperation(password);
        if (isPwdEqual) {
            this.trainMapper.deleteById(id);
            return ApiResponseEntity.buildOK();
        } else {
            return ApiResponseEntity.buildFailed("密码错误");
        }
    }

    @Override
    @ResponseBody
    public ApiResponseEntity<Void> update(HttpServletRequest request, @Valid TrainForm form, BindingResult result) {
        ValidationUtil.validate(result);
        Train t = this.form2Entity(form);
        t.setUpdatedTime(new Date());
        trainMapper.update(t);
        return ApiResponseEntity.buildOK();
    }

    @Override
    public String detail(Long id, HttpServletRequest request, Model model) {
        Train train = trainMapper.detail(id);
        TrainVo trainVo = this.entity2Vo(train, request);
        model.addAttribute("entity", trainVo);
        return this.getPageFolder() + "/detail";
    }

    @Override
    @ResponseBody
    public ApiResponseEntity create(HttpServletRequest request, @Valid TrainForm form, BindingResult result) {
        ValidationUtil.validate(result);
        Train entity = this.form2Entity(form);
        entity.setCreatedTime(new Date());
        entity.setUpdatedTime(new Date());
        entity.setDataState("Enable");
        int id = trainMapper.create(entity);
        return ApiResponseEntity.buildOK().setBody(id);
    }

    @Override
    @ResponseBody
    public ApiResponseEntity<Page<TrainVo>> pageList(HttpServletRequest request,
                                                     @RequestParam(required = false, defaultValue = "1") Integer pageNumber,
                                                     @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        Map<String, String[]> searchParams = request.getParameterMap();
        Page<Train> pageT = trainService.findPage(searchParams, pageNumber, pageSize);
        Page<TrainVo> pageV = this.entity2Vo(pageT, request);
        ApiResponseEntity<Page<TrainVo>> apiResponse = ApiResponseEntity.buildOK();
        return apiResponse.setBody(pageV);
    }
}

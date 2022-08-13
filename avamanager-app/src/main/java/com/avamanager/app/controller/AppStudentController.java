package com.avamanager.app.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.avamanager.common.annotation.Log;
import com.avamanager.common.core.controller.BaseController;
import com.avamanager.common.core.domain.AjaxResult;
import com.avamanager.common.enums.BusinessType;
import com.avamanager.app.domain.AppStudent;
import com.avamanager.app.service.IAppStudentService;
import com.avamanager.common.utils.poi.ExcelUtil;
import com.avamanager.common.core.page.TableDataInfo;

/**
 * 学生信息Controller
 * 
 * @author ruoyi
 * @date 2022-08-12
 */
@RestController
@RequestMapping("/app/student")
public class AppStudentController extends BaseController
{
    @Autowired
    private IAppStudentService appStudentService;

    /**
     * 查询学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppStudent appStudent)
    {
        startPage();
        List<AppStudent> list = appStudentService.selectAppStudentList(appStudent);
        return getDataTable(list);
    }

    /**
     * 导出学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('app:student:export')")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppStudent appStudent)
    {
        List<AppStudent> list = appStudentService.selectAppStudentList(appStudent);
        ExcelUtil<AppStudent> util = new ExcelUtil<AppStudent>(AppStudent.class);
        util.exportExcel(response, list, "学生信息数据");
    }

    /**
     * 获取学生信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:student:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") Long studentId)
    {
        return AjaxResult.success(appStudentService.selectAppStudentByStudentId(studentId));
    }

    /**
     * 新增学生信息
     */
    @PreAuthorize("@ss.hasPermi('app:student:add')")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppStudent appStudent)
    {
        return toAjax(appStudentService.insertAppStudent(appStudent));
    }

    /**
     * 修改学生信息
     */
    @PreAuthorize("@ss.hasPermi('app:student:edit')")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppStudent appStudent)
    {
        return toAjax(appStudentService.updateAppStudent(appStudent));
    }

    /**
     * 删除学生信息
     */
    @PreAuthorize("@ss.hasPermi('app:student:remove')")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable Long[] studentIds)
    {
        return toAjax(appStudentService.deleteAppStudentByStudentIds(studentIds));
    }
}

package com.avamanager.app.service.impl;

import java.util.List;
import com.avamanager.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.avamanager.app.mapper.AppStudentMapper;
import com.avamanager.app.domain.AppStudent;
import com.avamanager.app.service.IAppStudentService;

/**
 * 学生信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-08-12
 */
@Service
public class AppStudentServiceImpl implements IAppStudentService 
{
    @Autowired
    private AppStudentMapper appStudentMapper;

    /**
     * 查询学生信息
     * 
     * @param studentId 学生信息主键
     * @return 学生信息
     */
    @Override
    public AppStudent selectAppStudentByStudentId(Long studentId)
    {
        return appStudentMapper.selectAppStudentByStudentId(studentId);
    }

    /**
     * 查询学生信息列表
     * 
     * @param appStudent 学生信息
     * @return 学生信息
     */
    @Override
    public List<AppStudent> selectAppStudentList(AppStudent appStudent)
    {
        return appStudentMapper.selectAppStudentList(appStudent);
    }

    /**
     * 新增学生信息
     * 
     * @param appStudent 学生信息
     * @return 结果
     */
    @Override
    public int insertAppStudent(AppStudent appStudent)
    {
        appStudent.setCreateTime(DateUtils.getNowDate());
        return appStudentMapper.insertAppStudent(appStudent);
    }

    /**
     * 修改学生信息
     * 
     * @param appStudent 学生信息
     * @return 结果
     */
    @Override
    public int updateAppStudent(AppStudent appStudent)
    {
        appStudent.setUpdateTime(DateUtils.getNowDate());
        return appStudentMapper.updateAppStudent(appStudent);
    }

    /**
     * 批量删除学生信息
     * 
     * @param studentIds 需要删除的学生信息主键
     * @return 结果
     */
    @Override
    public int deleteAppStudentByStudentIds(Long[] studentIds)
    {
        return appStudentMapper.deleteAppStudentByStudentIds(studentIds);
    }

    /**
     * 删除学生信息信息
     * 
     * @param studentId 学生信息主键
     * @return 结果
     */
    @Override
    public int deleteAppStudentByStudentId(Long studentId)
    {
        return appStudentMapper.deleteAppStudentByStudentId(studentId);
    }
}

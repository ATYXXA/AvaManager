package com.avamanager.app.mapper;

import java.util.List;
import com.avamanager.app.domain.AppStudent;

/**
 * 学生信息Mapper接口
 * 
 * @author ruoyi
 * @date 2022-08-12
 */
public interface AppStudentMapper 
{
    /**
     * 查询学生信息
     * 
     * @param studentId 学生信息主键
     * @return 学生信息
     */
    public AppStudent selectAppStudentByStudentId(Long studentId);

    /**
     * 查询学生信息列表
     * 
     * @param appStudent 学生信息
     * @return 学生信息集合
     */
    public List<AppStudent> selectAppStudentList(AppStudent appStudent);

    /**
     * 新增学生信息
     * 
     * @param appStudent 学生信息
     * @return 结果
     */
    public int insertAppStudent(AppStudent appStudent);

    /**
     * 修改学生信息
     * 
     * @param appStudent 学生信息
     * @return 结果
     */
    public int updateAppStudent(AppStudent appStudent);

    /**
     * 删除学生信息
     * 
     * @param studentId 学生信息主键
     * @return 结果
     */
    public int deleteAppStudentByStudentId(Long studentId);

    /**
     * 批量删除学生信息
     * 
     * @param studentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppStudentByStudentIds(Long[] studentIds);
}

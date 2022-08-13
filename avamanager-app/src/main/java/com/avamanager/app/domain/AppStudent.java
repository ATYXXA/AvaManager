package com.avamanager.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.avamanager.common.annotation.Excel;
import com.avamanager.common.core.domain.BaseEntity;

/**
 * 学生信息对象 app_student
 * 
 * @author ruoyi
 * @date 2022-08-12
 */
public class AppStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生ID */
    private Long studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 学号 */
    @Excel(name = "学号")
    private String studentNumber;

    /** 学院ID */
    @Excel(name = "学院ID")
    private Long collegeId;

    /** 专业ID */
    @Excel(name = "专业ID")
    private Long majorId;

    /** 年级 */
    @Excel(name = "年级")
    private String grade;

    /** 行政班 */
    @Excel(name = "行政班")
    private String administrativeClass;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /** 民族 */
    @Excel(name = "民族")
    private String nation;

    /** political面貌 */
    @Excel(name = "political面貌")
    private String politicalOutlook;

    /** 生源地 */
    @Excel(name = "生源地")
    private String origin;

    /** 学生状态 0-正常在校 1-休学 2-毕业 3-转学 */
    @Excel(name = "学生状态 0-正常在校 1-休学 2-毕业 3-转学")
    private Long studentStatus;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }
    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }
    public void setStudentNumber(String studentNumber) 
    {
        this.studentNumber = studentNumber;
    }

    public String getStudentNumber() 
    {
        return studentNumber;
    }
    public void setCollegeId(Long collegeId) 
    {
        this.collegeId = collegeId;
    }

    public Long getCollegeId() 
    {
        return collegeId;
    }
    public void setMajorId(Long majorId) 
    {
        this.majorId = majorId;
    }

    public Long getMajorId() 
    {
        return majorId;
    }
    public void setGrade(String grade) 
    {
        this.grade = grade;
    }

    public String getGrade() 
    {
        return grade;
    }
    public void setAdministrativeClass(String administrativeClass) 
    {
        this.administrativeClass = administrativeClass;
    }

    public String getAdministrativeClass() 
    {
        return administrativeClass;
    }
    public void setBirthday(Date birthday) 
    {
        this.birthday = birthday;
    }

    public Date getBirthday() 
    {
        return birthday;
    }
    public void setNation(String nation) 
    {
        this.nation = nation;
    }

    public String getNation() 
    {
        return nation;
    }
    public void setPoliticalOutlook(String politicalOutlook) 
    {
        this.politicalOutlook = politicalOutlook;
    }

    public String getPoliticalOutlook() 
    {
        return politicalOutlook;
    }
    public void setOrigin(String origin) 
    {
        this.origin = origin;
    }

    public String getOrigin() 
    {
        return origin;
    }
    public void setStudentStatus(Long studentStatus) 
    {
        this.studentStatus = studentStatus;
    }

    public Long getStudentStatus() 
    {
        return studentStatus;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("studentNumber", getStudentNumber())
            .append("collegeId", getCollegeId())
            .append("majorId", getMajorId())
            .append("grade", getGrade())
            .append("administrativeClass", getAdministrativeClass())
            .append("birthday", getBirthday())
            .append("nation", getNation())
            .append("politicalOutlook", getPoliticalOutlook())
            .append("origin", getOrigin())
            .append("studentStatus", getStudentStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}

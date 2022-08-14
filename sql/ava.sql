# 本文件是新版管理系统业务相关sql

-- ----------------------------
-- 1、学生表
-- ----------------------------
drop table if exists app_student;
create table ry.app_student (
                          student_id           bigint(20)      not null auto_increment    comment '学生ID',
                          student_name         varchar(30)     not null                   comment '学生姓名',
                          student_number         varchar(30)     not null                   comment '学号',
                          student_sex         char(1)         default '2'                comment '性别',
                          user_id           bigint(20)      not null auto_increment    comment '用户ID',
                          dept_id           bigint(20)      default null                 comment '专业ID',
                          grade               varchar(30)     default null                comment '年级',
                          administrative_class varchar(128) default null               comment '行政班',
                          birthday          datetime        default null                comment '出生日期',
                          nation           varchar(64)      null                        comment '民族',
                          political_outlook varchar(64)     null                        comment '政治面貌',
                          origin             varchar(64)      null                        comment '生源地',
                          student_status    tinyint         default 0 null             comment '学生状态',
                          create_by         varchar(64)     default ''                 comment '创建者',
                          create_time       datetime                                   comment '创建时间',
                          update_by         varchar(64)     default ''                 comment '更新者',
                          update_time       datetime                                   comment '更新时间',
                          remark            varchar(500)    default null               comment '备注',
                          primary key (student_id)
) engine=innodb auto_increment=100 comment = '学生信息表';

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息', '5', '1', 'student', 'app/student/index', 1, 0, 'C', '0', '0', 'app:student:list', '#', 'admin', sysdate(), '', null, '学生信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:student:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:student:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:student:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:student:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:student:export',       '#', 'admin', sysdate(), '', null, '');



# -- ----------------------------
# -- 2、学院表
# -- ----------------------------
# drop table if exists app_college;
# create table ry.app_student_college (
#                                         college_id           bigint(20)      not null auto_increment    comment '学院ID',
#                                         college_name         varchar(30)     not null                   comment '学院名称',
#                                         leader            varchar(20)     default null               comment '负责人',
#                                         phone             varchar(11)     default null               comment '联系电话',
#                                         email             varchar(50)     default null               comment '邮箱',
#                                         create_by         varchar(64)     default ''                 comment '创建者',
#                                         create_time       datetime                                   comment '创建时间',
#                                         update_by         varchar(64)     default ''                 comment '更新者',
#                                         update_time       datetime                                   comment '更新时间',
#                                         remark            varchar(500)    default null               comment '备注',
#                                         primary key (college_id)
# ) engine=innodb auto_increment=200 comment = '学院信息表';
#
# -- 菜单 SQL
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息', '2019', '1', 'college', 'app/college/index', 1, 0, 'C', '0', '0', 'app:college:list', '#', 'admin', sysdate(), '', null, '学院信息菜单');
#
# -- 按钮父菜单ID
# SELECT @parentId := LAST_INSERT_ID();
#
# -- 按钮 SQL
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:college:query',        '#', 'admin', sysdate(), '', null, '');
#
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:college:add',          '#', 'admin', sysdate(), '', null, '');
#
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:college:edit',         '#', 'admin', sysdate(), '', null, '');
#
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:college:remove',       '#', 'admin', sysdate(), '', null, '');
#
# insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
# values('学院信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:college:export',       '#', 'admin', sysdate(), '', null, '');
#
# -- ----------------------------
# -- 3、学生专业关联表 学生N-1专业
# -- ----------------------------
# drop table if exists app_student_college;
# create table ry.app_student_college (
#                                         student_id           bigint(20)      not null    comment '学生ID',
#                                         major_id           bigint(20)      not null    comment '专业ID',
#                                         primary key (student_id ,major_id)
# ) engine=innodb comment = '学生学院关联表 学生N-1学院';
#
# -- ----------------------------
# -- 4、专业表
# -- ----------------------------
# drop table if exists app_major;
# create table ry.app_major (
#                               major_id           bigint(20)      not null auto_increment    comment '专业ID',
#                               major_name         varchar(30)     not null                   comment '专业名称',
#                               college_id           bigint(20)      not null                  comment '所属学院ID',
#                               create_by         varchar(64)     default ''                 comment '创建者',
#                               create_time       datetime                                   comment '创建时间',
#                               update_by         varchar(64)     default ''                 comment '更新者',
#                               update_time       datetime                                   comment '更新时间',
#                               remark            varchar(500)    default null               comment '备注',
#                               primary key (major_id)
# ) engine=innodb auto_increment=300 comment = '专业信息表';


-- ----------------------------
-- 5、家长表
-- ----------------------------
drop table if exists app_parent;
create table ry.app_parent (
                                parent_id           bigint(20)      not null auto_increment    comment '学生ID',
                                parent_name         varchar(30)     not null                   comment '学生姓名',
                                parent_sex         char(1)         default '2'                comment '性别',
                                nation           varchar(64)      null                        comment '民族',
                                relation           varchar(64)      null                        comment '关系',
                                workplace           varchar(64)      null                        comment '工作单位',
                                job           varchar(64)      null                        comment '职业',
                                political_outlook varchar(64)     null                        comment '政治面貌',
                                origin             varchar(64)      null                        comment '籍贯',
                                create_by         varchar(64)     default ''                 comment '创建者',
                                create_time       datetime                                   comment '创建时间',
                                update_by         varchar(64)     default ''                 comment '更新者',
                                update_time       datetime                                   comment '更新时间',
                                remark            varchar(500)    default null               comment '备注',
                                primary key (student_id)
) engine=innodb auto_increment=100 comment = '家长信息表';

-- ----------------------------
-- 6、教师表
-- ----------------------------
drop table if exists app_student;
create table ry.app_student (
                                student_id           bigint(20)      not null auto_increment    comment '学生ID',
                                student_name         varchar(30)     not null                   comment '学生姓名',
                                student_number         varchar(30)     not null                   comment '学号',
                                student_sex         char(1)         default '2'                comment '性别',
                                user_id           bigint(20)      not null auto_increment    comment '用户ID',
                                dept_id           bigint(20)      default null                 comment '专业ID',
                                grade               varchar(30)     default null                comment '年级',
                                administrative_class varchar(128) default null               comment '行政班',
                                birthday          datetime        default null                comment '出生日期',
                                nation           varchar(64)      null                        comment '民族',
                                political_outlook varchar(64)     null                        comment '政治面貌',
                                origin             varchar(64)      null                        comment '生源地',
                                student_status    tinyint         default 0 null             comment '学生状态',
                                create_by         varchar(64)     default ''                 comment '创建者',
                                create_time       datetime                                   comment '创建时间',
                                update_by         varchar(64)     default ''                 comment '更新者',
                                update_time       datetime                                   comment '更新时间',
                                remark            varchar(500)    default null               comment '备注',
                                primary key (student_id)
) engine=innodb auto_increment=100 comment = '学生信息表';
# 原版
create table ry.student
(
    student_id int auto_increment comment '字段编号'
        primary key,
    student_number varchar(64) not null comment '学号',
    student_name varchar(64) null comment '学生姓名',
    major_id varchar(128) null comment '专业',
    college_id varchar(128) null comment '学院',
    specialty varchar(128) null comment '专业方向',
    grade varchar(64) null comment '年级',
    administrative_class varchar(128) null comment '行政班',
    birthday datetime null comment '出生日期',
    nation varchar(64) null comment '民族',
    political_outlook varchar(64) null comment 'political面貌',
    origin varchar(64) null comment '生源地',
    status tinyint default 0 null comment '学生状态 0-正常在校 1-休学 2-毕业 3-转学',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    constraint student_student_id_uindex
        unique (student_id)
);

create table ry.parent
(
    id int auto_increment comment '字段编号'
        primary key,
    student_id varchar(64) not null comment '学号' on cascade update ,
    student_name varchar(64) null comment '学生姓名',
    parent_name varchar(64) null comment '家长姓名',
    relation varchar(64) null comment '关系',
    workplace varchar(256) null comment '工作单位',
    job varchar(64) null comment '职业',
    address varchar(256) null comment '联系地址',
    phone varchar(128) null comment '电话',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    constraint student_student_id_uindex
        unique (student_id),
    foreign key (student_id) references student(student_id) on update cascade,
    foreign key (student_name) references student(student_name) on update cascade,
);

create table ry.teacher
(
    id int auto_increment comment '字段编号'
        primary key,
    teacher_id varchar(64) not null comment '教工号',
    teacher_name varchar(64) null comment '学生姓名',
    college varchar(128) null comment '学院',
    birthday datetime null comment '出生日期',
    nation varchar(64) null comment '民族',
    political_outlook varchar(64) null comment 'political面貌',
    origin varchar(64) null comment '籍贯',
    status tinyint default 0 null comment '教师状态 0-正常在职 1-休假 2-因公出差 3-已离职',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    constraint student_student_id_uindex
        unique (teacher_id)
);


create table ry.course
(
    id int auto_increment comment '字段编号'
        primary key,
    course_id varchar(64) not null comment '课程号',
    course_name varchar(64) null comment '课程名',
    college varchar(128) null comment '开设学院',
    major varchar(128) null comment '开设专业',
    year varchar(64) null comment '学年',
    semester tinyint null comment '学期',
    class varchar(128) null comment '开设班级',
    class_hour int null comment '学时',
    credit numeric(2,1) null comment '学分',
    property tinyint null comment '课程性质 0-必修课 1-选修课',
    category tinyint null comment '课程类别 0-公共课 1-专业课 2-实践课 3-通选课',
    teacher_id varchar(64) null comment '任课老师编号',
    teacher_name varchar(64) null comment '任课老师姓名',
    ascription tinyint null comment '通选课课程归属 0-社会科学核心 1-人文科学核心 2-社会科学 3-人文科学 4-科学技术核心 5-科学技术',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    foreign key (teacher_id) references teacher(teacher_id) on update cascade,
    foreign key (teacher_name) references teacher(teacher_name) on update cascade,
);

create table ry.score
(
    id int auto_increment comment '字段编号'
        primary key,
    student_id varchar(64) not null comment '学号',
    student_name varchar(64) null comment '学生姓名',
    course_id varchar(64) not null comment '课程号',
    course_name varchar(64) null comment '课程名',
    college varchar(128) null comment '开设学院',
    major varchar(128) null comment '开设专业',
    year varchar(64) null comment '学年',
    semester tinyint null comment '学期',
    class varchar(128) null comment '开设班级',
-- 	class_hour int null comment '学时',
-- 	credit numeric(2,1) null comment '学分',
-- 	property tinyint null comment '课程性质 0-必修课 1-选修课',
    test_category tinyint null comment '考试类型 0-闭卷考试 1-开卷考试 2-实践 3-论文',
-- 	ascription tinyint null comment '通选课课程归属 0-社会科学核心 1-人文科学核心 2-社会科学 3-人文科学 4-科学技术核心 5-科学技术',
    score int null comment '成绩',
    rank int null comment '教学班排名',
    gpa numeric(2,1) null comment '绩点',
    status tinyint null comment '成绩是否有效 0-有效 1-作废',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    foreign key (student_id) references student(student_id) on update cascade,
    foreign key (student_name) references student(student_name) on update cascade,
);

create table ry.score
(
    id int auto_increment comment '字段编号'
        primary key,
    student_id varchar(64) not null comment '学号',
    student_name varchar(64) null comment '学生姓名',
    school_before varchar(128) null comment '原学校',
    college_before varchar(128) null comment '原学院',
    grade_before varchar(64) null comment '原年级',
    class_before varchar(128) null comment '原班级',
    change_time datetime null comment '变动时间',
    change_reason varchar(1024) null comment '变动原因',
    change_description varchar(1024) null comment '具体变动描述',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_delete tinyint default 0 null comment '逻辑删除 0-未删除 1-已删除',
    constraint student_student_id_uindex
        unique (student_id),
    foreign key (student_id) references student(student_id) on update cascade,
    foreign key (student_name) references student(student_name) on update cascade,
);
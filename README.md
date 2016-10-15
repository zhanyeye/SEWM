﻿# SEWM

2016.10.15
------------------------------
修复将已分配监考置为已完成bug。原已分配从学期基点计算，致使对补考监考无效，先从基点时间减20天计算     
自动创建数据库，部署时无需在数据库中预先创建schema   
首页浏览器版本低于IE8时，显示警告  
将基点时间basedate保存在properties，增加properties操作，保存基于JDK完成。Spring仅提供了读取操作，没有提供封装好的保存操作？   
???增加基点时间限制选择周一，超级管理员设置？管理员设置？     
重写导入监考表格信息实现，导入时依然基于监考教室及时间判断是否存在，存在则赋给ID值，人数变化则置监考信息状态为未分配，
保存提交时，使用merge方法，对原信息记录不做修改，即，原监考需1人，已分配已通知，再次导入后时间地点不变，人数变为2人，
保存后，监考状态为未分配，但保留原分配记录，重新分配仅需通知1人即可      

    
2016.07.22
----------------------------

增加监考提醒“今日”“明日”时间判断   
阿里大鱼再一次修改参数规范，参数值不能大于15个字符，第800次修改短信模板   
重构监考状态：未分配，已分配，已完成
每监考分配添加监考消息状态：已通知，已提醒    
    
修改监考分配实现，当分配发生变化时，对比原记录更新，原为全部删除重建   
例如，原分配已经发送短信，则无需重复发送也能保有发送记录    
修改监考编辑实现，当监考人数发生变化时，置监考为未分配状态，但保留原记录，直至重新分配  
    
增加监考详细信息页面   
增加Cookie登录，重新登录   
等   

2016.05.28
--------------------------------------
明日监考提醒发送后，置监考为已提醒状态，防止重复发送       
置完成状态时，搜索时间段内已提醒状态和已分配状态    
将单一监考信息分解，允许同一监考，1人分配2次，避免创建修改新监考信息    
导入监考表格时，提供选择阶段功能，在备注/课程后自动追加"阶段"字样   


2016.05.10
--------------------------------------
修复读取课表时，试图2次读取流的错误   
在监考列表添加监考分配时间  
修改监考表格读取，增加监考起止时间分别在2个段的处理   

2016.05.08 Update
--------------------------------------
左边侧栏功能过多，取消固定设置   
监考信息按监考时间排序，利于分配时先分配最近的监考，按监考状态分别列出？  
优化页面显示数据，在监考列表中添加星期与周数  
通过设置监考日期第一天属性为星期一，修复周日监考周数计算错误   
添加导出监考信息表格       
优化资源操作   
优化上传文件分析，基于流分析，取消生成本地文件减少IO操作  
等   
    
2016.04.14 Update
--------------------------------------
修改form横向尺寸    
为节约成本，在修改监考人员后应仅向新增加人员发送短信通知，因此分离发送监考通知短信，允许管理员手动确认发送对象  
优化课表信息提取表达式   
取消headers fixed属性，flat-ui switch在header为fixed时，在md宽度超过一屏滚动产生bug，在sm宽度正常     
增加分页    
增加监考短信提醒，无服务器，timer无法运行，暂时基于手动    


2016.03.01 Update
--------------------------------------
未完成：通知短信模板；教师详细信息查询；   
完成：文件上传下载；文件任务类型；单一文件版本控制；   
重新规划工程结构   

2016.02-18 Update
--------------------------------------
课表导入
监考导入
手动添加监考
手动添加特殊监考
监考推荐
监考分配
监考分配短信发送

已完成监考模块主要功能

2016.02.07 Update
------------------------------------
完成admin用户的添加，用户基本信息、权限、通知、推荐的修改及设置  
基于后台数据的checkbox默认状态
默认基于正序的获取  
自定义异常  
修改课表等实体类
文件上传  
读取课表，封装为实体对象，保存
基于enum的常量设计
  

2016.02.01 Update
------------------------
GenericDao: 使用反射获取子类声明的具体泛型类型，使子类无需传入泛型类型参数  
JSON: 基于gson.jar，spring自动完成对象到json字符串的转化，前端ajax返回类型使用text接收json字符串，然后转为json对象  
浏览工程根目录时映射到main，便于当作首页保存，支持拦截器  

Development Environment
-----------------------------------
Server: Tomcat(8.0.26)  
Database: MySQL(5.6)  
Persistence Layer: JPA; Hibernate(5.0.1)  
Business Layer: Spring(4.2.1)  
Controller Layer: SpringMVC  
UI: AJAX; JQuery(2.1.4); Bootstrap(3.3.5); Flat-ui; DateTime Picker

Others  
----------
JSTL
POI
dom4j

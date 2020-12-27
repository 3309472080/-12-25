-----练习1
1.1
select * from emp;
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

1.2
select empno,ename,job,sal,deptno
from emp;

-----练习2
2.1
select sal*1.2
from emp;

2.2
select (sal*6)+(sal*1.2*6) as 年薪
from emp;

-----练习3
3.1
select ename as 员工姓名,sal as 工资收入,nvl(comm,0) as 奖金收入,(sal*6)+(sal*1.2*6)+nvl(comm,0) as 总收入
from emp;

-----练习4
4.1
select ename ||'的第一年总收入'||((sal*6)+(sal*1.2*6)+nvl(comm,0)) as 总收入
from emp;

4.2
select distinct job
from emp;

------------------------------------------------------------------------
-----练习1
1.1
select empno,job,hiredate
from emp
where job = 'SALESMAN';

1.2
select ename, hiredate
from emp
where hiredate < to_date('31-12-1985','dd-mm-yyyy');

1.3
select ename ,deptno
from emp
where deptno <> 10;

-----练习2
2.1
select ename , hiredate
from emp
where hiredate BETWEEN to_date('1982','yyyy')AND to_date('1985','yyyy');

2.2
select ename ,sal
from emp
where sal BETWEEN 3000 AND 5000;

2.3
select ename ,deptno
from emp
where deptno BETWEEN 10 AND 20;

2.4
select ename mgr 
from emp
where mgr IN (7902,7566,7788);

-----练习3
3.1
select ename
from emp
where ename Like 'W%';

3.2
select ename 
from emp
where ename Like '%T_';

3.3
select ename ,comm
from emp 
where comm is NULL;

-----练习4
4.1
select ename, job, sal
from emp
where sal > 2000
AND (job = 'MANAGER'
or job = 'SALESMAN');

4.2
select ename, job, sal
from emp
where sal > 2000
AND (job = 'MANAGER'
or job = 'SALESMAN');

4.3
select ename,deptno,sal
from emp
where deptno <> 30
AND (sal  BETWEEN 3000 AND 5000);

4.4
select ename , hiredate ,job
from emp
where hiredate BETWEEN to_date('01-01-1981','dd-mm-yyyy') and to_date('31-12-1981','dd-mm-yyyy')
AND job Like('SALES%');

4.5
select ename ,job , deptno
from emp
where (job = 'SALESMAN'
or job = 'MANAGER')
AND(deptno = 10
or deptno = 20);

-----练习5

1.根据列名排序
-----数字降序排序
select * 
from emp
order by sal desc;

------根据列的别名排序
select * 
from emp
order by ename desc;


------根据查询结果中列的序号排序
select empno ,ename,job,sal,comm 
from emp
order by 1 desc;

------处理多个列来排序NULL
select empno ,ename,job,sal,comm ,deptno
from emp
order by 6，2;----先根据6对应的deptno排序，再在部门内部根据2对应的ename排序


-------排序时null值的处理
升序最后，降序最前
select empno ,ename,job,sal,comm ，deptno
from emp
order by 6 asc , 5 desc;

------根据日期排序
select ename ,hiredate 
from emp
order by 2;

--------
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where deptno = '30'
order by 6 desc,2 asc;







------lower----转换小写
select lower('ABCDE')
from dual;

------UPPER----转换大写
select upper('abcde')
from dual;

------INITCAP----把单词首字母转换成大写
select initcap('oycp oyyyyy')
from dual;

-------CONCAT--------拼接字符串，把两个参数拼接起来
select concat(ename,sal)
from emp;

-------SUBSTR-------第一个参数是要截取的数据源，第二个参数是从哪里开始截取，第三个参数是截取多少个字符
---------------------注意：第二个参数可以是负数，表示自右开始截取，但是截取的方向都是往右
select substr('abcdefg',1,3)
from dual;

select substr('abcdefg',3,2)------cd
from dual;

select substr('abcdefg',-3,2)-----ef
from dual;

------LENGTH---------获取字符串的长度
select length('abcdefg')
from dual;

------INSTR---------索引
select instr('abcdefg','c')---3
from dual;

-------LPAD----左填充
select lpad('abc',11,'*')
from dual;

-------RPAD----右填充
select rpad('abc',11,'*')
from dual;


-------REPLACE-----替换
select replace('abcdef','c','p')----abpdef
from dual;

------TRIM----删除,只能删除前面和后面的数据
select trim('c' from 'abcdefccccccccc')
from dual;

查询员工姓名中包含大写或小写字母A的员工的姓名
select ename 
from emp
where ename Like('A%')
or ename LIke ('a');

select deptno











数值函数
------------round------四舍五入第n位
select round(12.4846,2)
from dual;

------------trunc------截断第n位
select trunc(12.4846,2)
from dual;

------------MOD------取余
select mod(1600,300)
from dual;


转换函数

-------------转换成字符串
select to_char(hiredate,'MM/YYYY')
from emp;

select to_char(sal,'L99,999')
from emp;

select to_NUMBER('￥800','L99.999')
from dual;

select to_char(sysdate,'YYYY-MM-DD HH:mm:SS')
from dual;



通用函数
select nvl2(comm,'有奖金','无奖金')
from emp
========================================================================================================================
第四章

------练习1
select initcap(ename) as 雇员姓名, length(ename) as 名字长度
from emp
where substr(ename,1,1) = 'A'
or substr(ename,1,1) = 'J'
or substr(ename,1,1) = 'M'
order by 1 asc;

------练习2
2.1
select ename 
from emp
where ename Like('A%')
or ename LIke ('a%');

2.2
select ename,hiredate,deptno
from emp
where (deptno = 10
or deptno = 20)
AND hiredate >to_date('1981/5/1','YYYY/MM/DD')
AND ename Like '%A%'; 

2.3
select concat(concat(rpad(empno,'10','*'),rpad(ename,'10','*')),lpad(sal,'10','*'))
from emp;

------练习3
3.1
select round(100.456,2),round(100.456,1),round(100.456)
from dual;

3.2
select trunc(100.456,2),trunc(100.456,1),trunc(100.456)
from dual;

-----练习4
4.1
select ename ,round((sysdate-hiredate)) as 天
from emp;

-----练习5
5.1
select sysdate
from dual;

5.2
select ename ,months_between(to_date('2020/01/01','YYYY/MM/DD'),hiredate)工作月数,extract(month from hiredate) 入职月数,deptno
from emp
where deptno BETWEEN 10 AND 20

5.3
select ename,hiredate 入职日期,add_months(hiredate, 6) 转正日期,next_day(hiredate ,'星期一'),last_day(hiredate)
from emp

-----练习6
6.1
select to_char(sysdate,'YYYY-MM-DD HH:mm:SS')
from dual;

6.2
select ename,hiredate,to_char(hiredate , 'DAY') as DAY
from emp;

6.3
select ename,sal,to_char(sal,'L99,999.99') as 工资
from emp;

6.4
select to_date('2015-03-18 13:13:13','YYYY-MM-DD HH:mm:ss')
from emp
-----课后作业
1
select round((sysdate-to_date('2000/01/01','YYYY/MM/DD'))/7) WEEKS,round((sysdate-to_date('2000/01/01','YYYY/MM/DD'))/30) months
from dual;

2
select ename
from emp
where ename Like '__A%';

3
select trim('h' from 'hello') ello,trim(' ' from '  Hello') Hello,trim('b' from 'bllb') bllb,trim(' ' from 'hello  ') hello
from dual;

4
select ename ,to_char(sal,'99,999.00')|| ' RMB'
from emp

5
select ename, decode(mgr,
7839,'7839',
7782,'7782',
7698,'7698',
7902,'7902',
7566,'7566',
7788,'7788',
'No Manager') 经理编号
from emp;

方法二

select ename, nvl(to_char(mgr),'No Manager')-----数据类型要一致
from emp

6
select ename ,to_char(hiredate ,'MM/YYYY') 月份年份
from emp

7
select ename,sal,
case
when sal < 1000 then 0
when sal >=1000 and sal < 2000 then sal*0.1
when sal >=2000 and sal <3000 then sal*0.15
when sal >=3000 then sal*0.2
else 0
end 应交税款
from emp;

8
select ename ,lpad(sal,15,'$') SALARY
from emp

-----��ϰ1
1.1
select * from emp;
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

1.2
select empno,ename,job,sal,deptno
from emp;

-----��ϰ2
2.1
select sal*1.2
from emp;

2.2
select (sal*6)+(sal*1.2*6) as ��н
from emp;

-----��ϰ3
3.1
select ename as Ա������,sal as ��������,nvl(comm,0) as ��������,(sal*6)+(sal*1.2*6)+nvl(comm,0) as ������
from emp;

-----��ϰ4
4.1
select ename ||'�ĵ�һ��������'||((sal*6)+(sal*1.2*6)+nvl(comm,0)) as ������
from emp;

4.2
select distinct job
from emp;

------------------------------------------------------------------------
-----��ϰ1
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

-----��ϰ2
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

-----��ϰ3
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

-----��ϰ4
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

-----��ϰ5

1.������������
-----���ֽ�������
select * 
from emp
order by sal desc;

------�����еı�������
select * 
from emp
order by ename desc;


------���ݲ�ѯ������е��������
select empno ,ename,job,sal,comm 
from emp
order by 1 desc;

------��������������NULL
select empno ,ename,job,sal,comm ,deptno
from emp
order by 6��2;----�ȸ���6��Ӧ��deptno�������ڲ����ڲ�����2��Ӧ��ename����


-------����ʱnullֵ�Ĵ���
������󣬽�����ǰ
select empno ,ename,job,sal,comm ��deptno
from emp
order by 6 asc , 5 desc;

------������������
select ename ,hiredate 
from emp
order by 2;

--------
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where deptno = '30'
order by 6 desc,2 asc;







------lower----ת��Сд
select lower('ABCDE')
from dual;

------UPPER----ת����д
select upper('abcde')
from dual;

------INITCAP----�ѵ�������ĸת���ɴ�д
select initcap('oycp oyyyyy')
from dual;

-------CONCAT--------ƴ���ַ���������������ƴ������
select concat(ename,sal)
from emp;

-------SUBSTR-------��һ��������Ҫ��ȡ������Դ���ڶ��������Ǵ����￪ʼ��ȡ�������������ǽ�ȡ���ٸ��ַ�
---------------------ע�⣺�ڶ������������Ǹ�������ʾ���ҿ�ʼ��ȡ�����ǽ�ȡ�ķ���������
select substr('abcdefg',1,3)
from dual;

select substr('abcdefg',3,2)------cd
from dual;

select substr('abcdefg',-3,2)-----ef
from dual;

------LENGTH---------��ȡ�ַ����ĳ���
select length('abcdefg')
from dual;

------INSTR---------����
select instr('abcdefg','c')---3
from dual;

-------LPAD----�����
select lpad('abc',11,'*')
from dual;

-------RPAD----�����
select rpad('abc',11,'*')
from dual;


-------REPLACE-----�滻
select replace('abcdef','c','p')----abpdef
from dual;

------TRIM----ɾ��,ֻ��ɾ��ǰ��ͺ��������
select trim('c' from 'abcdefccccccccc')
from dual;

��ѯԱ�������а�����д��Сд��ĸA��Ա��������
select ename 
from emp
where ename Like('A%')
or ename LIke ('a');

select deptno











��ֵ����
------------round------���������nλ
select round(12.4846,2)
from dual;

------------trunc------�ضϵ�nλ
select trunc(12.4846,2)
from dual;

------------MOD------ȡ��
select mod(1600,300)
from dual;


ת������

-------------ת�����ַ���
select to_char(hiredate,'MM/YYYY')
from emp;

select to_char(sal,'L99,999')
from emp;

select to_NUMBER('��800','L99.999')
from dual;

select to_char(sysdate,'YYYY-MM-DD HH:mm:SS')
from dual;



ͨ�ú���
select nvl2(comm,'�н���','�޽���')
from emp
========================================================================================================================
������

------��ϰ1
select initcap(ename) as ��Ա����, length(ename) as ���ֳ���
from emp
where substr(ename,1,1) = 'A'
or substr(ename,1,1) = 'J'
or substr(ename,1,1) = 'M'
order by 1 asc;

------��ϰ2
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

------��ϰ3
3.1
select round(100.456,2),round(100.456,1),round(100.456)
from dual;

3.2
select trunc(100.456,2),trunc(100.456,1),trunc(100.456)
from dual;

-----��ϰ4
4.1
select ename ,round((sysdate-hiredate)) as ��
from emp;

-----��ϰ5
5.1
select sysdate
from dual;

5.2
select ename ,months_between(to_date('2020/01/01','YYYY/MM/DD'),hiredate)��������,extract(month from hiredate) ��ְ����,deptno
from emp
where deptno BETWEEN 10 AND 20

5.3
select ename,hiredate ��ְ����,add_months(hiredate, 6) ת������,next_day(hiredate ,'����һ'),last_day(hiredate)
from emp

-----��ϰ6
6.1
select to_char(sysdate,'YYYY-MM-DD HH:mm:SS')
from dual;

6.2
select ename,hiredate,to_char(hiredate , 'DAY') as DAY
from emp;

6.3
select ename,sal,to_char(sal,'L99,999.99') as ����
from emp;

6.4
select to_date('2015-03-18 13:13:13','YYYY-MM-DD HH:mm:ss')
from emp
-----�κ���ҵ
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
'No Manager') ������
from emp;

������

select ename, nvl(to_char(mgr),'No Manager')-----��������Ҫһ��
from emp

6
select ename ,to_char(hiredate ,'MM/YYYY') �·����
from emp

7
select ename,sal,
case
when sal < 1000 then 0
when sal >=1000 and sal < 2000 then sal*0.1
when sal >=2000 and sal <3000 then sal*0.15
when sal >=3000 then sal*0.2
else 0
end Ӧ��˰��
from emp;

8
select ename ,lpad(sal,15,'$') SALARY
from emp

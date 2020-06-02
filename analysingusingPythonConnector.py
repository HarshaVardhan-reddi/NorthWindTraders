import mysql.connector as mc

con = mc.connect(host='localhost',username='root',password='Harsha@1234')
cur = con.cursor()
cur.execute('use datagrokrpvt')
try:
    query = ''' select productname from products where unitprice > (select avg(unitprice) from products)'''
    cur.execute(query)
    print("(i) products having cost above the average price : ")
    print(" ")
    for name in cur:
        print(name)
    print("\n")
    print("(ii) Total number of sales of employees greater than 70 : ")
    query = '''select * from (select e.EmployeeID,concat(FirstName,' ',LastName) " full name",y.total_sales from employees e
             inner join (select EmployeeID,count(orderid)"total_sales" from orders o group by o.EmployeeID)
             y on e.EmployeeID = y.EmployeeID) z where z.total_sales > 70 order by z.EmployeeID'''
    cur.execute(query)
    for empid,name,ts in cur:
        print(empid," ",name," ",ts)
    print('\n')
    print("(iii) customers having active orders : ")
    print(" ")
    query = ''' select distinct(ContactName) from customers c inner join orders o on c.CustomerID = o.CustomerID'''
    cur.execute(query)
    for cust in cur:
        print(cust)
    print('\n')
    print("(iv) Customer with maximum number of orders : ")
    print('\n')
    query = '''select c.ContactName,c.CustomerID from customers c where c.CustomerID = (select y.CustomerID from
              (select x.CustomerID,max(x.c) from (select CustomerID,count(orderid)'c' from orders group by CustomerID order by count(OrderID) desc) x)y)'''
    cur.execute(query)
    for name,custid in cur:
        print('CustomerID : ',custid)
        print('CustomerName : ',name)
    print("\n")
    print("(v) Employees sold products 'Gravad Lax' or 'Mishi Kobe Niku' : \n ")
    query = '''select distinct(concat(e.titleofcourtesy,e.Firstname," ",e.Lastname)) "Employees" from employees e inner join orders o on e.EmployeeID = o.EmployeeID inner join
              orderdetails rd on o.OrderID = rd.OrderID inner join products p on rd.ProductID = p.productid
              where p.ProductName in('Gravad Lax','Mishi Kobe Niku')'''
    cur.execute(query)
    for emp in cur:
        print(emp)
    
except mc.Error as e:
    print(e)
finally:
    cur.close()
    con.close()

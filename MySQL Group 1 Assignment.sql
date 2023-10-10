use product;
# Q1.1 
select sum(qty) as Total_Quantity from product_sales; # ANS = 45216

# Q1.2 
select sum(qty*price) as Total_Sales from product_sales; # ANS = 1289453

# Q1.3 
select sum(qty*price*discount/100) as Total_Discount from product_sales; # ANS = 156229.1400

# Q1 
select sum(qty) as Total_Qty, sum(qty*price) as Total_Sales, sum(qty*price*discount/100) as Total_Discount from product_sales;


# Q2.1 
select count(distinct txn_id) as Unique_txn from product_sales; # ANS = 2500

# Q2.2 
select count(txn_id)/count(distinct txn_id) as Avg_Product from product_sales; # ANS = 6

# Q2.3 
# CREATE VIEW Revenue_perTXN AS
select sum(qty*price) as Revenue, txn_id from product_sales group by txn_id;
# CREATE VIEW Quartiles as
select Revenue, NTILE(4) OVER (ORDER BY Revenue) as Quartile from Revenue_perTXN;
select max(Revenue) as Percentile from Quartiles where Quartile < 4 group by Quartile;

# Q2.4 
select sum(qty*price*discount/100)/count(distinct txn_id) as Avg_Disc from product_sales;

# Q2.5 
SELECT member, (COUNT(member)/(select count(member) from product_sales))*100 as Percent_Split
from product_sales
group by member;

# Q2.6 
select member, sum(qty * price) as Total_Revenue from product_sales group by member;


#Q3.1 
#Q3.2 
#Q3.3 
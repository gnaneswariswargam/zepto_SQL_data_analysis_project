drop table if exists Zepto;

create table zepto (
    sku_id serial primary key,
    category varchar(120),
    name varchar(150) not null,
    mrp numeric(10,2),                     
    discountPercent numeric(5,2),
    availableQuantity int,
    discountedSellingPrice numeric(10,2),  
    weightInGms integer,
    outOfStock boolean,
    quantity integer
);

--data exploration--
select  count (*) from zepto;

select * From zepto;
--show the null values--
select * from zepto
where category is null
   or
name is null
  or
mrp is null
  or
discountpercent is null
  or
availableQuantity is null
  or
discountedsellingprice is null
  or
weightingms is null
 or
outofstock is null
  or
  quantity is null

  --different product category--

  select distinct category
  from zepto
  order by category;

  --productinstock outstock--
  select outofstock,count(sku_id)
  from zepto
  group by outofstock;

  --product names  present in multiple times--
  select name,count(sku_id) as "Number Of sku's"
  From zepto
  group by name
  having count(sku_id)>1
  order by  count(sku_id) DESC;

  --data clening--
  --product with prize=0--
  select * from zepto
  where mrp=0 or discountedsellingprice=0;

   --now we delect the 0 price row--
   DELETE  from zepto
   where mrp=0
--convert paise into rupees--

update zepto
set mrp=mrp/100.0,
discountedsellingprice=discountedsellingprice/100.0;

select mrp,discountedsellingprice from zepto;
--Q1. Find the top 10 best-value products based on the discount percentage.--
   select  distinct name,mrp,discountpercent
   FROM zepto
   order by discountpercent DESC
   limit 10; 

--Q2.What are the Products with High MRP but Out of Stock--
  select  distinct name,mrp
   FROM zepto
  Where outofstock=true and mrp>300
   order by mrp Desc;

--Q3.Calculate Estimated Revenue for each category--
 select category ,sum(discountedsellingprice*availableQuantity ) AS total_revenue
  From zepto
  Group by category
   order by total_revenue;

---Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

    select name,mrp,discountpercent
   FROM zepto
   Where mrp>500 AND discountpercent<10
   order by mrp desc,discountpercent desc;

  -- Q5. Identify the top 5 categories offering the highest average discount percentage.--
        select category,round(avg(discountpercent),2) AS avg_discount
         from zepto
          group by category
         order by  avg_discount desc
          limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.--
      select  distinct name, weightInGms,discountedsellingprice,
      round(discountedsellingprice/ weightInGms,2) AS price_per_gram
      FROM zepto
      where weightInGms>100
      order by price_per_gram; 

--Q7.Group the products into categories like Low, Medium, Bulk.--
    select distinct category ,weightInGms,
  CASE when weightInGms < 1000  then 'low'
       when weightInGms <5000   then 'medium'
	  else 'bulk'
	  End AS Weight_category
	  From Zepto;
	  
--Q8.What is the Total Inventory Weight Per Category --
   select category,sum(weightInGms*availableQuantity ) AS total_weight
   From zepto
   group  by category
   order by total_weight ASC;































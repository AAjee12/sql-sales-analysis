use superstoredb;
select * from super;
-- what is the total sales for each region for each year
select round(sum(sales),2), region, year(`Order Date`) from super
group by region, year(`Order Date`);

select `Order Date`, year(`Order Date`), 'Ship Date' 
from super
limit 2;
-- most sales in which categry 
select sum(sales) as sum_of_sales, category 
from super
group by category  -- category , function(any-column)
order by sum(sales) desc
limit 3;

select * from super
where category='Technology'
order by sales desc;

-- yearwise sales
select sum(sales), year(`Order Date`)
from super
group by year(`Order Date`);

-- [wrong] find the day of the week with the highest total sales
select sum(sales),weekday(`Order Date`) from super
group by weekday(`Order Date`)
order by sum(sales)
desc limit 8;

-- identify the top N region based on total sales
select sum(sales), region, row_number() over (order by sum(sales) desc) as ranking
from super 
group by region
order by sum(sales) desc 
limit 5;



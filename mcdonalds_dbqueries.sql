/* Query Hunter Schilb, Harrison Boehm, Kelsey Claflin, Joe Gamer */ 

SELECT * FROM Customer ;
SELECT * FROM Store ; 
SELECT * FROM FoodMenu ; 
SELECT * FROM CreditCard ; 
SELECT * FROM MenuItem ; 
SELECT * FROM OrderDetail ; 
SELECT * FROM OrderHeader ; 
SELECT * FROM SeasonalMenu ;  
SELECT * FROM Employee ; 
SELECT * FROM DrinkMenu ;



/* What is the last name of each store's manager? */ 
 Select s.StoreID, s.Name as Store_Name, e.LastName, e.IsStoreManager
 From Store as s inner join employee as e on s.StoreID= e.StoreID
  where IsStoreManager = 1 ; 



/* Total amount of calories of cold drinks*/ 
Select DrinkCategory, sum(DrinkCalories) as DrinkCalories
From DrinkMenu
where DrinkCategory = 'cold' 
group by DrinkCategory ; 



/* Show the Last Four digits of the orders that used a credit card. */ 
 select h.OrderID,h.TotalDue, h.PaymentType, c.LastFour
 from OrderHeader as h 
 right outer join CreditCard as c on h.CreditCardID=c.CreditCardID; 
 /* For the query above, we chose to do a right outer join since it would eliminate all the orders that did not use a 
 Credit Card. An outer join creates the Credit card table as the back bone 
 and shows us the last four digits if they paid with a credit card, not cash. */ 



 /*subquery, For people who are into fitness we want to display the healthier options. We used a subquery 
 to show the food menu items that contain foods with less calories than one of the healthier options; 
 the turkey sausage flatbread. */
select FoodID, FoodName, FoodCalories
from FoodMenu
where FoodCalories < (select FoodCalories from FoodMenu where FoodName LIKE 'Premium Caesar Salad with Grilled Chicken');

USE store;
SELECT * from brands;
SELECT 
    shoes.name, shoes.price, brands.country
FROM
    brands
        RIGHT JOIN
    shoes ON shoes.brand_id = brands.id
ORDER BY brands.country;
-- 4.4  Кількість рядків у групі + середня кількість товару

USE Orders;

      SELECT cat.name         category_name,
             count(*)         rows_in_group,
             avg(od.quantity) avg_quantity
		FROM order_details od
		JOIN orders         o ON od.order_id   = o.id
		JOIN customers      c ON o.customer_id = c.id
		JOIN employees      e ON o.employee_id = e.employee_id
		JOIN shippers       s ON o.shipper_id  = s.id
		JOIN products       p ON od.product_id = p.id
		JOIN categories   cat ON p.category_id = cat.id
		JOIN suppliers    sup ON p.supplier_id = sup.id
       WHERE e.employee_id > 3 
         AND e.employee_id <= 10
	GROUP BY cat.name
;
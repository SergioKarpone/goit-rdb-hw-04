-- 4.3  Вибірка, де employee_id > 3 AND <= 10

USE Orders;

      SELECT od.id                                  order_detail_id,
             o.id                                   order_id,
             e.employee_id,
             CONCAT(e.first_name, ' ', e.last_name) employee_name,
             cat.name                               category_name,
             p.name                                 product_name,
             od.quantity
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
;
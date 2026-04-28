-- 4.2  Заміна декількох INNER на LEFT JOIN

USE Orders;

      SELECT count(*) row_count
        FROM order_details od
   LEFT JOIN orders         o ON od.order_id   = o.id
   LEFT JOIN customers      c ON o.customer_id = c.id
   LEFT JOIN employees      e ON o.employee_id = e.employee_id
        JOIN shippers       s ON o.shipper_id  = s.id
        JOIN products       p ON od.product_id = p.id
        JOIN categories   cat ON p.category_id = cat.id
        JOIN suppliers    sup ON p.supplier_id = sup.id
;
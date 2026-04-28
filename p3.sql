-- 3. INNER JOIN усіх восьми таблиць

-- Спільні ключі:
--   order_details.order_id    -> orders.id
--   order_details.product_id  -> products.id
--   orders.customer_id        -> customers.id
--   orders.employee_id        -> employees.employee_id
--   orders.shipper_id         -> shippers.id
--   products.category_id      -> categories.id
--   products.supplier_id      -> suppliers.id

USE Orders;

    SELECT od.id                              order_detail_id,
           o.id                               order_id,
           o.date                             order_date,
           c.name                             customer_name,
           c.country                          customer_country,
           e.employee_id,
           e.first_name || ' ' || e.last_name employee_name,
           s.name                             shipper_name,
           p.id                               product_id,
           p.name                             product_name,
           p.price                            product_price,
           od.quantity,
           cat.name                           category_name,
           sup.name                           supplier_name,
           sup.country                        supplier_country
      FROM order_details od
      JOIN orders         o ON od.order_id   = o.id
      JOIN customers      c ON o.customer_id = c.id
      JOIN employees      e ON o.employee_id = e.employee_id
      JOIN shippers       s ON o.shipper_id  = s.id
      JOIN products       p ON od.product_id = p.id
      JOIN categories   cat ON p.category_id = cat.id
      JOIN suppliers    sup ON p.supplier_id = sup.id
;
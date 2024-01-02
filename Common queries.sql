-- Common queries

-- Get menu items sorted by popularitiy
SELECT menu.menu_item_id, menu.item_title, SUM(order_item.qty) FROM order_item
LEFT JOIN menu ON order_item.item_id = menu.menu_item_id
GROUP BY menu_item_id
ORDER BY sum desc, item_title asc

-- Get all the order transactions (except cancelled ones) in readable columns
select order_header_id, item_id, first_name, last_name, type_title, item_title, item_unit_price, qty, b.order_timestamp from order_header a 
left join order_item b on a.order_header_id = b.header_id 
left join customer c on a.customer_id = c.customer_id
left join menu d on b.item_id = d.menu_item_id
left join type e on d.item_type = e.type_id
where b.cancel_timestamp is null

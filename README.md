# test_jan_cantek

This is a database for POS in a restaurant. The POS database includes 5 tables:

customer - stores customers data including first name, last name, gender and age.
type - stores the categories of orderable items.
menu - stores the orderable items, unit price
order_header - stores the transaction header with customer ID, order timestamp, total amount of the transactions.
order_item - stores the subitems of each order with quantity and unit price.

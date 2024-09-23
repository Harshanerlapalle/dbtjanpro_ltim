
{{config(materialized="table")}}
with customers as(
    select 
      id as customer_id,
      first_name,
      last_name,
      last_name||first_name as full_name  {# comment :- we are generating full name here #}
    from {{source('jaffle_shop_src','customers')}}  
)

select * from customers
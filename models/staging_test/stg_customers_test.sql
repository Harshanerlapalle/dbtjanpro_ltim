{{config(materialized="table")}}

with customers_test as (
    select *
    from {{source('sch2_scr','customer_test')}}
    where custname like 'J%'
)
select * from customers_test
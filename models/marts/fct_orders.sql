with orders as(
    select * from {{ref("stg_orders")}}
),

payments as(
    select * from {{ref("stg_payments")}}
),

order_payments as(
    select 
      order_id,
      sum(case when status='success' then amount end) as amount
    from payments group by order_id
),

final as (
    select 
    a.customer_id,
    a.order_id,
    a.order_date,
    coalesce(b.amount,0) as amount
    from orders a left join order_payments b on a.order_id=b.order_id
)

select * from final
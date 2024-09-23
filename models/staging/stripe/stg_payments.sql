with payments as(
    select
      id as payment_id,
      order_id as order_id,
      paymentmethod as payment_method,
      status,
      amount  as amount,
      created as created_at
    from  {{source('stripe_src','payment')}} 
)

select * from payments
{{config(materialized='incremental',
    unique_key='id',
    merge_exclude_columns='id'
)}}

with employee as (
    select * from {{source('jaffle_shop_src','emp')}}
    {% if is_incremental() %}
    where id not in (select id from {{this}})
    {%endif%}
)

select * from employee
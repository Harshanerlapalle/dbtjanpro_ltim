{{config(materialized='incremental',
          unique_key= 'id'
          
        ) }}


    select * from {{source('jaffle_shop_src','emp')}}
     {% if is_incremental() %}
      where id not in (select id from {{this}})
      
     {% endif %}



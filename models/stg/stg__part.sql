with part as (
    select * from {{ ref('snap__part') }}
),

renamed as (
    select
        p_partkey as part_id,
        INITCAP(p_name) as name,
        p_brand as brand,
        p_type as type,
        p_retailprice as retail_price,
        TRIM(p_comment) as comment
    from part 
    where 
        dbt_valid_to is null
)

select * from renamed
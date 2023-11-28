with 

source as (
    select * from {{ source('billing_data', 'claim_line') }} 
),

stg_claim_lines as (

    select 
        id as claim_line_id,
        claim_id as claim_id,

        -- numbers
        chrgamnt as charge_amount,
        paid_amnt as paid_amount,
        err_amnt as error_amount,

        -- varchsrs
        cpt as procedure_code,
        cptdesc as procedure_code_descrip,
        status as status,

        -- dates
        created as created_at,
        _fivetran_synced_at as _fivetran_synced_at

    
    from source

)

select * from stg_claim_lines
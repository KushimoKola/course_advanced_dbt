SELECT
    date_month,
    user_id,
    subscription_id,
    mrr_amount,
{{ rolling_agg_generalized (
        agg_func='avg',
        column_name='mrr_amount',
        partition_by='user_id,subscription_id',
        order_by='date_month',
        roll=14) }}
FROM {{ ref('fct_mrr') }}

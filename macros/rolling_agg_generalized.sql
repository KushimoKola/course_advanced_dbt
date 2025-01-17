{% macro rolling_agg_generalized(column_name, partition_by, order_by="created_at", agg_func="avg", roll=7) %}
    {{ agg_func }} ( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ roll - 1 }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ roll }}_periods_{{ column_name }}
{% endmacro %}

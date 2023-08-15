SELECT
  ooh.sold_to_org_id "CUSTOMER_ID",
  rc.customer_name,
  mmt.trx_source_line_id,
  ooh.order_number
FROM
  apps.mtl_material_transactions mmt
LEFT JOIN apps.oe_order_lines_all ool ON mmt.trx_source_line_id = ool.line_id
LEFT JOIN apps.oe_order_headers_all ooh ON ool.header_id = ooh.header_id
LEFT JOIN apps.ra_customers rc ON ooh.sold_to_org_id = rc.customer_id
WHERE
  mmt.trx_source_line_id IS NOT NULL
AND mmt.transaction_id = :p_transaction_id  
;
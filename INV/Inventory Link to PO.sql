SELECT
    poh.vendor_id "PO_VENDOR_ID", 
    v.vendor_name,
    mmt.rcv_transaction_id,
    poh.segment1 "PO_NUMBER"
FROM
    apps.mtl_material_transactions mmt
LEFT JOIN apps.rcv_transactions rt ON mmt.rcv_transaction_id = rt.transaction_id 
LEFT JOIN po.po_headers_all poh ON poh.po_header_id = rt.po_header_id 
LEFT JOIN po.po_vendors v ON v.vendor_id = poh.vendor_id
WHERE
    mmt.rcv_transaction_id IS NOT NULL
AND mmt.transaction_id = :p_transaction_id 
;
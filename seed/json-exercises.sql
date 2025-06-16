CREATE TEMPORARY TABLE json_works (
    id SERIAL PRIMARY KEY,
    json_data JSONB NOT NULL
);

INSERT INTO json_works(json_data) VALUES ('{"color":"Black","list_price":1349.6,"product_id":745,"product_name":"HL Mountain Frame - Black, 48","safety_stock":{"reorder_point":375,"safety_stock_level":500},"size_and_weight":["48","2.80"]}');

CREATE TABLE `clicks` (
  `click_id` STRING NOT NULL,
  `user_id` INT NOT NULL,
  `url` STRING NOT NULL,
  `user_agent` STRING NOT NULL,
  `view_time` INT NOT NULL,
  `$rowtime` TIMESTAMP(3),
  WATERMARK FOR `$rowtime` AS `$rowtime` - INTERVAL '5' SECOND
) WITH (
  'connector' = 'faker',
  'fields.click_id.expression' = '#{Internet.UUID}',
  'fields.url.expression' = '#{regexify ''https://www[.]acme[.]com/product/[a-z]{5}''}',
  'fields.user_agent.expression' = '#{Internet.UserAgent}',
  'fields.user_id.expression' = '#{Number.numberBetween ''3000'',''5000''}',
  'fields.view_time.expression' = '#{Number.numberBetween ''10'',''120''}',
  'fields.$rowtime.expression' = '#{date.past ''5'',''SECONDS''}',
  'rows-per-second' = '50'
);

CREATE TABLE `customers` (
  `customer_id` INT NOT NULL,
  `name` STRING NOT NULL,
  `address` STRING NOT NULL,
  `postcode` STRING NOT NULL,
  `city` STRING NOT NULL,
  `email` STRING NOT NULL,
  `$rowtime` TIMESTAMP(3),
  WATERMARK FOR `$rowtime` AS `$rowtime` - INTERVAL '5' SECOND,
  PRIMARY KEY (`customer_id`) NOT ENFORCED
) WITH (
  'connector' = 'faker',
  'fields.address.expression' = '#{Address.streetAddress}',
  'fields.city.expression' = '#{Address.city}',
  'fields.customer_id.expression' = '#{Number.numberBetween ''3000'',''3250''}',
  'fields.email.expression' = '#{Internet.emailAddress}',
  'fields.name.expression' = '#{Name.fullName}',
  'fields.postcode.expression' = '#{Address.postcode}',
  'fields.$rowtime.expression' = '#{date.past ''5'',''SECONDS''}',
  'rows-per-second' = '50'
);

CREATE TABLE `orders` (
  `order_id` STRING NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` STRING NOT NULL,
  `price` DOUBLE NOT NULL,
  `$rowtime` TIMESTAMP(3),
  WATERMARK FOR `$rowtime` AS `$rowtime` - INTERVAL '5' SECOND
) WITH (
  'connector' = 'faker',
  'fields.customer_id.expression' = '#{Number.numberBetween ''3000'',''3250''}',
  'fields.order_id.expression' = '#{Internet.UUID}',
  'fields.price.expression' = '#{Number.randomDouble ''2'',''10'',''100''}',
  'fields.product_id.expression' = '#{Number.numberBetween ''1000'',''1500''}',
  'fields.$rowtime.expression' = '#{date.past ''5'',''SECONDS''}',
  'rows-per-second' = '50'
);

CREATE TABLE `products` (
  `product_id` STRING NOT NULL,
  `name` STRING NOT NULL,
  `brand` STRING NOT NULL,
  `vendor` STRING NOT NULL,
  `department` STRING NOT NULL,
  `$rowtime` TIMESTAMP(3),
  WATERMARK FOR `$rowtime` AS `$rowtime` - INTERVAL '5' SECOND,
  PRIMARY KEY (`product_id`) NOT ENFORCED
) WITH (
  'connector' = 'faker',
  'fields.brand.expression' = '#{Commerce.brand}',
  'fields.department.expression' = '#{Commerce.department}',
  'fields.name.expression' = '#{Commerce.productName}',
  'fields.product_id.expression' = '#{Number.numberBetween ''1000'',''1500''}',
  'fields.vendor.expression' = '#{Commerce.vendor}',
  'fields.$rowtime.expression' = '#{date.past ''5'',''SECONDS''}',
  'rows-per-second' = '50'
);

-- 20. trigger

-- 트리거 생성
DELIMITER //
CREATE OR REPLACE TRIGGER after_order_menu_insert
 AFTER INSERT
    ON tbl_order_menu
    FOR EACH ROW
 BEGIN
 	UPDATE tbl_order
 	   SET total_order_price = total_order_price + NEW.order_amount *
 	   (SELECT menu_price
 	      FROM tbl_menu
 	     WHERE menu_code = NEW.menu_code)
 	 WHERE order_code = NEW.order_code;
 END //
DELIMITER ;

-- tbl_order insert
INSERT
  INTO tbl_order
VALUES
(
  NULL
, DATE_FORMAT(CURRENT_DATE, '%Y%m%d')
, DATE_FORMAT(CURRENT_TIME, '%H%i%s')
, 0
);

SELECT * FROM tbl_order;

-- tbl_order_menu insert
INSERT
  INTO tbl_order_menu
(
  order_code
, menu_code
, order_amount
)
VALUES
(
  1
, 3
, 2
);

INSERT
  INTO tbl_order_menu
(
  order_code
, menu_code
, order_amount
)
VALUES
(
  1
, 4
, 2
);


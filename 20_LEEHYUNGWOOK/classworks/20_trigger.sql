-- ==================================================================
-- 20. Trigger
-- ==================================================================

-- (1) 
-- DELIMITER // 
-- 
-- CREATE OR REPLACE TRIGGER [트리거명]
--    BEFORE|AFTER [이벤트 타입]
--    ON [테이블명]
--    FOR EACH ROW
-- BEGIN
-- END//
--
-- DELIMITER ;

DELIMITER //

CREATE OR REPLACE TRIGGER after_order_menu_insert
    AFTER INSERT
    ON tbl_order_menu
    FOR EACH ROW
BEGIN
    UPDATE tbl_order
    SET 
    total_order_price = total_order_price 
    + NEW.order_amount * (  SELECT menu_price 
					    	FROM tbl_menu 
					    	WHERE menu_code = NEW.menu_code)
    WHERE order_code = NEW.order_code;
END//

DELIMITER ;

SELECT * FROM tbl_order;

-- tbl_order_menu
INSERT
  INTO tbl_order
(
  order_code
, order_date
, order_time
, total_order_price
)
VALUES
(
  NULL
, DATE_FORMAT(CURRENT_DATE, '%Y%m%d')
, DATE_FORMAT(CURRENT_TIME, '%H%i%s')
, 0			
);

-- 주문 메뉴 테이블 INSERT 1
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

-- 주문 메뉴 테이블 INSERT 2
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
, 6
, 3
);
SELECT * FROM tbl_order;
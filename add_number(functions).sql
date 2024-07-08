CREATE DEFINER=`admin`@`%` FUNCTION `add_number`(
	v_num1 int,
    v_num2 int
) RETURNS int
BEGIN

RETURN v_num1 + v_num2;
END
# from -> where -> group by -> select -> having -> order by -> limit

SELECT
	dt.dvd_id,
    dt.registration_number,
    dt.title,
    dt.producer_id,
    pdt.producer_name,
    dt.publisher_id,
    pbt.publisher_name,
    dt.publication_year,
    dt.database_date
FROM
	dvd_tb dt
    left outer join producer_tb pdt on(pdt.producer_id = dt.producer_id)
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id)
# where
#	dt.producer_id = 749;
#	producer_name = "KBS미디어";
limit 0, 10;	#limit 10(인덱스), 10(보여줄 개수)



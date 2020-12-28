INSERT INTO `open`.`guestbook_message`(guest_name, password, message) VALUES ('test',1234,'반갑습니다.');

-- INSERT INTO `open`.`guestbook_message`(guest_name, password, message) VALUES (?,?,?);


select * from open.guestbook_message;

-- select * from guestbook_message;


delete from `open`.`guestbook_message` where message_id = 1;

-- delete from 'open'.'guestbook_message' where message_id=1;


-- 전체 게시물의 개수 구하기
select count(*) from open.guestbook_message;
-- select count(*) from guestbook_message;

-- 페이지 별 메시지 리스트(4번째부터 3개 출력)
select * from open.guestbook_message order by message_id desc limit 4,3;
-- select * from open.guestbook_message order by message_id desc limit ?,?;
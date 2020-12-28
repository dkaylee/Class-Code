INSERT INTO `open`.`guestbook_message`(guest_name, password, message) VALUES ('test',1234,'반갑습니다.');

-- INSERT INTO `open`.`guestbook_message`(guest_name, password, message) VALUES (?,?,?);


select * from open.guestbook_message;

-- select * from guestbook_message;


delete from `open`.`guestbook_message` where message_id = 1;

-- delete from 'open'.'guestbook_message' where message_id=1;


-- 전체 게시물의 개수 구하기
select count(*) from open.guestbook_message;







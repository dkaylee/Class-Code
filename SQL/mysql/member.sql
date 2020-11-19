SELECT `member`.`idx`,
    `member`.`userid`,
    `member`.`password`,
    `member`.`username`,
    `member`.`regdate`
FROM `project`.`member`;

INSERT INTO `project`.`member`
(`idx`,`userid`,`password`,`username`,`regdate`)
VALUES
(<{idx: }>,<{userid: }>,<{password: }>,<{username: }>,<{regdate: now()}>);

INSERT INTO `project`.`member`
(`idx`,`userid`,`password`,`username`,`regdate`)
VALUES('king','1111','KING');

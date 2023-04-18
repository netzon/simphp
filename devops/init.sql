CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_status`) VALUES ('1', 'user1', 'user1@gmail.com', '1');
INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_status`) VALUES ('2', 'user2', 'user2@gmail.com', '1');
INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_status`) VALUES ('3', 'user3', 'user3@gmail.com', '1');

DELIMITER //
CREATE PROCEDURE GetAllUsers(
  in pageNumber int,
  in pageLimit int
)
BEGIN
  declare query_offset int default 0;
  set query_offset = ((pageNumber-1) * pageLimit);

	SELECT * FROM users ORDER BY user_id ASC LIMIT pageLimit OFFSET query_offset;
END //
DELIMITER ;


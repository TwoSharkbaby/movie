# movie

# CREATE TABLE `actor` (
  `act_idn` bigint NOT NULL,
  `act_name` varchar(100) NOT NULL,
  `act_birth` date DEFAULT NULL,
  `act_sex` varchar(10) DEFAULT NULL,
  `act_info` varchar(2000) DEFAULT NULL,
  `act_regdate` date DEFAULT NULL,
  `act_img` varchar(255) DEFAULT NULL,
  `act_thumb` varchar(255) DEFAULT NULL,
  `mov_idn` bigint NOT NULL,
  PRIMARY KEY (`act_idn`),
  KEY `which_movi_idx` (`mov_idn`),
  CONSTRAINT `which_movi` FOREIGN KEY (`mov_idn`) REFERENCES `movie` (`mov_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `member` (
  `mem_idn` bigint NOT NULL,
  `mem_id` varchar(50) NOT NULL,
  `mem_pw` varchar(100) NOT NULL,
  `mem_name` varchar(100) NOT NULL,
  `mem_nickname` varchar(255) NOT NULL,
  `mem_eamil` varchar(255) DEFAULT NULL,
  `mem_contact` int DEFAULT NULL,
  `mem_regdate` date DEFAULT NULL,
  PRIMARY KEY (`mem_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie` (
  `mov_idn` bigint NOT NULL,
  `mov_title` varchar(255) NOT NULL,
  `mov_director` varchar(100) DEFAULT NULL,
  `mov_genre` varchar(100) DEFAULT NULL,
  `mov_synopsis` varchar(2000) DEFAULT NULL,
  `mov_release` date DEFAULT NULL,
  `mov_runtime` time DEFAULT NULL,
  `mov_regdate` date DEFAULT NULL,
  `mov_img` varchar(255) DEFAULT NULL,
  `mov_thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mov_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie_ration` (
  `mov_rat_idn` bigint NOT NULL,
  `mov_rat_regdate` date DEFAULT NULL,
  `mem_idn` bigint NOT NULL,
  `mov_idn` bigint NOT NULL,
  `mov_rat_point` int NOT NULL,
  PRIMARY KEY (`mov_rat_idn`),
  KEY `who_rating_idx` (`mem_idn`),
  KEY `which_movie_idx` (`mov_idn`),
  CONSTRAINT `which_movie` FOREIGN KEY (`mov_idn`) REFERENCES `movie` (`mov_idn`),
  CONSTRAINT `who_rating` FOREIGN KEY (`mem_idn`) REFERENCES `member` (`mem_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie_review` (
  `mov_rev_idn` bigint NOT NULL,
  `mov_rev_title` varchar(255) NOT NULL,
  `mov_rev_content` varchar(2000) DEFAULT NULL,
  `mov_rev_regdate` date DEFAULT NULL,
  `mov_rev_good` int DEFAULT NULL,
  `mov_rev_bad` int DEFAULT NULL,
  `mov_idn` bigint NOT NULL,
  `mem_idn` bigint NOT NULL,
  PRIMARY KEY (`mov_rev_idn`),
  KEY `which_mov_idx` (`mov_idn`),
  KEY `who_rev_idx` (`mem_idn`),
  CONSTRAINT `which_mov` FOREIGN KEY (`mov_idn`) REFERENCES `movie` (`mov_idn`),
  CONSTRAINT `who_rev` FOREIGN KEY (`mem_idn`) REFERENCES `member` (`mem_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie_review_choice` (
  `mov_rev_cho_idn` bigint NOT NULL,
  `mov_rev_cho_cho` int DEFAULT NULL,
  `mov_rev_cho_regdate` date DEFAULT NULL,
  `mov_rev_idn` bigint NOT NULL,
  `mem_idn` bigint NOT NULL,
  PRIMARY KEY (`mov_rev_cho_idn`),
  KEY `who_rev_cho_idx` (`mov_rev_idn`),
  KEY `which_mem_cho_idx` (`mem_idn`),
  CONSTRAINT `which_mem_cho` FOREIGN KEY (`mem_idn`) REFERENCES `member` (`mem_idn`),
  CONSTRAINT `which_rev_cho` FOREIGN KEY (`mov_rev_idn`) REFERENCES `movie_review` (`mov_rev_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie_review_comment` (
  `mov_rev_com_idn` bigint NOT NULL,
  `mov_rev_com_title` varchar(255) NOT NULL,
  `mov_rev_com_content` varchar(2000) NOT NULL,
  `mov_rev_com_regdate` date DEFAULT NULL,
  `mov_rev_com_good` int DEFAULT NULL,
  `mov_rev_com_bad` int DEFAULT NULL,
  `mem_idn` bigint NOT NULL,
  `mov_rev_idn` bigint NOT NULL,
  PRIMARY KEY (`mov_rev_com_idn`),
  KEY `who_rev_com_idx` (`mem_idn`),
  KEY `which_rev_idn_idx` (`mov_rev_idn`),
  CONSTRAINT `which_rev_idn` FOREIGN KEY (`mov_rev_idn`) REFERENCES `movie_review` (`mov_rev_idn`),
  CONSTRAINT `who_rev_com` FOREIGN KEY (`mem_idn`) REFERENCES `member` (`mem_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `movie_review_comment_choice` (
  `movie_review_comment_idn` bigint NOT NULL,
  `movie_review_comment_cho` int DEFAULT NULL,
  `movie_review_comment_regdate` date DEFAULT NULL,
  `mov_rev_idn` bigint NOT NULL,
  `mem_idn` bigint NOT NULL,
  PRIMARY KEY (`movie_review_comment_idn`),
  KEY `which_com_cho_idx` (`mov_rev_idn`),
  KEY `who_com_cho_idx` (`mem_idn`),
  CONSTRAINT `which_com_cho` FOREIGN KEY (`mov_rev_idn`) REFERENCES `movie_review_comment` (`mov_rev_com_idn`),
  CONSTRAINT `who_com_cho` FOREIGN KEY (`mem_idn`) REFERENCES `member` (`mem_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

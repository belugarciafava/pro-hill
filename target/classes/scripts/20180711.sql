use policies;

CREATE TABLE IF NOT EXISTS  `policy_sequence` (
  `organization` varchar(255) NOT NULL,
  `policy_number` bigint(20) DEFAULT NULL,
  `row_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`organization`)
) ENGINE=InnoDB;

INSERT INTO `policies`.`policy_sequence` (`organization`, `policy_number`, `row_version`) 
  VALUES 
  ('IUNIGO', '0', '0'),
  ('TEST', '0', '0');
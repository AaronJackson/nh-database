DROP TABLE IF EXISTS `email_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_users` (
  `email_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`user_id`),
  KEY `IDX_89CEE466A832C1C9` (`email_id`),
  KEY `IDX_89CEE466A76ED395` (`user_id`),
  CONSTRAINT `FK_89CEE466A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_89CEE466A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


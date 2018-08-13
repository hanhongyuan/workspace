USE `oss`;

DROP TABLE IF EXISTS `oss_res`;
CREATE TABLE IF NOT EXISTS `oss_res` (
  `Id` bigint(20) NOT NULL,
  `Bucket` varchar(100) NOT NULL DEFAULT '0',
  `Object` varchar(100) NOT NULL DEFAULT '0',
  `Etag` varchar(100) NOT NULL DEFAULT '0',
  `Size` int(11) NOT NULL DEFAULT '0',
  `Mimetype` varchar(100) DEFAULT '0',
  `Imageinfoheight` int(11) NOT NULL DEFAULT '0',
  `Imageinfowidth` int(11) NOT NULL DEFAULT '0',
  `Imageinfoformat` varchar(100) DEFAULT '0',
  `Extdata` text,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='oss 上传回执';
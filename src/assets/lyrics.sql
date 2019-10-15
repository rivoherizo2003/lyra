CREATE TABLE IF NOT EXISTS `lyrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `lyric` text NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `key_song` varchar(2) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '2' COMMENT '1 gala or 2 rodobe',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `lyrics` (`id`, `title`, `lyric`, `author`, `key_song`, `type`) VALUES
(1, 'ADIM-PANAHY', '1-Holazaiko Aminao eto anio\r\nRaiko ô ! zany adim-panahy\r\nFa tafiotra miampy tadio\r\nKa toa mila hanafotra ahy\r\nIanao sisa mantsy ry Ray\r\nNo hany fanantenainity fo\r\nÔ ampio aho fa mangahiahy\r\nMila tsy hitraka ny loha\r\nHiery Aminao ve ? reo ota izay natao\r\nAza jerean re zao hadalako izao\r\nNy famindram-ponao io no andrasako\r\nHamafa ny talaho sy ranomasoko\r\n\r\n2-Hatrizay aho, naniasia\r\nNanalavitra ny valanao\r\nKanjo sendra ny rano mania\r\nTeo vao niantsoantso Anao\r\nÔ vonjeo aho Jesosy mahery\r\nFefa fefika ny ota aho izao\r\nAza afoinao fandrao dia ho very\r\nKa ho faty ity zanakao\r\nNy halemeko ve ? Indro efa fantatrao\r\nFa nofo ihany anie ity adalanao\r\nNy ranao latsaka mba hanadio ahy\r\nIo no hanafaka ny ratran\'ny fanahy', NULL, NULL, 2),
(2, 'AFAFY', 'REF :\r\nAfafy ny teny ho henonao\r\nAfafy ny teny ho fantatrao\r\nAfafy koa aza manamafy ny fonao ianao\r\nAfafy ho anao zay manantena\r\nNy handray ny tena famonjena\r\nKoa ekeo amin\'ny fo zay tena rehetra omena\r\n\r\n1-Ny lanitra sy izao rehetra izao\r\nHo levona,fa maharitra mandrakizay\r\nNy teninAndriamanitra\r\nMbola ho rovitra toy ny fitafina ny andronao\r\nKoa mba hevero re lay tsy miova\r\n\r\n2-Tonga tety ny Zanaky ny Ray dia Jesosy\r\nTsy hanameloka izao tontolo izao\r\nFa ny hamonjy azy\r\nIzy no làlana sy fahamarinana ary fiainana\r\nZay te ho velona dia mino Azy', NULL, NULL, 2);

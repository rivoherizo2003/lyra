CREATE TABLE IF NOT EXISTS "lyrics" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"title"	TEXT,
	"lyric"	TEXT,
	"author"	TEXT,
	"key_song"	TEXT,
	"type"	INTEGER
);
DELETE FROM "lyrics";
INSERT INTO "lyrics" VALUES (9,'ADIM-PANAHY','<p>1-Holazaiko Aminao eto anio
Raiko ô ! zany adim-panahy
Fa tafiotra miampy tadio
Ka toa mila hanafotra ahy
Ianao sisa mantsy ry Ray
No hany fanantenainity fo
Ô ampio aho fa mangahiahy
Mila tsy hitraka ny loha
Hiery Aminao ve ? reo ota izay natao
Aza jerean re zao hadalako izao
Ny famindram-ponao io no andrasako
Hamafa ny talaho sy ranomasoko
</p>
<p>
2-Hatrizay aho, naniasia
Nanalavitra ny valanao
Kanjo sendra ny rano mania
Teo vao niantsoantso Anao
Ô vonjeo aho Jesosy mahery
Fefa fefika ny ota aho izao
Aza afoinao fandrao dia ho very
Ka ho faty ity zanakao
Ny halemeko ve ? Indro efa fantatrao
Fa nofo ihany anie ity adalanao
Ny ranao latsaka mba hanadio ahy
Io no hanafaka ny ratran''ny fanahy</p>',NULL,NULL,2),
 (10,'AFAFY','REF :
Afafy ny teny ho henonao
Afafy ny teny ho fantatrao
Afafy koa aza manamafy ny fonao ianao
Afafy ho anao zay manantena
Ny handray ny tena famonjena
Koa ekeo amin''ny fo zay tena rehetra omena

1-Ny lanitra sy izao rehetra izao
Ho levona,fa maharitra mandrakizay
Ny teninAndriamanitra
Mbola ho rovitra toy ny fitafina ny andronao
Koa mba hevero re lay tsy miova

2-Tonga tety ny Zanaky ny Ray dia Jesosy
Tsy hanameloka izao tontolo izao
Fa ny hamonjy azy
Izy no làlana sy fahamarinana ary fiainana
Zay te ho velona dia mino Azy',NULL,NULL,2),
 (11,'NY MIARAKA AMINAO','Efa ela aho no nibanjina Anao, efa ela aho no nitady Anao
Hanjaka amin''ny fiainako, ho Tompon''ny tena sains syy NY fo.
Hay ve NY fahotako no rindrina nanasaraka ahy taminao
ka dia nijaly aho be NY nanjo, nangirifiry mafy tsy tantin''ny FO

réf: Sambatra aho ry Jesosy o! satria navelanao NY heloko
Fiadanam-po, fiadanam-po
Sambatra aho ry Jesosy o! satria navelanao NY heloko.
fiainan-tsambatra any an-danitra.
Voninahitra omena Anao

NY fahoriana izay nangeja tokoa,tsy MBA nataonao hanakivy NY FO
fa fianarana hahatoky Ilay Tsitoha
ilay be fitiavana sy be indrafo
NY fitahiana koa avy Aminao tsy hanadinoina NY anaranao
fa hanandratako NY voninahitrao sy hotoriana amin''izao tontolo izao',NULL,NULL,1),
 (12,'TSINONTSINONA','Izaho ilay ondry nirenireny
Nivezivezy tsy nisy Mpiahy
Jehovah Tompo nefa no niteny
F''Izy hanangana mpiandry ho ahy
Indro Izaho indro izaho Jehovah Tompo
No hamomjy sy handinindinika
Ny very ho tadiaviko
Ny babo hampodiako
Ny malemy hohatanjahiko

Ref: Olon-tsinontsinona nomenao ny rariny
Tsy mahay misaotra tsy mba nanaja Anao
Ondry efa very, ondry efa nania
Nefa mbola notadiavinao',NULL,NULL,1);

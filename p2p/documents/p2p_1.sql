/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.140_3306
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : p2p_1

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-23 13:43:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `t_bankcard`;
CREATE TABLE `t_bankcard` (
  `bcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `cardno` varchar(30) NOT NULL COMMENT '银行卡号',
  `rname` varchar(20) NOT NULL COMMENT '绑卡人姓名',
  `idno` char(18) DEFAULT NULL COMMENT '身份证号码，默认为18位',
  `type` varchar(20) NOT NULL COMMENT '所属银行',
  `state` tinyint(4) DEFAULT NULL COMMENT '银行卡状态，0激活，1冻结',
  `date` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bankcard
-- ----------------------------
INSERT INTO `t_bankcard` VALUES ('7', '2', '6089786756543456787', '李四', '360730199709191635', '建设银行', '0', '2018-01-16 08:46:23');
INSERT INTO `t_bankcard` VALUES ('11', '2', '6089878767876787678', '李四', '360730199709191635', '建设银行', '0', '2018-01-16 13:46:59');
INSERT INTO `t_bankcard` VALUES ('14', '1', '6025456545669854254', '温宁宁', '360730199709191713', '建设银行', '0', '2018-01-17 20:31:25');
INSERT INTO `t_bankcard` VALUES ('17', '1', '6098876565456543456', '温宁宁', '360730199709191713', '建设银行', '0', '2018-01-18 10:42:56');
INSERT INTO `t_bankcard` VALUES ('18', '41', '6098987876567656545', '温宁宁', '360730199709191913', '建设银行', '0', '2018-01-23 11:02:21');

-- ----------------------------
-- Table structure for t_borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowapply`;
CREATE TABLE `t_borrowapply` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '申请金额',
  `uid` bigint(20) DEFAULT NULL COMMENT '借款人id，uid为t_user表id',
  `bzid` bigint(20) DEFAULT NULL COMMENT '标种',
  `time` datetime DEFAULT NULL COMMENT '审核时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '审核状态（1表示为审核，2表示已审核）',
  `lxid` bigint(20) DEFAULT NULL COMMENT '借款类型为标种的主键字段',
  `term` int(20) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  `huid` bigint(20) DEFAULT NULL COMMENT 's审核人id',
  `excuse` varchar(20) DEFAULT NULL COMMENT '审核理由',
  `sid` bigint(20) DEFAULT NULL,
  `mbtime` datetime DEFAULT NULL COMMENT '满标时间',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowapply
-- ----------------------------
INSERT INTO `t_borrowapply` VALUES ('15', '温宁宁', '100000.00', '1', '1', '2018-01-09 19:48:02', '3', '2', '6', '2018-06-28 11:40:04', '1', '', '5', null);
INSERT INTO `t_borrowapply` VALUES ('16', '温宁宁', '500000.00', '1', '2', '2018-01-09 08:55:24', '3', '1', '10', '2018-10-28 14:06:44', '1', null, '3', null);
INSERT INTO `t_borrowapply` VALUES ('17', '李四', '50000.00', '2', '2', '2018-01-09 09:21:24', '4', '2', '8', '2018-09-09 09:20:24', '1', null, '2', '2018-01-09 10:58:33');
INSERT INTO `t_borrowapply` VALUES ('18', '李四', '6000.00', '2', '3', '2018-01-09 11:20:28', '4', '1', '10', '2018-11-09 11:13:00', '1', null, '5', '2018-01-09 11:27:38');
INSERT INTO `t_borrowapply` VALUES ('24', '温宁宁', '60000.00', '1', '1', '2018-01-15 21:18:40', '3', '2', '5', '2018-06-15 20:38:52', '1', '', '3', null);
INSERT INTO `t_borrowapply` VALUES ('25', '温宁宁', '250000.00', '1', '2', '2018-01-15 21:18:44', '3', '3', '6', '2018-07-15 20:43:23', '1', '', '5', null);
INSERT INTO `t_borrowapply` VALUES ('26', '温宁宁', '30000.00', '1', '3', '2018-01-15 21:18:48', '3', '1', '6', '2018-07-15 20:46:13', '1', '', '3', null);
INSERT INTO `t_borrowapply` VALUES ('27', '温宁宁', '24500.00', '1', '3', '2018-01-15 21:18:53', '3', '1', '6', '2018-07-15 20:48:13', '1', '', '3', null);
INSERT INTO `t_borrowapply` VALUES ('28', '温宁宁', '30000.00', '1', '1', '2018-01-15 21:23:12', '3', '2', '5', '2018-06-15 21:24:22', '1', '', '3', null);
INSERT INTO `t_borrowapply` VALUES ('29', null, '50000.00', '34', '2', null, '1', '1', '1', '2018-02-22 20:36:05', null, null, '3', null);
INSERT INTO `t_borrowapply` VALUES ('30', null, '100000.00', '41', '2', '2018-01-23 10:10:32', '3', '1', '10', '2018-11-23 10:09:16', '1', '信息不全', '4', null);

-- ----------------------------
-- Table structure for t_borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowdetail`;
CREATE TABLE `t_borrowdetail` (
  `bdid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fpic` varchar(100) DEFAULT NULL COMMENT '法人身份证照片',
  `ypic` varchar(100) DEFAULT NULL COMMENT '营业执照副本照片',
  `qpic` varchar(100) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(100) DEFAULT NULL COMMENT '其他资料',
  `mpurpose` varchar(100) DEFAULT NULL COMMENT '资金用途',
  `hksource` varchar(100) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(1000) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` varchar(1000) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(1000) DEFAULT NULL COMMENT '保障措施',
  `ytmoney` decimal(10,2) DEFAULT '0.00' COMMENT '已投金额',
  `nprofit` decimal(5,2) DEFAULT NULL COMMENT '年化收益',
  `cpname` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，baid为t_borrowapply表id',
  `sqtime` datetime DEFAULT NULL COMMENT '申请时间',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowdetail
-- ----------------------------
INSERT INTO `t_borrowdetail` VALUES ('10', '2018011520461320170825174257384.jpg', '2018011520481420170815181352001.jpg', '2018011520385520170905174039936.jpg', '2018011520481420170815181449287.jpg', '其他借款', '经营性收入', '赣州**商贸有限责任公司成立于2007年04月23日  ，注册资本260万，实收资本260万元，股东分别为李**占比60%、吴**占比40%，经营范围：预包装食品，散装食品，乳制品（含婴幼儿配方乳粉）批发兼零售（凭有效食品经营许可证经营）；食盐批发(凭食盐批发有效许可证经营)；日用品销售；市场营销策划；展览展示服务。公司现有在册员工87名，办公面积600余平方米，仓储面积5000余平米，配送车辆11台。2016年年营业收入6147.82万元左右，净利润519.33万元，2017年1-10月年营业收入5568.88万元，净利润479.49万元。', '本次借款主要用于年底年货销售旺季备货，该企业借款金额为100万元，第一期50万元，期限3个月，本平台为此借款提供服务。', '1、 公司股东李**、吴**夫妇提供无限连带责任担保\r\n2、在中登网登记2018年度与赣州**实业有限公司应收账款金额不低于240万元', '1100.00', '9.00', 'PJZB1215', '15', '2018-01-09 09:01:00', null);
INSERT INTO `t_borrowdetail` VALUES ('11', '2018011520481420170815181343450.jpg', '2018011521242320170815181352001.jpg', '2018011520385520170905174039936.jpg', '2018011521242320170815181449287.jpg', '将通过访谈和规范化', '更符合规范化', '发送到', '法国队的风格', '更符合法规和', '57000.00', '6.00', 'PJZB2116', '16', '2018-01-09 09:01:03', null);
INSERT INTO `t_borrowdetail` VALUES ('12', '2018010909202420180108114105481.jpg', '2018010909202420180108114118663.jpg', '2018010909202420180108114127452.jpg', '2018010909202420180108115304925.jpg', '资金周转', '电子商业承兑汇票到期资金', '原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒创有限公司全资子公司赣州恒创置业有限公司项目广告设计、制作安装、媒体传播等。原债权方将恒创置业所开具商业承兑汇票转让给某保理公司，恒创置业集团信用状况良好，资产实力充裕。本项目本次融资金额为132254元，融资期6个月。', '本期投资标的为某保理公司转让出的编号为YC2017TD00012的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为赣州恒创置业有限公司。', '1、项目到期由某保理公司回购\r\n2、恒创置业有限公司无限连带责任保证\r\n3、赣州某广告传媒有限公司承担回购及连带担保责任', '50000.00', '7.00', 'PJZB2217', '17', '2018-01-09 09:19:09', null);
INSERT INTO `t_borrowdetail` VALUES ('13', '2018010911130120171020160651075.jpg', '2018010911130120171020160658574.jpg', '2018010911130120171020160707559.jpg', '2018010911130120171020160714135.jpg', '其他目的', '经营性收入', '赣州市***贸易有限公司成立于2014-11-11，注册资金500万元，经营范围：玻璃制品及原材料、化工材料（危险化学品除外）、光伏组件、光伏材料及辅材、机械设备、五金建材、电子产品批发、零售。本次借款主要用采购焦锑酸钠，该企业借款金额为100万元，第一期50万元，期限3个月，本平台为此借款提供服务。', '赣州市***贸易有限公司是 江西**光伏玻璃有限公司上下游供应链关键环节，后者是赣州市于2011年引进的以光伏玻璃生产、加工、销售的民营企业，到目前为止总投资达2.2亿元，土地面积250亩，拥有员工230人，是赣州唯一生产光伏玻璃企业，被列入省战略性新兴产业,赣州市主攻工业三年翻翻前30名企业。公司计划总投资6亿元，一期于2013年已经投资2.2亿元建成投产日产250吨光伏玻璃生产线，现正在积极筹划建设二期日产600吨光伏玻璃生产线。江西**光伏玻璃有限公司为赣州市***贸易有限公司借款提供无限连带责任担保，并提供上市公司500w应收账款质押，已在中证网登记为凭证。', '1、 赣州市***贸易有限公司股东周*承担无限连带责任担保；\r\n2、 江西**光伏玻璃有限公司提供上市公司500w应收账款质押，中证网登记证明编号：0405 6452 0004 8678 1797；\r\n3、 江西**光伏的所有股东周*、黄**承担无限连带责任担保；', '6000.00', '11.00', 'PJZB3118', '18', '2018-01-09 11:11:46', null);
INSERT INTO `t_borrowdetail` VALUES ('18', '2018011520385520170905174021440.jpg', '2018011520385520170905174031117.jpg', '2018011520385520170905174039936.jpg', '2018011520385520170906090214574.jpg', '资金周转', '经营性收入', '本次借款主要用于二甲医院事业部配套资金，目前企业与赣州某管理有限公司（国企）签署战略合作协议，成立二甲医院事业部，为二甲医院提供药品及医疗器械，需筹集配套资金，该企业借款金额为100万元，第一期50万元，借款期限3个月，本次借款为续借，本平台为此借款提供服务。\r\n江西某医药有限公司创建于2006年12月份。注册资本2100万元，实收资本2100万元，股东分别是黄**，占股95.24%；赣州某管理有限公司（国企），占股4.76%。主要经营范围为生物制品、中成药、化学原料药、化学药制剂、抗生素原料药、抗生素制剂、生化药品（凭药品经营许可证经营）；II类（凭第二类医疗器械经营备案书经营）、III类医疗器械批发（凭医疗器械经营许可证经营）。公司快速发展，截止至2017年6月，江西某医药有限公司资产总计13023.72万元，2017年1-6月累计营业收入5649.93万元，净利润395.22万元。净利润率为7.00%。\r\n目前主营药品批发，员工120多人，占地31亩，建筑面积15000平方米。公司从购地、土地平整、土建后于2009年11月29日取得了《药品经营许可证》、于2010年2月22日取得了《药品经营质量管理规范认证证书》，于2010年3月26日取得了《医疗器械经营企业许可证》，机2010年3月公司顺利进入经营阶段。\r\n公司运营至今，与全国2100多家上游供应商（药厂）家建立了业务联系。同时经营品种逐步多样化，目前经营的医药品种约8000余种，形成了200多家医疗机构（含赣州18个县市区的卫生院）、1000多家药店的批发销售网络体系。', '本次借款主要用于二甲医院事业部配套资金，目前企业与赣州某管理有限公司（国企）签署战略合作协议，成立二甲医院事业部，为二甲医院提供药品及医疗器械，需筹集配套资金，该企业借款金额为100万元，第二期50万元，借款期限3个月，本次借款为第二期，本平台为此借款提供服务。', '1、保证借款资金的安全，做到专款专用，借款资金必需进入二甲事业部专用账户\r\n2、黄**、黄**夫妇提供连带责任担保\r\n3、股东赣州某管理有限公司（国企）同意出具股东会决议', '1000.00', '6.00', 'PJZB1224', '24', '2018-01-15 20:37:29', null);
INSERT INTO `t_borrowdetail` VALUES ('19', '2018011520432420170930165916235.jpg', '2018011520432420170930165929778.jpg', '2018011520432420170930165939032.jpg', '2018011520432420170930170049775.jpg', '补充流动资金', '商业承兑汇票到期资金', '原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒大地产集团有限公司全资子公司赣州恒大地产有限公司地产项目广告设计、制作安装、媒体传播等。原债权方将恒大集团所开具商业承兑汇票转让给某保理公司，恒大集团信用状况良好，资产实力充裕。本项目本次融资金额为273961元，融资期6个月。', '本期投资标的为某保理公司转让出的编号为 YC2017TD0008 的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为恒大地产集团有限公司。', '1、项目到期由某保理公司回购\r\n2、恒大地产集团有限公司无限连带责任保证\r\n3、赣州某广告传媒有限公司承担回购及连带担保责任', '6200.00', '5.00', 'PJZB2325', '25', '2018-01-15 20:41:59', null);
INSERT INTO `t_borrowdetail` VALUES ('20', '2018011520461320170825174257384.jpg', '2018011520461320170825174329568.jpg', '2018011520461320170825174340271.jpg', '2018011520461320170825165843561.jpg', '资金周转', '商业承兑汇票到期资金', '原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒大地产集团有限公司全资子公司赣州恒大地产有限公司地产项目广告设计、制作安装、媒体传播等。原债权方将恒大集团所开具商业承兑汇票转让给某保理公司，恒大集团信用状况良好，资产实力充裕。本项目本次融资金额为140000元，融资期6个月。', '本期投资标的为某保理公司转让出的编号为 YC2017TD0007 的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为恒大地产集团有限公司。', '1、项目到期由某保理公司回购；\r\n2、恒大地产集团有限公司无限连带责任保证；\r\n3、赣州某广告传媒有限公司承担回购及连带担保责任。', '2500.00', '6.00', 'PJZB3126', '26', '2018-01-15 20:44:49', null);
INSERT INTO `t_borrowdetail` VALUES ('21', '2018011520481420170815181343450.jpg', '2018011520481420170815181352001.jpg', '2018011520481420170815181630879.jpg', '2018011520481420170815181449287.jpg', '资金周转', '商业承兑汇票到期资金', '本期投资标的为某保理公司转让出的编号为 YC2017TD0006 的保理服务合同对应的商业承兑汇票债权，原债权借款人某建设工程有限公司。保函承兑机构为恒大地产集团有限公司。', '原债权主要经营为工程设计、房屋建筑、市政、园林、水利、路桥、土石方、装饰、装修、建筑幕墙、钢结构、消防设施、体育设施、电子音响设施、机电安装、智能化工程设计与施工、房地产开发；农业开发；招投标代理；工程造价咨询；广告设计、制作、代理、发布、专业生产不保家具、五金建材销售、国内一般贸易（法律、行政法规禁止的项目除外、法律、行政法规限制的项目需取得行业许可证后方可经营）（依法须经批准的项目，经相关部门批准后方可开展经营活动）集团公司注册资本5000万元。承接恒大地产集团有限公司全资子公司赣州恒大地产有限公司地产项目地基与房屋建筑、土石方工程等。原债权方将恒大集团承诺承兑商业承兑汇票转让给某保理公司，恒大集团信用状况良好，资产实力充裕。本项目本次融资金额为164628.00元，融资期6个月。', '1、项目到期由某保理公司回购；\r\n2、恒大地产集团有限公司无限连带责任保证；\r\n3、某建设工程有限公司承担回购及连带担保责任。', '3000.00', '5.00', 'PJZB3127', '27', '2018-01-15 20:46:49', null);
INSERT INTO `t_borrowdetail` VALUES ('22', '2018011521242320170815181343450.jpg', '2018011521242320170815181352001.jpg', '2018011521242320170815181630879.jpg', '2018011521242320170815181449287.jpg', '补充流动资金', '商业承兑汇票到期资金', '原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒大地产集团有限公司全资子公司赣州恒大地产有限公司地产项目广告设计、制作安装、媒体传播等。原债权方将恒大集团所开具商业承兑汇票转让给某保理公司，恒大集团信用状况良好，资产实力充裕。本项目本次融资金额为465437.4元，融资期3个月。', '本期投资标的为某保理公司转让出的编号为 YC2017TD0005 的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为恒大地产集团有限公司。', '1、项目到期由某保理公司回购； 2、恒大地产集团有限公司无限连带责任保证； 3、赣州某广告传媒有限公司承担回购及连带担保责任。', '5600.00', '7.00', 'PJZB1228', '28', '2018-01-15 21:22:59', null);
INSERT INTO `t_borrowdetail` VALUES ('23', '201801222036073f0c20e52f75441cb054a52ee3efdae0.jpg', '20180122203607u=1150110500,2353771738&fm=27&gp=0.jpg', '20180122203607timg.jpg', '20180122203607view.jpg', '投资', '正经收入', '====================', '=【】=【‘', '=--=0=-0', '0.00', '7.00', 'PJZB2129', '29', '2018-01-22 20:34:32', null);
INSERT INTO `t_borrowdetail` VALUES ('24', '201801231009291.JPG', '201801231009292.JPG', '201801231009293.JPG', '201801231009294.jpg', '资金周转 ', '正常上班', '对方过后', '委托加工', '而飞机杯', '0.00', '6.00', 'PJZB2130', '30', '2018-01-23 10:09:16', null);

-- ----------------------------
-- Table structure for t_bz
-- ----------------------------
DROP TABLE IF EXISTS `t_bz`;
CREATE TABLE `t_bz` (
  `bzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称',
  `state` tinyint(4) DEFAULT NULL COMMENT '标种状态(0为可用，1为不可用)',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bz
-- ----------------------------
INSERT INTO `t_bz` VALUES ('1', '恒金宝', '0');
INSERT INTO `t_bz` VALUES ('2', '多金宝', '0');
INSERT INTO `t_bz` VALUES ('3', '普金宝', '0');
INSERT INTO `t_bz` VALUES ('17', '新手标', '0');

-- ----------------------------
-- Table structure for t_dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `t_dxmodel`;
CREATE TABLE `t_dxmodel` (
  `dxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dxmodel
-- ----------------------------
INSERT INTO `t_dxmodel` VALUES ('121', '您的验证码是：000000。请不要把验证码泄露给其他人。');
INSERT INTO `t_dxmodel` VALUES ('122', '您的验证码是：000000。请不要把验证码泄露给其他人。');
INSERT INTO `t_dxmodel` VALUES ('123', '您的验证码是：000000。请不要把验证码泄露给其他人。');
INSERT INTO `t_dxmodel` VALUES ('124', '您的验证码是：000000。请不要把验证码泄露给其他人。');
INSERT INTO `t_dxmodel` VALUES ('125', '您的验证码是：000000。请不要把验证码泄露给其他人。');
INSERT INTO `t_dxmodel` VALUES ('126', '790987');

-- ----------------------------
-- Table structure for t_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `dyid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dynamic
-- ----------------------------
INSERT INTO `t_dynamic` VALUES ('1', '普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》', '2017-12-27 09:27:51', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: justify;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、<span style=\"word-wrap: break-word;\">副院长</span>陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175516_148.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">普金资本总裁 吴鸿先生致欢迎辞</span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"word-wrap: break-word; font-size: 14px;\">&nbsp;刘宁生<span style=\"word-wrap: break-word;\">院长上台发表讲话，他</span>说：一直以来，部分高校存在教育理念滞后、重理论轻实践的问题，导致学生在学校的学习内容和实践环节与企业的需求脱节，难以适应纷繁复杂的社会实际。目前，高校亟需强化实践，彻底解决理论与实践脱节、实践平台短缺等问题，促进学生全面发展，提升人力资本素质。通过此次的校企合作，学生们可以在普金资本精心规划的一系列实践中获得参与企业大型金融项目策划、组织及实施的机会，丰富课余文化生活和对金融产品的运营能力。而普金资本也能以直观形式将金融产品的全流程展现在学生眼前，丰富他们的项目实战经验，将为他们今后走上工作岗位打下坚实的基础。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175535_668.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">&nbsp;刘宁生院长发表讲话</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">上午</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">点</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">30</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">分，揭牌仪式正式开始，普金资本总裁吴鸿先生与刘宁生院长共同揭牌，并签订《校外创新创业实践基地协议书》。会议现场一片欢腾，同学们为此次的合作报以热烈的掌声。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; font-size: 12px; color: rgb(51, 51, 51);\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175550_204.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center; text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136); font-size: 12px;\"><span style=\"word-wrap: break-word;\">揭牌仪式、签订协议</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">签字仪式后，普金资本专门聘请金融专业讲师给现场师生进行了精彩的讲座，如此迅速进入学习状态，刘院长大加赞赏，鼓励同学们勇于创新创业。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175613_929.png\" width=\"640\" height=\"214\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\">精彩讲座</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">此次校企的合作，普金资本将现有的校企合作项目展现给各高校，打通合作通道，为未来企业运营获得更适用、高效的人才夯实了根基，获得更专业的人才培养的途径和方法，有利于普金资本吸收更多、更新、更好的思想，为普金资本科技创新、企业升级铺路。</span></p><p><br/></p>', '20180121201102023.jpg');
INSERT INTO `t_dynamic` VALUES ('2', '【普金资本】校企联手 探寻合作新契机！', '2017-12-27 09:40:12', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: justify;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、<span style=\"word-wrap: break-word;\">副院长</span>陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175516_148.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">普金资本总裁 吴鸿先生致欢迎辞</span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"word-wrap: break-word; font-size: 14px;\">&nbsp;刘宁生<span style=\"word-wrap: break-word;\">院长上台发表讲话，他</span>说：一直以来，部分高校存在教育理念滞后、重理论轻实践的问题，导致学生在学校的学习内容和实践环节与企业的需求脱节，难以适应纷繁复杂的社会实际。目前，高校亟需强化实践，彻底解决理论与实践脱节、实践平台短缺等问题，促进学生全面发展，提升人力资本素质。通过此次的校企合作，学生们可以在普金资本精心规划的一系列实践中获得参与企业大型金融项目策划、组织及实施的机会，丰富课余文化生活和对金融产品的运营能力。而普金资本也能以直观形式将金融产品的全流程展现在学生眼前，丰富他们的项目实战经验，将为他们今后走上工作岗位打下坚实的基础。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175535_668.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">&nbsp;刘宁生院长发表讲话</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">上午</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">点</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">30</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">分，揭牌仪式正式开始，普金资本总裁吴鸿先生与刘宁生院长共同揭牌，并签订《校外创新创业实践基地协议书》。会议现场一片欢腾，同学们为此次的合作报以热烈的掌声。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; font-size: 12px; color: rgb(51, 51, 51);\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175550_204.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center; text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136); font-size: 12px;\"><span style=\"word-wrap: break-word;\">揭牌仪式、签订协议</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">签字仪式后，普金资本专门聘请金融专业讲师给现场师生进行了精彩的讲座，如此迅速进入学习状态，刘院长大加赞赏，鼓励同学们勇于创新创业。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175613_929.png\" width=\"640\" height=\"214\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\">精彩讲座</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">此次校企的合作，普金资本将现有的校企合作项目展现给各高校，打通合作通道，为未来企业运营获得更适用、高效的人才夯实了根基，获得更专业的人才培养的途径和方法，有利于普金资本吸收更多、更新、更好的思想，为普金资本科技创新、企业升级铺路。</span></p><p><br/></p>', '20180121201045367.jpg');
INSERT INTO `t_dynamic` VALUES ('3', '2017年举办江西互联网金融行业高管人员培训班', '2018-01-09 15:26:34', '<p><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">为帮助我省互联网金融行业高管人员及时了解中央及地方相关行业信息，提升对数据安全、客户信息安全的风险防患意识，获悉互联网金融行业最新科技信息，经研究，江西省互联网金融协会于2017年6月15-16日在南昌举办了江西互联网金融行业高管人员培训班。省金融办、各设区市、县（市、区）金融办（局），江西省互联网金融协会及江西省小额贷款行业协会的部分会员单位共计59家单位的近百人参加了培训班。普金资本受邀参加本次培训，深入学习监管部门对行业合规建设的新思路和新要求。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><img src=\"https://www.pujinziben.com:8443/attached/image/2017/20170621/201706211531513579.jpg\" alt=\"\"/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"word-wrap: break-word;\"></span>培训现场</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style=\"word-wrap: break-word; line-height: 2.5;\">本次培训受到了省政府金融办的高度重视，省金融办领导特委派保险非银处科长叶超同志到会为学员作政策解读。本次培训还特邀江西省互联网金融协会会长、北京大刚信息科技有限公司董事长周健，读秒CEO周静、江西神州信息安全评估中心特派员刘燚、万谦及吴雷现场授课。培训期间，参训学员与授课老师进行了热烈的互动交流。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; line-height: 2.5; color: rgb(229, 102, 0);\"><img src=\"https://www.pujinziben.com:8443/attached/image/2017/20170621/201706211533048055.jpg\" alt=\"\"/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0); line-height: 2.5;\">老师授课中</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;</span></span><span style=\"word-wrap: break-word; line-height: 2.5;\">本次培训，时间安排一天半。在有限的授课时间内，叶超科长与学员们面对面讲解了我省互金行业清理整顿工作的进程，平台如何根据《网络借贷信息中介机构业务活动管理暂行办法》积极规范整改，并逐步完成银行资金存管接入、备案登记等工作，以及未来互联网金融行业发展的方向。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; line-height: 2.5; color: rgb(229, 102, 0);\"><img src=\"https://www.pujinziben.com:8443/attached/image/2017/20170621/201706211533296408.jpg\" alt=\"\"/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0); line-height: 2.5;\">老师授课中</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;周健会长为学员们带来了精彩的资讯分享及行业分析，并重点阐述了对网贷行业规范及法律文件的理解。周静CEO解读了智能信贷科技的核心、基础、风控模型的建立及具体操作以及首个以独立信贷技术服务商作为主要发起人的公募互联网金融ＡＢＳ。江西神州信息安全评估中心特派员们现场演示了计算机渗透技术，并解析了互联网金融网络信息安全风险防范及等级测评和信息安全保障体系建设。内容丰富，安排紧凑的培训授课获得学员的一致认可。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com:8443/attached/image/2017/20170621/201706211533513002.jpg\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"word-wrap: break-word; line-height: 2.5;\">受邀参加本次培训会的普金资本相关负责人表示：未来，普金资本将继续规范发展、参与行业自律，并结合金融与大数据征信手段不断提升风控能力和效率，多措并举，以维护投资人和借款人的合法权益为前提，积极拥抱监管政策，务求为行业规范发展做出更多的贡献。</span></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;普金资本<br/></p>', '20180121201016223.jpg');
INSERT INTO `t_dynamic` VALUES ('4', '普金资本通过国家信息安全等级保护三级认证', '2018-01-09 16:20:49', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: justify;\"><span style=\"word-wrap: break-word;\">&nbsp;<span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、<span style=\"word-wrap: break-word;\">副院长</span>陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175516_148.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">普金资本总裁 吴鸿先生致欢迎辞</span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"word-wrap: break-word; font-size: 14px;\">&nbsp;刘宁生<span style=\"word-wrap: break-word;\">院长上台发表讲话，他</span>说：一直以来，部分高校存在教育理念滞后、重理论轻实践的问题，导致学生在学校的学习内容和实践环节与企业的需求脱节，难以适应纷繁复杂的社会实际。目前，高校亟需强化实践，彻底解决理论与实践脱节、实践平台短缺等问题，促进学生全面发展，提升人力资本素质。通过此次的校企合作，学生们可以在普金资本精心规划的一系列实践中获得参与企业大型金融项目策划、组织及实施的机会，丰富课余文化生活和对金融产品的运营能力。而普金资本也能以直观形式将金融产品的全流程展现在学生眼前，丰富他们的项目实战经验，将为他们今后走上工作岗位打下坚实的基础。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175535_668.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">&nbsp;刘宁生院长发表讲话</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">上午</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">点</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">30</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">分，揭牌仪式正式开始，普金资本总裁吴鸿先生与刘宁生院长共同揭牌，并签订《校外创新创业实践基地协议书》。会议现场一片欢腾，同学们为此次的合作报以热烈的掌声。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; font-size: 12px; color: rgb(51, 51, 51);\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175550_204.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center; text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136); font-size: 12px;\"><span style=\"word-wrap: break-word;\">揭牌仪式、签订协议</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">签字仪式后，普金资本专门聘请金融专业讲师给现场师生进行了精彩的讲座，如此迅速进入学习状态，刘院长大加赞赏，鼓励同学们勇于创新创业。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175613_929.png\" width=\"640\" height=\"214\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\">精彩讲座</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">此次校企的合作，普金资本将现有的校企合作项目展现给各高校，打通合作通道，为未来企业运营获得更适用、高效的人才夯实了根基，获得更专业的人才培养的途径和方法，有利于普金资本吸收更多、更新、更好的思想，为普金资本科技创新、企业升级铺路。</span></p><p><br/></p>', '20180121200955045.png');
INSERT INTO `t_dynamic` VALUES ('5', '普金资本与汇付天下、益金所洽谈战略合作', '2018-01-14 20:41:33', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\">7月28日，普金资本常务副总裁季晓春赴汇付天下上海总部考察并洽谈业务合作事宜。当日率先考察了汇付天下总部大楼，随后拜访了汇付天下控股的成都益金所总经理黄华波先生，双方在总结既往合作的基础上对各自经营情况进行了交流，并就今后的战略合作进行了沟通、对业务关键环节进行了明确。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp; &nbsp;&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\"><img src=\"https://www.pujinziben.com/attached/image/2017/20170728/201707282125325809.jpg\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">汇付天下上海总部</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com/attached/image/2017/20170728/201707282125542362.jpg\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">所获荣誉资质</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;益金所定位于打造以固定收益类金融产品交易为主要特色的国内一流交易平台，服务资产证券化，联合融资方、发行方、承销方，共同打造全国固定收益产品流通市场，降低流通成本，依法合规运营，构建严格的风险防范体系，让企业以较低的融资成本获得融资，让投资人在资金安全的前提下获得投资收益。&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;益金所构建了包含融资主体评估、融资需求评估、融资方案评估、财务承受力评估、营收和竞争力评估、基础资产评估六大构面的调研系统，益金所还建立了产品挂牌后的五级风险警示机制，以期尽早发现融资方可能暴露的风险事件，并作适当处置。同时，辅以风险准备金和风险保证金制度，从而最大可能保护投资方的利益。基于风控体系的建设，益金所将努力成为全方位金融服务供应商，除了交易功能之外，益金所还可以给企业提供包括内控和上市辅导的财务顾问服务以及融资方案设计和挂牌的投行服务。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;益金所总经理黄华波指出：益金所与地方政府、央国企、同业金融机构紧密合作，凭借大风控大中台的基础架构优势，不但提供优质资产，也能将手握的这些优质资产，鲜明透彻层层剥解呈现到资本市场上，在资产端与资金端直接搭建起信息沟通的“高速公路”，将这个市场做通、做活、做透，打造一个接地气的金融环境。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com/attached/image/2017/20170728/201707282126172614.jpg\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">益金所总经理黄华波与普金资本常务副总裁季晓春 合影</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">&nbsp;&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;此次洽谈合作，双方都拿出百分之百的诚意，汇付天下将给予普金资本大力支持，共同打造金融科技的创新及支付服务的升级；同时，普金资本与益金所初步的交流，为双方的后续合作奠定了坚实基础，后续将加强互金业务交流，为社会各界客户提供优质、专业的金融产品和服务，推进行业健康发展，开拓互金更广阔的市场。</p><p><br/></p>', '20180121200935866.png');
INSERT INTO `t_dynamic` VALUES ('6', '热烈祝贺普金资本荣膺普惠金融协会常务副会长单位', '2018-01-14 20:58:17', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">7月17日，赣州市普惠金融协会秘书长刘荣龙亲临普金资本，亲自授牌普金资本为赣州市普惠金融协会常务副会长单位，以肯定普金资本自成立以来在赣州地区互联网金融领域的突出表现。</span><br/><br/></p><p><img src=\"http://www.pujinziben.com/attached/image/2017/20170718/201707181721508220.jpg\" alt=\"\"/></p><p>普金资本副总裁林立标（左）与市普惠金融协会秘书长刘荣龙（右）合影</p><p><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 赣州市普惠金融协会是依照国家有关政策法规成立的，由多家小额贷款公司、融资性担保公司、互联网金融企业共同发起组建的行业社团组织，赣州市金融工作局为业务主管单位。协会以开展行业自律、维护行业利益、提供会员服务、促进行业发展为宗旨。遵守国家宪法、法律、法规和经济金融方针政策，认真履行自律、维权、协调、服务职能。强化组织协调和服务水平，优化会员依法合规经营环境，维护会员合法权益，提高普惠金融行业素质，提升行业整体形象，促进普惠金融行业健康发展。</span><br/><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 在当日刘荣龙秘书长一行对普金资本的到访中，普金资本副总裁林立标等全程接待陪同，双方就金融创新与监管、公司发展模式、协会运营现状及模式等方面进行了深入的探讨和交流，并在互联网金融发展问题上达成系列共识。此次赣州普惠金融协会实地考察普金资本并授予“常务副会长单位”荣誉，一来反映了赣州苏区对新兴互联网金融发展的重视，同时也充分认可了普金资本在中小企业融资方面的重要作用，给普金资本及平台投资人以莫大信心。</span><br/><br/></p><p><img src=\"http://www.pujinziben.com/attached/image/2017/20170718/201707181722219748.jpg\" alt=\"\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;显然正是由于不断的发展与进步，普金资本才能在广大平台用户的一致好评中，受到越来越多权威金融机构的认可。随着本次加入市普惠金融协会，公司势必将建立更加完备的风控模式，继续肩负起对社会投资者的责任。而依托协会在相关领域的影响力，普金资本不仅逐步发展为一支正规化、专业化的金融行业主力军，更将迈入前所未有的快速发展新阶段！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 未来，普金资本将会更加积极的投身到协会的各项工作当中，努力实现优势互补、合作共赢、协同创新、规范自律，与业界携手共同为赣州地区互联网金融的健康发展，为开创金融信息产业发展的新局面贡献自己的力量。</span></p><p><br/></p>', '20180121200916020.jpg');
INSERT INTO `t_dynamic` VALUES ('7', '【喜报】普金资本获准通过全国公安机关互联网网站备案', '2018-01-19 10:08:40', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; line-height: 2.5;\">2017年2月22日，普金资本正式获准通过公安部互联网金融网站安全备案，标志着普金资本在践行合规网络建设上迈出重要一步，不断提高平台网络信息安全系数，平台合规化更进一步。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/attached/image/2017/20170222/20170222171929256.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp; 根据中国银行业监督管理委员会《网络借贷信息中介机构业务活动管理暂行办法》</span><span style=\"word-wrap: break-word; line-height: 2.5;\">银监会令</span><span style=\"word-wrap: break-word; line-height: 2.5;\">[2016]1</span><span style=\"word-wrap: break-word; line-height: 2.5;\">号&nbsp;</span><span style=\"word-wrap: break-word; line-height: 2.5;\">有关规定，网络借贷信息中介机构应当按照国家网络安全相关规定和国家信息安全等级保护制度的要求，开展信息系统定级备案和等级测试，具有完善的防火墙、入侵检测、数据加密以及灾难恢复等网络安全设施和管理制度，建立信息科技管理、科技风险管理和科技审计有关制度，配置充足的资源，采取完善的管理控制措施和技术手段保障信息系统安全稳健运行，保护出借人与借款人的信息安全。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"word-wrap: break-word; line-height: 2.5;\">普金资本根据公安部对计算机信息网络安全保护和管理的要求，通过提报申请、身份验证、技术安全、业务合规、内容可信等信息核实及现场检查与约谈，普金资本顺利备案成功！通过公安机关网站备案后，公安机关可以定期检查平台的运营情况，促进平台不断完善管理控制措施和技术手段保障信息系统安全稳健运行，保护出借人与借款人的信息安全。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"word-wrap: break-word; line-height: 2.5;\">普金资本致力于打造“专业、稳健、诚信、高效”的互联网金融平台，网站信息安全是发展的基础性保障，并一直以来积极向行业政策合规化要求靠拢，此次主动向公安部互联网金融网站安全备案即是朝着安全、稳健、合规化经营的又一例证。</span></p><p><br/></p>', '20180121200843792.jpg');
INSERT INTO `t_dynamic` VALUES ('8', '普金资本拥抱金融整改合规合法经营', '2018-01-19 19:52:46', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">2018年1月18日下午，关于江西省互联网金融网络借贷及P2P平台整改座谈会在赣州市发展投资控股集团总部会议室召开，会议由省互联网金融协会龚思女士主持召开，省互联网金融协会郑秘书长列席，市协会秘书长参会，我司总裁吴鸿出席会议，一同参加座谈会的有融通资产，惠众金融，真鑫贷，创绩宝等同行业优秀公司，各方就整改政策公司经营情况相互交流沟通。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com/upload/mediareport/2018/1/20180119171941_822.jpg\" width=\"600\" height=\"450\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">会议期间，网络借贷P2P整改验收是本次网贷风险专项整改工作的重要环节，各公司应高度重视和认识，切实落实属地管理职责，做好组织管理和风险预案，各机构、成立小组将严格把关组织协调后续整改验收工作，其中由省互联网金融协会刘芳女士解读省金融办关于省互联网金融整改政策解读，传达精神。其中各社区市验收小组应以《办法》及相关监督文件及本通知验收标准，从严开展网贷机构的验收工作和关键问题：根据互联网金融风险专项整治领导小组要求，对在《办法》发布之日（2016年8月24日）后新设立的网贷机构、新从事的网贷机构、自始未纳入本次网贷整治机构以及规定的十三禁止性行为单一借款上限、房地产首付贷，校园贷，现在金贷等不符合规范管理整顿的将一律不予验收，网贷机构应根据《网贷资金存管指引》开展资金存管和开展业务合作，在验收前按照《网贷信息中介机构业务活动信息披露指引》进行完整的信息披露，业务进行验收。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com/upload/mediareport/2018/1/20180119172028_136.png\" width=\"600\" height=\"450\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\">其次各互联网金融高管代表发表讲话，介绍公司经营状况和汇报工作以及各公司整改进度存在的相关问题，各公司代表发表言论和交流，普金资本总裁吴鸿对此次交流会议即按照公司的情况发表讲话，“普金资本”国企参股，第三方银行存管，致力于打造“专业、稳健、诚信、高效的互联网金融平台，以服务客户利益最大化为经营理念，普金资本对于此次的网贷整改也应相应采取一系列措施，严格按照程序规范化，并且成立整改小组对系统合理保护客户资金以及信息安全、防止黑客攻击和系统中断等一系列安全问题进行了严格监管，积极筹备验收整改问题，更好的做到合理、合法、高效的经营模式。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"https://www.pujinziben.com/upload/mediareport/2018/1/20180119172054_849.jpg\" width=\"600\" height=\"449\" alt=\"\"/></p><p>2018年3月15日之前各设区市验收小组完成网贷机构初步验收工作，将验收意见及相关材料提交省联合整改验收小组，2018年4月底之前省联合整改验收小组完成所有网贷机构的现场复核及备案，最后省协会秘书长郑秘书长发标总结讲话，座谈会圆满成功。</p><p><br/></p>', '20180122150124369.jpg');

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(50) DEFAULT NULL,
  `furl` varchar(500) DEFAULT NULL COMMENT '链接',
  `fpic` varchar(500) DEFAULT NULL COMMENT '图片',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES ('11', '赣州城投集团', 'http://www.gzctgroup.cn/', '3f334383-47a5-4771-a72d-23ee4fe79922.jpg', '2018-01-11');
INSERT INTO `t_friend` VALUES ('12', '黑马地产', 'http://www.heimadc.com/', 'f467730a-b91a-4302-bc95-2284b041e6f0.jpg', '2018-01-11');
INSERT INTO `t_friend` VALUES ('13', '汇付天下', 'http://www.chinapnr.com/', '0a8a1090-d09c-49ac-bd7d-82a47c9d0b7b.jpg', '2018-01-11');
INSERT INTO `t_friend` VALUES ('14', '恒大集团', 'http://www.evergrande.com/', '15fbb38e-981f-4972-91e2-c061cf41ab43.jpg', '2018-01-11');
INSERT INTO `t_friend` VALUES ('15', '融途网', 'http://www.erongtu.com/', 'e3243a20-7f6e-426a-a4d5-59be91f2149a.jpg', '2018-01-11');
INSERT INTO `t_friend` VALUES ('16', '江西省互联网金融协会', 'http://www.jxifa.org.cn/', '1df2471d-2ffb-4cd4-b7e9-b419735cd439.png', '2018-01-11');

-- ----------------------------
-- Table structure for t_hkb
-- ----------------------------
DROP TABLE IF EXISTS `t_hkb`;
CREATE TABLE `t_hkb` (
  `hkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT 'uid为前台用户表t_user主键字段',
  `rname` varchar(20) NOT NULL COMMENT '真实姓名',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `rnum` int(11) DEFAULT '0' COMMENT '已还期数',
  `tnum` int(11) DEFAULT '0' COMMENT '总期数',
  `ytime` datetime DEFAULT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称，bzname为t_bz表里面标种名称',
  `ybx` decimal(10,2) DEFAULT '0.00' COMMENT '应还本息',
  `rbx` decimal(10,2) DEFAULT '0.00' COMMENT '已还本息',
  `ylx` decimal(10,2) DEFAULT '0.00' COMMENT '应还利息',
  `rlx` decimal(10,2) DEFAULT '0.00' COMMENT '已还利息',
  `ybj` decimal(10,2) DEFAULT '0.00' COMMENT '应还本金',
  `rbj` decimal(10,2) DEFAULT '0.00' COMMENT '已还本金',
  `yfx` decimal(10,2) DEFAULT '0.00' COMMENT '应还罚息',
  `rfx` decimal(10,2) DEFAULT '0.00' COMMENT '已还罚息',
  `yucount` int(11) DEFAULT '0' COMMENT '逾期次数',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款状态（0未还款，1已还款）',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id ，t_borrowapply主键id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '贷后负责人 t_huser后台用户id字段',
  `djq` int(11) DEFAULT '1' COMMENT '第几期',
  `iszd` tinyint(4) DEFAULT '1' COMMENT '是否为自动还款1为不自动，2为自动',
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hkb
-- ----------------------------
INSERT INTO `t_hkb` VALUES ('2', '2', '李四', 'PJZB2217', '0', '1', '2018-09-09 10:58:33', null, '多金宝', '52333.33', '0.00', '2333.33', '0.00', '50000.00', '0.00', '0.00', '0.00', '0', '1', '17', null, '1', '1', '1');
INSERT INTO `t_hkb` VALUES ('3', '2', '李四', 'PJZB3118', '1', '10', '2018-02-09 11:27:38', '2018-01-11 19:51:08', '普金宝', '630.66', '630.66', '55.00', '55.00', '575.66', '575.66', '0.00', '0.00', '0', '2', '18', null, '1', '1', '1');
INSERT INTO `t_hkb` VALUES ('4', '2', '李四', 'PJZB3118', '1', '10', '2018-03-09 11:27:38', '2018-01-11 20:03:12', '普金宝', '630.66', '630.66', '49.72', '49.72', '580.94', '580.94', '0.00', '0.00', '0', '2', '18', null, '1', '2', '1');
INSERT INTO `t_hkb` VALUES ('5', '2', '李四', 'PJZB3118', '1', '10', '2018-04-09 11:27:38', '2018-01-12 08:26:28', '普金宝', '630.66', '630.66', '44.40', '44.40', '586.26', '586.26', '0.00', '0.00', '0', '2', '18', null, '1', '3', '1');
INSERT INTO `t_hkb` VALUES ('6', '2', '李四', 'PJZB3118', '1', '10', '2018-05-09 11:27:38', '2018-01-15 16:01:07', '普金宝', '630.66', '630.66', '39.02', '39.02', '591.64', '591.64', '0.00', '0.00', '0', '2', '18', null, '1', '4', '1');
INSERT INTO `t_hkb` VALUES ('7', '2', '李四', 'PJZB3118', '1', '10', '2018-06-09 11:27:38', '2018-01-18 15:34:11', '普金宝', '630.66', '630.66', '33.60', '33.60', '597.06', '597.06', '0.00', '0.00', '0', '2', '18', null, '1', '5', '1');
INSERT INTO `t_hkb` VALUES ('8', '2', '李四', 'PJZB3118', '0', '10', '2018-07-09 11:27:38', null, '普金宝', '630.66', '0.00', '28.13', '0.00', '602.53', '0.00', '0.00', '0.00', '0', '1', '18', null, '1', '6', '1');
INSERT INTO `t_hkb` VALUES ('9', '2', '李四', 'PJZB3118', '0', '10', '2018-08-09 11:27:38', null, '普金宝', '630.66', '0.00', '22.60', '0.00', '608.06', '0.00', '0.00', '0.00', '0', '1', '18', null, '1', '7', '1');
INSERT INTO `t_hkb` VALUES ('10', '2', '李四', 'PJZB3118', '0', '10', '2018-09-09 11:27:38', null, '普金宝', '630.66', '0.00', '17.03', '0.00', '613.63', '0.00', '0.00', '0.00', '0', '1', '18', null, '1', '8', '1');
INSERT INTO `t_hkb` VALUES ('11', '2', '李四', 'PJZB3118', '0', '10', '2018-10-09 11:27:38', null, '普金宝', '630.66', '0.00', '11.41', '0.00', '619.25', '0.00', '0.00', '0.00', '0', '1', '18', null, '1', '9', '1');
INSERT INTO `t_hkb` VALUES ('12', '2', '李四', 'PJZB3118', '0', '10', '2018-11-09 11:27:38', null, '普金宝', '630.66', '0.00', '5.73', '0.00', '624.93', '0.00', '0.00', '0.00', '0', '1', '18', null, '1', '10', '1');

-- ----------------------------
-- Table structure for t_home
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `hid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pic1` varchar(50) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(50) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(50) DEFAULT NULL COMMENT '轮播图3',
  `ewm` varchar(100) DEFAULT NULL COMMENT '二维码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `l1` varchar(100) DEFAULT NULL COMMENT '链接1',
  `l2` varchar(100) DEFAULT NULL COMMENT '链接2',
  `l3` varchar(100) DEFAULT NULL COMMENT '链接3',
  `l4` varchar(50) DEFAULT NULL COMMENT '链接4',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_home
-- ----------------------------
INSERT INTO `t_home` VALUES ('8', '20180121202523196.jpg', '20180121202523218.jpg', '20180121202523235.jpg', '20180121202523252.png', '40440', 'http://localhost:8080/media/nopage?mid=1', 'http://localhost:8080/media/nopage?mid=2', 'http://localhost:8080/dynamic/nopage?dyid=1', null);
INSERT INTO `t_home` VALUES ('9', '20180122095207865.jpg', '20180122095209725.jpg', '20180122095211462.jpg', '20180122095212975.png', '888-999', 'http://localhost:8080/dynamic/nopage?dyid=1', 'http://localhost:8080/notice/nopage?nid=1', 'http://localhost:8080/media/nopage?mid=2', null);

-- ----------------------------
-- Table structure for t_huser
-- ----------------------------
DROP TABLE IF EXISTS `t_huser`;
CREATE TABLE `t_huser` (
  `huid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别（0男，1女）',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `pwd` varchar(50) DEFAULT NULL,
  `huname` varchar(50) DEFAULT NULL COMMENT '用户名，相当于昵称',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huser
-- ----------------------------
INSERT INTO `t_huser` VALUES ('1', '张三', '0', '11111111111', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '11111111111@qq.com', null, null);
INSERT INTO `t_huser` VALUES ('2', '李四', '1', '13767714408', '4QrcOUm6Wau+VuBX8g+IPg==', '四儿', '126473847@qq.com', null, null);
INSERT INTO `t_huser` VALUES ('3', '刘丽', '1', '14536748693', '4QrcOUm6Wau+VuBX8g+IPg==', '丽丽', '123456782@qq.com', null, null);
INSERT INTO `t_huser` VALUES ('5', '吴军', '0', '16849387591', '4QrcOUm6Wau+VuBX8g+IPg==', '小军', '174859378@qq.com', null, null);
INSERT INTO `t_huser` VALUES ('6', '张筱', '1', '18968574819', '4QrcOUm6Wau+VuBX8g+IPg==', '筱筱', '127890135@qq.com', null, null);

-- ----------------------------
-- Table structure for t_jklx
-- ----------------------------
DROP TABLE IF EXISTS `t_jklx`;
CREATE TABLE `t_jklx` (
  `lxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lxname` varchar(20) DEFAULT NULL COMMENT '借款名称，如（先本后息，先息后本，等额本息，等额本金）',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0可用，1不可用）',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jklx
-- ----------------------------
INSERT INTO `t_jklx` VALUES ('1', '信用贷', '0');
INSERT INTO `t_jklx` VALUES ('2', '抵押贷', '0');
INSERT INTO `t_jklx` VALUES ('3', '净值贷', '0');
INSERT INTO `t_jklx` VALUES ('4', '无息贷', '0');

-- ----------------------------
-- Table structure for t_jur
-- ----------------------------
DROP TABLE IF EXISTS `t_jur`;
CREATE TABLE `t_jur` (
  `jid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `jurl` varchar(50) DEFAULT NULL COMMENT '权限URL',
  `content` varchar(500) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jur
-- ----------------------------
INSERT INTO `t_jur` VALUES ('5', 'role:save', '角色新增');
INSERT INTO `t_jur` VALUES ('6', 'role:page', '角色查看');
INSERT INTO `t_jur` VALUES ('7', 'role:update', '角色修改');
INSERT INTO `t_jur` VALUES ('8', 'roleUser:page', '角色用户查看');
INSERT INTO `t_jur` VALUES ('9', 'roleUser:save', '角色用户新增');
INSERT INTO `t_jur` VALUES ('10', 'roleUser:update', '角色用户修改');
INSERT INTO `t_jur` VALUES ('11', 'recommend:page', '推荐人列表查看');
INSERT INTO `t_jur` VALUES ('12', 'recommend:remove', '推荐人删除');
INSERT INTO `t_jur` VALUES ('13', 'recommend:export', '推荐人导出Excel');
INSERT INTO `t_jur` VALUES ('14', 'roleUser:remove', '角色用户的删除');
INSERT INTO `t_jur` VALUES ('23', 'jur:import', '权限的导入');
INSERT INTO `t_jur` VALUES ('24', 'jur:page', '权限的查看');
INSERT INTO `t_jur` VALUES ('25', 'jur:update', '权限的修改');
INSERT INTO `t_jur` VALUES ('26', 'jur:remove', '权限的删除');
INSERT INTO `t_jur` VALUES ('27', 'option:page', '推荐人列表查看');
INSERT INTO `t_jur` VALUES ('28', 'logczz:backcz', '充值记录查看');
INSERT INTO `t_jur` VALUES ('29', 'ticket:page', '优惠券列表查看');
INSERT INTO `t_jur` VALUES ('30', 'ticket:save', '优惠券的新增');
INSERT INTO `t_jur` VALUES ('31', 'ticket:update', '优惠券的修改');
INSERT INTO `t_jur` VALUES ('32', 'uticket:page', '用户领券管理');
INSERT INTO `t_jur` VALUES ('33', 'sway:sway', '还款方式列表');
INSERT INTO `t_jur` VALUES ('34', 'sway:save', '还款方式新增');
INSERT INTO `t_jur` VALUES ('35', 'sway:update', '还款方式修改');
INSERT INTO `t_jur` VALUES ('36', 'sway:delete', '还款方式删除');
INSERT INTO `t_jur` VALUES ('37', 'bz:bz', '标种的列表');
INSERT INTO `t_jur` VALUES ('38', 'bz:save', '标种的新增');
INSERT INTO `t_jur` VALUES ('39', 'bz:update', '标种的修改');
INSERT INTO `t_jur` VALUES ('40', 'bz:delete', '标种的删除');
INSERT INTO `t_jur` VALUES ('41', 'jklx:jklx', '借款类型的查看');
INSERT INTO `t_jur` VALUES ('42', 'jklx:save', '借款类型的新增');
INSERT INTO `t_jur` VALUES ('43', 'jklx:update', '借款类型的修改');
INSERT INTO `t_jur` VALUES ('44', 'jklx:del', '借款类型的删除');
INSERT INTO `t_jur` VALUES ('45', 'dxModel:dxModel', '短信模版的查看');
INSERT INTO `t_jur` VALUES ('46', 'dxModel:delete', '短信模版的删除');
INSERT INTO `t_jur` VALUES ('47', 'jkb:jkb_listPage', '借款后台查看');
INSERT INTO `t_jur` VALUES ('48', 'jkb:shenhe', '后台借款审核');
INSERT INTO `t_jur` VALUES ('49', 'logtx:backtxsh', '提现审核查看');
INSERT INTO `t_jur` VALUES ('50', 'borrowApply:page', '全部借款查看');
INSERT INTO `t_jur` VALUES ('51', 'userMoney:page', '用户资金查看');
INSERT INTO `t_jur` VALUES ('52', 'tzb:htzb', '用户投资查看');
INSERT INTO `t_jur` VALUES ('53', 'bank:huserpage', '银行卡查看');
INSERT INTO `t_jur` VALUES ('54', 'borrowApply:hhkb_list', '全部还款查看');
INSERT INTO `t_jur` VALUES ('55', 'hkb:hhkb_state', '逾期借款查看');
INSERT INTO `t_jur` VALUES ('56', 'dynamic:page', '公司动态查看');
INSERT INTO `t_jur` VALUES ('57', 'dynamic:save', '公司动态新增');
INSERT INTO `t_jur` VALUES ('58', 'dynamic:update', '公司动态修改');
INSERT INTO `t_jur` VALUES ('59', 'media:page', '媒体报道查看');
INSERT INTO `t_jur` VALUES ('60', 'media:save', '媒体报道新增');
INSERT INTO `t_jur` VALUES ('61', 'media:update', '媒体报道修改');
INSERT INTO `t_jur` VALUES ('62', 'home:page', '首页信息管理');
INSERT INTO `t_jur` VALUES ('63', 'home:save', '首页信息新增');
INSERT INTO `t_jur` VALUES ('64', 'home:update', '首页信息修改');
INSERT INTO `t_jur` VALUES ('65', 'notice:page', '公司公告管理');
INSERT INTO `t_jur` VALUES ('66', 'notice:save', '新增公司公告');
INSERT INTO `t_jur` VALUES ('67', 'notice:update,notice:del', '公司公告修改和删除');
INSERT INTO `t_jur` VALUES ('69', 'friend:page', '合作伙伴查看');
INSERT INTO `t_jur` VALUES ('70', 'friend:filesUpload', '合作伙伴新增');
INSERT INTO `t_jur` VALUES ('71', 'friend:update,friend:del', '合作伙伴修改和删除');
INSERT INTO `t_jur` VALUES ('73', 'letter:page', '站内信管理');
INSERT INTO `t_jur` VALUES ('74', 'letter:save', '站内信新增');
INSERT INTO `t_jur` VALUES ('75', 'letter:update,letter:delete', '站内信修改和删除');

-- ----------------------------
-- Table structure for t_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `hid` bigint(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` varchar(60) DEFAULT NULL COMMENT '日期',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0激活，1冻结',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_letter
-- ----------------------------
INSERT INTO `t_letter` VALUES ('4', '1', '12432432', '1', '放打火机', '发给发打个电话非官方电话梵蒂冈的', '2018-01-14 14:37:39', '0');
INSERT INTO `t_letter` VALUES ('5', '1', '13434444', '1', '更好发挥过', '是大法官狂欢节', '2018-01-14 15:43:42', '0');
INSERT INTO `t_letter` VALUES ('9', null, '123456', '1', '梵蒂冈', '更符合规范的合格返回梵蒂冈法规和豆腐干', '2018-01-14 19:59:40', '0');
INSERT INTO `t_letter` VALUES ('11', null, '123456', '1', '第三个', '一好怀念更换', '2018-01-15 20:21:10', '0');
INSERT INTO `t_letter` VALUES ('12', null, '123456', '1', '电饭锅发送到和', '非官方', '2018-01-15 08:27:38', '0');
INSERT INTO `t_letter` VALUES ('13', '0', '', '1', '梵蒂冈地方', '对符合大多数', '2018-01-15 08:56:58', '1');
INSERT INTO `t_letter` VALUES ('15', null, '155555', '1', '烦得很', '广东省放虎归山换个风格和', '2018-01-17 10:03:34', '0');
INSERT INTO `t_letter` VALUES ('16', null, '13361778694', '1', '投资成功', '恭喜您您投资的产品名为PJZB1215,此次投资金额为10000元请等待收益', '2018-01-14 14:37:39', '1');
INSERT INTO `t_letter` VALUES ('17', null, '13361778694', '1', '地方晒', '的非官方的很感动', '2018-01-18 20:25:06', '1');
INSERT INTO `t_letter` VALUES ('19', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB2116,此次投资金额为：30000元，请等待收益！', '2018-01-19 08:37:12', '0');
INSERT INTO `t_letter` VALUES ('20', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB2116,此次投资金额为：20000元，请等待收益！', '2018-01-19 08:37:12', '1');
INSERT INTO `t_letter` VALUES ('21', null, '13361778694', '1', '梵蒂冈', '符合你风格和', '2018-01-19 19:37:02', '0');
INSERT INTO `t_letter` VALUES ('22', null, '13333333333', '1', '很关键', '个傻瓜', '2018-01-19 19:41:05', '0');
INSERT INTO `t_letter` VALUES ('23', null, '13333333333', '1', '大范甘迪', '大风刮过很多风景', '2018-01-19 19:42:36', '0');
INSERT INTO `t_letter` VALUES ('24', null, '13333333333', '1', '好可怜', '热风故事', '2018-01-19 19:45:00', '0');
INSERT INTO `t_letter` VALUES ('25', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：999元，请等待收益！', '2018-01-20 09:11:39', '0');
INSERT INTO `t_letter` VALUES ('26', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：999元，请等待收益！', '2018-01-20 09:19:28', '0');
INSERT INTO `t_letter` VALUES ('27', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：2000元，请等待收益！', '2018-01-20 09:20:01', '0');
INSERT INTO `t_letter` VALUES ('28', null, '18779749107', '1', '身份认证失败', '真实姓名不正确', '2018-01-22 08:32:24', '0');
INSERT INTO `t_letter` VALUES ('29', null, '18174099439', '1', '身份认证失败', '内容不详细', '2018-01-22 08:49:26', '0');
INSERT INTO `t_letter` VALUES ('30', null, '13361778694', '1', '身份认证失败', '真实姓名不正确', '2018-01-22 17:34:20', '1');
INSERT INTO `t_letter` VALUES ('31', null, '13361778694', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1215,此次投资金额为：5000元，请等待收益！', '2018-01-22 19:29:16', '1');
INSERT INTO `t_letter` VALUES ('32', null, '18779077235', '1', '身份认证成功', '恭喜你！身份认证审核通过，您可使用该身份进行投资借款', '2018-01-22 20:18:42', '0');
INSERT INTO `t_letter` VALUES ('33', null, '18174099445', '1', '身份认证成功', '恭喜你！身份认证审核通过，您可使用该身份进行投资借款', '2018-01-23 10:01:56', '0');
INSERT INTO `t_letter` VALUES ('34', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：1000.00元，请等待收益！', '2018-01-23 12:16:05', '0');
INSERT INTO `t_letter` VALUES ('35', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：500.00元，请等待收益！', '2018-01-23 12:25:39', '0');
INSERT INTO `t_letter` VALUES ('36', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：500.00元，请等待收益！', '2018-01-23 12:34:46', '0');
INSERT INTO `t_letter` VALUES ('37', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100元，请等待收益！', '2018-01-23 12:38:26', '0');
INSERT INTO `t_letter` VALUES ('38', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100.00元，请等待收益！', '2018-01-23 12:43:03', '0');
INSERT INTO `t_letter` VALUES ('39', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100.00元，请等待收益！', '2018-01-23 12:49:33', '0');
INSERT INTO `t_letter` VALUES ('40', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100元，请等待收益！', '2018-01-23 12:59:39', '0');
INSERT INTO `t_letter` VALUES ('41', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100元，请等待收益！', '2018-01-23 13:32:15', '0');
INSERT INTO `t_letter` VALUES ('42', null, '18174099445', '1', '投资成功！', '恭喜您！您投资的产品名为PJZB1228,此次投资金额为：100.00元，请等待收益！', '2018-01-23 13:37:24', '0');

-- ----------------------------
-- Table structure for t_logczz
-- ----------------------------
DROP TABLE IF EXISTS `t_logczz`;
CREATE TABLE `t_logczz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0充值成功，1充值失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logczz
-- ----------------------------
INSERT INTO `t_logczz` VALUES ('1', '1', '54435456465765788', '工商银行', '600.00', '2017-12-26 09:05:00', '1');
INSERT INTO `t_logczz` VALUES ('2', '1', '78343434727374344', '建设银行', '600.00', '2017-12-26 09:07:44', '1');
INSERT INTO `t_logczz` VALUES ('3', '1', '54435456465765788', '工商银行', '500.00', '2017-12-26 09:09:25', '1');
INSERT INTO `t_logczz` VALUES ('4', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 09:09:56', '1');
INSERT INTO `t_logczz` VALUES ('5', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 10:03:13', '1');
INSERT INTO `t_logczz` VALUES ('6', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 10:03:25', '1');
INSERT INTO `t_logczz` VALUES ('7', '1', '78343434727374344', '建设银行', '444.00', '2017-12-26 10:05:50', '1');
INSERT INTO `t_logczz` VALUES ('8', '1', '78343434727374344', '建设银行', '342.00', '2017-12-26 10:59:13', '1');
INSERT INTO `t_logczz` VALUES ('9', '1', '78343434727374344', '建设银行', '300.00', '2017-12-27 14:42:31', '1');
INSERT INTO `t_logczz` VALUES ('10', '1', '78343434727374344', '建设银行', '588.00', '2017-12-27 14:44:17', '1');
INSERT INTO `t_logczz` VALUES ('11', '1', '78343434727374344', '建设银行', '666.00', '2017-12-27 14:45:18', '1');
INSERT INTO `t_logczz` VALUES ('12', '1', '6025456545669854254', '建设银行', '2000.00', '2018-01-18 11:35:34', '1');
INSERT INTO `t_logczz` VALUES ('13', '41', '6098987876567656545', '建设银行', '100.00', '2018-01-23 11:02:40', '1');
INSERT INTO `t_logczz` VALUES ('14', '41', '6098987876567656545', '建设银行', '500.00', '2018-01-23 12:01:32', '1');
INSERT INTO `t_logczz` VALUES ('15', '41', '6098987876567656545', '建设银行', '400.00', '2018-01-23 12:14:41', '1');
INSERT INTO `t_logczz` VALUES ('16', '41', '6098987876567656545', '建设银行', '500.00', '2018-01-23 12:25:15', '1');
INSERT INTO `t_logczz` VALUES ('17', '41', '6098987876567656545', '建设银行', '500.00', '2018-01-23 12:34:26', '1');
INSERT INTO `t_logczz` VALUES ('18', '41', '6098987876567656545', '建设银行', '100.00', '2018-01-23 12:37:57', '1');

-- ----------------------------
-- Table structure for t_logmoney
-- ----------------------------
DROP TABLE IF EXISTS `t_logmoney`;
CREATE TABLE `t_logmoney` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，0充值，1提现，2回款，3系统金额（公司奖励等）',
  `in` decimal(10,2) DEFAULT NULL COMMENT '收入',
  `out` decimal(10,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logmoney
-- ----------------------------
INSERT INTO `t_logmoney` VALUES ('1', '1', '1', '0.00', '100000.00', '2017-12-25 08:29:10');
INSERT INTO `t_logmoney` VALUES ('2', '1', '1', '50000.00', '0.00', '2017-12-25 12:31:33');
INSERT INTO `t_logmoney` VALUES ('3', '1', '4', '0.00', '50000.00', '2018-01-09 10:57:19');
INSERT INTO `t_logmoney` VALUES ('4', '1', '4', '0.00', '6000.00', '2018-01-09 11:26:24');
INSERT INTO `t_logmoney` VALUES ('7', '2', '3', '0.00', '1261.32', '2018-01-11 19:49:50');
INSERT INTO `t_logmoney` VALUES ('8', '2', '3', '0.00', '1261.32', '2018-01-11 20:01:54');
INSERT INTO `t_logmoney` VALUES ('9', '1', '6', '1261.32', '0.00', '2018-01-12 08:09:18');
INSERT INTO `t_logmoney` VALUES ('10', '2', '3', '0.00', '1261.32', '2018-01-12 08:25:10');
INSERT INTO `t_logmoney` VALUES ('11', '1', '6', '1261.32', '0.00', '2018-01-12 08:46:03');
INSERT INTO `t_logmoney` VALUES ('12', '2', '3', '0.00', '1261.32', '2018-01-15 15:59:44');
INSERT INTO `t_logmoney` VALUES ('13', '1', '6', '1261.32', '0.00', '2018-01-15 16:00:16');
INSERT INTO `t_logmoney` VALUES ('14', '2', '4', '0.00', '1000.00', '2018-01-15 21:26:55');
INSERT INTO `t_logmoney` VALUES ('15', '2', '4', '0.00', '1000.00', '2018-01-15 21:27:17');
INSERT INTO `t_logmoney` VALUES ('16', '2', '4', '0.00', '1000.00', '2018-01-15 21:30:22');
INSERT INTO `t_logmoney` VALUES ('17', '2', '4', '0.00', '1000.00', '2018-01-15 21:30:57');
INSERT INTO `t_logmoney` VALUES ('18', '2', '4', '0.00', '2000.00', '2018-01-15 21:31:21');
INSERT INTO `t_logmoney` VALUES ('19', '2', '4', '0.00', '3000.00', '2018-01-15 21:31:46');
INSERT INTO `t_logmoney` VALUES ('20', '2', '4', '0.00', '2500.00', '2018-01-15 21:32:16');
INSERT INTO `t_logmoney` VALUES ('21', '2', '4', '0.00', '200.00', '2018-01-16 08:28:30');
INSERT INTO `t_logmoney` VALUES ('22', '2', '4', '0.00', '5000.00', '2018-01-16 08:38:50');
INSERT INTO `t_logmoney` VALUES ('23', '2', '3', '0.00', '1261.32', '2018-01-18 15:32:51');
INSERT INTO `t_logmoney` VALUES ('24', '1', '6', '1261.32', '0.00', '2018-01-18 15:34:33');
INSERT INTO `t_logmoney` VALUES ('25', '1', '6', '1261.32', '0.00', '2018-01-18 15:46:06');
INSERT INTO `t_logmoney` VALUES ('26', '2', '4', '0.00', '30000.00', '2018-01-19 08:33:06');
INSERT INTO `t_logmoney` VALUES ('27', '2', '4', '0.00', '20000.00', '2018-01-19 08:37:45');
INSERT INTO `t_logmoney` VALUES ('28', '2', '4', '0.00', '2000.00', '2018-01-20 09:18:31');
INSERT INTO `t_logmoney` VALUES ('29', '41', '4', '0.00', '1000.00', '2018-01-23 12:16:05');
INSERT INTO `t_logmoney` VALUES ('30', '41', '4', '0.00', '500.00', '2018-01-23 12:25:40');
INSERT INTO `t_logmoney` VALUES ('31', '41', '4', '0.00', '500.00', '2018-01-23 12:34:46');
INSERT INTO `t_logmoney` VALUES ('32', '41', '4', '0.00', '100.00', '2018-01-23 12:38:26');
INSERT INTO `t_logmoney` VALUES ('33', '41', '4', '0.00', '100.00', '2018-01-23 12:43:03');
INSERT INTO `t_logmoney` VALUES ('34', '41', '4', '0.00', '100.00', '2018-01-23 12:49:33');
INSERT INTO `t_logmoney` VALUES ('35', '41', '4', '0.00', '100.00', '2018-01-23 12:59:39');
INSERT INTO `t_logmoney` VALUES ('36', '41', '4', '0.00', '100.00', '2018-01-23 13:32:16');
INSERT INTO `t_logmoney` VALUES ('37', '41', '4', '0.00', '100.00', '2018-01-23 13:38:09');

-- ----------------------------
-- Table structure for t_logtx
-- ----------------------------
DROP TABLE IF EXISTS `t_logtx`;
CREATE TABLE `t_logtx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `money` decimal(7,2) DEFAULT NULL COMMENT '提现金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0提现成功，1未提现失败',
  `bankcard` varchar(50) DEFAULT NULL,
  `banktype` varchar(50) DEFAULT NULL,
  `proce` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logtx
-- ----------------------------
INSERT INTO `t_logtx` VALUES ('1', '1', '1000.00', '2017-12-28 15:57:53', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('2', '1', '1000.00', '2017-12-28 16:34:47', '3', '54435456465765788', '工商银行', '3.50');
INSERT INTO `t_logtx` VALUES ('3', '1', '2000.00', '2017-12-28 20:02:03', '3', '78343434727374344', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('4', '1', '1000.00', '2017-12-28 20:44:59', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('5', '1', '10000.00', '2017-12-28 20:48:30', '3', '78343434727374344', '建设银行', '35.00');
INSERT INTO `t_logtx` VALUES ('6', '1', '1000.00', '2017-12-28 20:57:31', '4', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('7', '1', '1000.00', '2017-12-29 08:04:21', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('8', '1', '2000.00', '2017-12-29 08:34:41', '3', '78343434727374344', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('9', '1', '1000.00', '2017-12-29 08:43:24', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('10', '1', '1000.00', '2017-12-29 08:45:56', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('11', '1', '1000.00', '2017-12-29 08:46:25', '5', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('12', '1', '1000.00', '2017-12-29 08:47:12', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('13', '1', '1000.00', '2017-12-29 08:47:48', '4', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('14', '1', '1000.00', '2017-12-29 08:53:51', '2', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('15', '1', '1200.00', '2017-12-29 08:54:05', '1', '78343434727374344', '建设银行', '4.20');
INSERT INTO `t_logtx` VALUES ('16', '1', '2000.00', '2018-01-18 11:29:18', '1', '6025456545669854254', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('17', '1', '2000.00', '2018-01-18 11:35:20', '1', '6025456545669854254', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('18', '1', '2000.00', '2018-01-18 11:35:20', '2', '6025456545669854254', '建设银行', '7.00');

-- ----------------------------
-- Table structure for t_media
-- ----------------------------
DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(100) DEFAULT NULL COMMENT '报道的链接地址',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_media
-- ----------------------------
INSERT INTO `t_media` VALUES ('1', '【天津在线】普金资本：盘点网络上不可信的网贷平台', '<p><br/></p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"word-wrap: break-word\">&nbsp;</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">P2P 自2011年开始进入大众眼球, 逐步发展到2013年,成为互联网金融, 如今行业经多次整改，发展已趋稳定。但是自P2P平台发展至今，“诈骗”、“跑路”、“骗子”这样的字样仿佛一直是网贷平台的形容词，但是并不是所有的网贷平台都不可信。下面，普金资本就来盘点一下网络上那些不可信的网贷平台。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><strong style=\"word-wrap: break-word;\">一、超短期+超高收益，日息平台新套路</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>日息诈骗类平台是最早的P2P诈骗模式之一，超短期+超高收益，目标紧盯刚入门的新人群体，特别是一些还没接触到专业P2P第三方和P2P交流群的人。他们在网上通过搜索引擎了解P2P信息的时候，很容易就会被大量日息广告吸引走，然后中套。众所周知，大部分日息类诈骗平台手法和电信诈骗如出一辙，只玩短期诈骗，不仅一毛不拔，还会无限忽悠人继续投钱，一但被揭穿，立刻就拉黑，然后更换网站和联系方式继续。但是今年这些日息平台开始玩起放长线钓大鱼的套路，前几轮竟然会真的支付预期利息，获取投资人信任，然后马上洗脑引诱其投入更大量的金额，获取更多的收入，借此来骗取更多。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>所谓没有对比就没有伤害，只要是稍微对正规P2P平台和P2P整体预期利率有一定了解的人，都不会上这种当，日息类平台玩的就是信息差，总有一些胆大心贪盲目自信的人会中招。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><strong style=\"word-wrap: break-word;\">二、伪造虚假高大上工商背景</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>针对投资人喜欢查询工商信息来确定平台背景的习惯，某平台曾精心策划了一场骗局，伪造了上市公司入股的工商信息，并借用高返现和全网推广很快的火了起来，被众人看好，如果不是对应的上市公司发文揭穿了这一行为，难以想象最后会有多少人中招。投资人只看背景就投的背书行为被骗子针对，连平台真实办公地址和平台具体业务都没有完全确定的情况下就盲目投资。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><strong style=\"word-wrap: break-word;\">三、冒充流</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>近日，一家拥有上市背景的平台，上线一天就跑路，令很多人大跌眼镜，最后才发现原来是个冒充货。事情起因是一个A股上市公司开了一个网贷平台，还做过宣传，但是这个平台去年就停业没有再运作了，然后有人冒充这个平台取一样的名字，并盗用了该公司域名，并给出了超高回报收益，成功骗到人之后，一天就消失。通过搜索引擎就可以发现真假两个网站，而且假网站上漏洞百出，各种错别字，很多人在投资之前依然没有发现问题。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>骗子抓准了投资人心理，想方设法的将自己弄成高大上，所以当投资人再遇到这类顶着高大上背景同时又给出超高回报的平台时，一定要留点心。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>最后，普金资本提醒广大投资人，在网贷平台发展日趋稳定的现在，投资人不要盲目投资，多学多看，多了解平台的实力才是最主要的！理财有风险，投资需谨慎！</span></p><p><br/></p>', '20180121201412617.jpg', '2017-12-21 20:00:58', 'http://www.72177.com/html/201705/08/4312705.htm');
INSERT INTO `t_media` VALUES ('2', '【广州热线】抢标太难？网贷老司机支招让钱动起来！', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;投资与消费是个矛盾体，春节过后各平台虽陆续恢复发标，但还是远远不能满足投资人需求。想必大家都知道“年前资金荒，年后资产荒”这句话，如今2017年已经过去三分之一了，资产荒的情况已经得到了一定缓解，但部分平台还是有优质债权供应不足的现象。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>这导致的直接结果就是，如果抢不到标，投资人的资金分分钟站岗！也就是资金白白躺在P2P账户上闲置。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>有人说，不就1-2天没投上吗，资金站岗有那么可怕？这里，我作为一名较为资深的P2P投资者，粗略地计算一下，两组数据告诉你答案：</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>年化10%的情况下，站岗3天损失的收益，约等于月标的收益降息整整1%</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>年化15%的情况下，站岗2天损失的收益，约等于月标的收益降息整整1%</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>如果你有类似经历，首先记住一点，“小孩子才分对错，成年人只看利弊”，干嘛那么大火气呢，再不开心，也不能让损失的回来。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>我当初作为一名P2P投资菜鸟的时候，也曾有过资金站岗的烦恼。在之后的投资过程中，我总结了几个抢标技巧，并依靠这些超实用的小技巧，我的抢标成功率大大提升，基本上做到了资金不站岗。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>这里和大家分享一下，我的抢标心得：</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><strong style=\"word-wrap: break-word;\">投资总方针</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>无论抢标的有什么样的手段和技巧，但一定要把平台的安全性考虑在前面，前期确定收益、安全和期限一项也不能放松。这里就不得不说说我选择大额投资的普金资本了：普金资本是一家专注于供应链金融服务的国资系互联网金融平台，借款项目优质、风控流程严谨、投资期限灵活、收益好又稳定。在普金资本进行投资理财，我很放心。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><strong style=\"word-wrap: break-word;\">提前准备部分</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"word-wrap: break-word;\"></span>一般来说，在提前安装好的移动端APP进行投标是最为便捷的交易方式。近日，国资系互联网金融平台普金资本也推出了普金资本APP，能够让更多投资人享受安全、透明、便捷、低门槛、好收益的互联网金融服务。大家只要通过普金资本官方网站、官方微信公众平台、腾讯应用宝、App Store等平台下载普金资本APP，然后完成注册、实名认证、绑卡等这简单的几步，就可以随时随地进行投资理财了。普金资本APP，真是移动便捷投资的好助手。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><strong style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>节省时间部分</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>开抢时，要提前复制好你要投资的金额，发标后直接 Ctrl+V，能比别人节省输入数字的时间。每次点击确认投资后，弹入支付页面，务必选择「记住支付密码」。这样抢标时，就省去了输入支付密码的时间。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><strong style=\"word-wrap: break-word;\">投资额度部分</strong></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>不要一口吃成胖子，比如，一个标的额度5万，你账户上躺着4万8，如果不确信自己能够成为首位投资者，不要选择全投，因为一旦有人在你之前投资5千，就把你给挤掉了。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>如果最后你的资金还是站岗了，那么，请跟我一起唱：你说风雨中/ 这点痛算什么/ 擦干泪不要问为什么……</span></p><p><br/></p>', '20180121201344316.jpg', '2017-12-25 08:34:59', 'http://www.020cf.com/gnxw/20170412/379860.html');
INSERT INTO `t_media` VALUES ('3', '【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！', '<p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\">2017<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">10</span><span style=\"word-wrap: break-word;\">月</span><span style=\"word-wrap: break-word;\">13</span><span style=\"word-wrap: break-word;\">日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司</span><span style=\"word-wrap: break-word;\">CEO</span><span style=\"word-wrap: break-word;\">吴鸿先生成功当选为理事会副会长。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161056_408.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">此次代表大会总结了江西省互联网金融协会成立以来所做的工作，指出协会的成立，是响应国家互联网金融业健康发展的具体要求，对我省互联网金融业的蓬勃发展和有序推进有着十分重要的作用。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">会议总结了全省互联网金融行业的基本情况，指出省内互联网金融行业的发展存在以下特点：第一，在对互联网金融行业的监管上取得了长足的进步，为行业的理性发展奠定了坚实的基础。第二，我省的互联网金融行业规模还有待进一步加大。据相关统计数据，截至</span><span style=\"word-wrap: break-word;\">2017</span><span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">8</span><span style=\"word-wrap: break-word;\">月底，全省在运营的网络借贷信息中介机构共有</span><span style=\"word-wrap: break-word;\">31</span><span style=\"word-wrap: break-word;\">家，累计撮合成交量为</span><span style=\"word-wrap: break-word;\">301.23</span><span style=\"word-wrap: break-word;\">亿元，贷款余额为</span><span style=\"word-wrap: break-word;\">30.89</span><span style=\"word-wrap: break-word;\">亿元。第三，我省的互联网金融行业在运行上处于平稳发展的时期，管理风险是可控的。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161147_72.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">据悉，普金资本运营（赣州）有限公司（以下简称：普金资本）是由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司一同设立的互联网金融平台，</span>2016<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">3</span><span style=\"word-wrap: break-word;\">月注册成立于江西赣州。在平台成立之初，就获得了赣州市国资委备案，并且以前所未有的发展态势为赣州的各类企业提供了精准到位的投融资服务。由于普金资本在人才上始终坚持</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">以人为本</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的原则，大批金融行业、城建行业、供应链管理行业的人才汇集于此，不但为公司的发展做出了自己的贡献，也为解决客户的资金问题提供了高效的运作方案。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161234_943.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">作为江西省互联网金融协会第二届副会长单位，普金资本致力于打造</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">专业、稳健、诚信、高效</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的互联网金融平台，自成立以来就始终坚持严谨规范的理念，积极拥抱国家互金监管政策，始终走在省内互金行业规范平台的前列，用合规和自律的基本底线，不断夯实平台自身的发展实力。未来，普金资本必将继续深化在互联网金融领域的工作，担起江西省互金协会副会长单位职责，与全行业共同努力，推动江西互联网金融业的健康发展。</span></p><p><br/></p><p>;</p>', '20180121201359768.jpg', '2017-12-25 08:34:59', 'http://www.sohu.com/a/198324546_244119');
INSERT INTO `t_media` VALUES ('4', '【华夏经纬】互联网金融行业再次掀起风暴，普金资本横空出世', '<p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"word-wrap: break-word\">&nbsp;基于国家</span>“互联网+”的政策，金融行业开始逐步结合国家发展进行改革。不论是传统地面金融行业还是电商行业，都开始挖掘“资本”行业的市场潜力。支付宝-蚂蚁花呗、借呗、理财;微信中的理财通;京东金融的理财御存款等，无一不是在金融行业掘金。虽然利益点与发展相比传统金融行业收获更大，但其后面的支柱与安全性也在经受市场的考验。而大型企业及国有企业投资金融的市场却产生缺口，广大创业及投资人看重这块巨大的“蓝海”，纷纷由大众金融转型到大型金融行业。由此市场行业趋势，普金资本开始进入大众的视野，开始进行金融行业的全面革新与改革。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"word-wrap: break-word\">  普金资本运营</span>(赣州)有限公司(简称：普金资本)由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司共同出资设立的互联网金融平台。通过多样的产品、多重的优势、专业的咨询售前售后服务，普金资本迎难而上，脱颖而出，伫立于大型金融行业发展。通过2016年的行业调查，业内人士表示，2017年行业继续发展，国家将出台完善政策给予金融行业相关规定与引导。许多缺少安全性与稳健性的中小型企业将逐渐退出市场舞台。而普金资本实力雄厚，的股东除了创始团队之外，还囊括了国有资产单位。其中包括实力雄厚的赣州城兴投资管理有限公司与盛汇资产管理有限公司。并且，针对现在市场的人才供应链与市场需求，继续一批专业性与全能型的工作团队引导行业发展。普金资本团队汇聚金融行业、城建行业、供应链管理行业一批专业人才，拥有丰富的从业经验，具备成熟的产品开发设计能力、严格的风险管理能力、良好的企业管理能力。致力于打造“专业、稳健、诚信、高效”的互联网金融平台，成为赣南苏区振兴发展投融资服务的示范性平台。另外，针对2016网贷行业成交额接近20000亿元的成交量来说，成交的安全性也受到业内外的关注。普金资本上线项目，必须经过五级过滤，即为：初审、实地调查、风控终审、介入过滤与筛选过滤等五大过滤体系。另外，普金资本更提供技术保障与法律保障，保障资金的安全性与稳健性。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"word-wrap: break-word\">  多重的优势与多样的产品，打造普金资本稳健匠心的品质。相信在未来，普金资本以及大型企业、国企的资金金融市场发展将会更加壮大。我们也可以预见，承接</span>2016年“监管整治+洗牌转型”的行业主旋律，2017年势必会产生更加崭新的行业发展势头，我们拭目以待。</p><p><br/></p>', '20180121201332443.jpg', '2018-01-14 21:03:56', 'http://www.huaxia.com/xw/zhxw/2017/09/5485817.html');
INSERT INTO `t_media` VALUES ('5', '热烈祝贺普金资本荣膺普惠金融协会常务副会长单位', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px;\">&nbsp;赣州市普惠金融协会是依照国家有关政策法规成立的，由多家小额贷款公司、融资性担保公司、互联网金融企业共同发起组建的行业社团组织，赣州市金融工作局为业务主管单位。协会以开展行业自律、维护行业利益、提供会员服务、促进行业发展为宗旨。遵守国家宪法、法律、法规和经济金融方针政策，认真履行自律、维权、协调、服务职能。强化组织协调和服务水平，优化会员依法合规经营环境，维护会员合法权益，提高普惠金融行业素质，提升行业整体形象，促进普惠金融行业健康发展。</span><br/></p><p><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 在当日刘荣龙秘书长一行对普金资本的到访中，普金资本副总裁林立标等全程接待陪同，双方就金融创新与监管、公司发展模式、协会运营现状及模式等方面进行了深入的探讨和交流，并在互联网金融发展问题上达成系列共识。此次赣州普惠金融协会实地考察普金资本并授予“常务副会长单位”荣誉，一来反映了赣州苏区对新兴互联网金融发展的重视，同时也充分认可了普金资本在中小企业融资方面的重要作用，给普金资本及平台投资人以莫大信心。</span><br/><br/></p><p><img src=\"http://www.pujinziben.com/attached/image/2017/20170718/201707181722219748.jpg\" alt=\"\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;显然正是由于不断的发展与进步，普金资本才能在广大平台用户的一致好评中，受到越来越多权威金融机构的认可。随着本次加入市普惠金融协会，公司势必将建立更加完备的风控模式，继续肩负起对社会投资者的责任。而依托协会在相关领域的影响力，普金资本不仅逐步发展为一支正规化、专业化的金融行业主力军，更将迈入前所未有的快速发展新阶段！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 未来，普金资本将会更加积极的投身到协会的各项工作当中，努力实现优势互补、合作共赢、协同创新、规范自律，与业界携手共同为赣州地区互联网金融的健康发展，为开创金融信息产业发展的新局面贡献自己的力量。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p>', '20180121201314330.jpg', '2018-01-16 14:41:13', 'http://www.0754news.com/guonei/20170508/184310.html');
INSERT INTO `t_media` VALUES ('6', '热烈祝贺普金资本荣膺普惠金融协会常务副会长单位', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;7月17日，赣州市普惠金融协会秘书长刘荣龙亲临普金资本，亲自授牌普金资本为赣州市普惠金融协会常务副会长单位，以肯定普金资本自成立以来在赣州地区互联网金融领域的突出表现。</span><br/><br/></p><p><br/></p><p>普金资本副总裁林立标（左）与市普惠金融协会秘书长刘荣龙（右）合影</p><p><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 赣州市普惠金融协会是依照国家有关政策法规成立的，由多家小额贷款公司、融资性担保公司、互联网金融企业共同发起组建的行业社团组织，赣州市金融工作局为业务主管单位。协会以开展行业自律、维护行业利益、提供会员服务、促进行业发展为宗旨。遵守国家宪法、法律、法规和经济金融方针政策，认真履行自律、维权、协调、服务职能。强化组织协调和服务水平，优化会员依法合规经营环境，维护会员合法权益，提高普惠金融行业素质，提升行业整体形象，促进普惠金融行业健康发展。</span><br/><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 在当日刘荣龙秘书长一行对普金资本的到访中，普金资本副总裁林立标等全程接待陪同，双方就金融创新与监管、公司发展模式、协会运营现状及模式等方面进行了深入的探讨和交流，并在互联网金融发展问题上达成系列共识。此次赣州普惠金融协会实地考察普金资本并授予“常务副会长单位”荣誉，一来反映了赣州苏区对新兴互联网金融发展的重视，同时也充分认可了普金资本在中小企业融资方面的重要作用，给普金资本及平台投资人以莫大信心。</span><br/><br/></p><p><img src=\"http://www.pujinziben.com/attached/image/2017/20170718/201707181722219748.jpg\" alt=\"\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;显然正是由于不断的发展与进步，普金资本才能在广大平台用户的一致好评中，受到越来越多权威金融机构的认可。随着本次加入市普惠金融协会，公司势必将建立更加完备的风控模式，继续肩负起对社会投资者的责任。而依托协会在相关领域的影响力，普金资本不仅逐步发展为一支正规化、专业化的金融行业主力军，更将迈入前所未有的快速发展新阶段！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 未来，普金资本将会更加积极的投身到协会的各项工作当中，努力实现优势互补、合作共赢、协同创新、规范自律，与业界携手共同为赣州地区互联网金融的健康发展，为开创金融信息产业发展的新局面贡献自己的力量。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p>', '20180121201243802.jpg', '2018-01-16 14:47:10', 'http://www.0754news.com/guonei/20170508/184310.html');
INSERT INTO `t_media` VALUES ('7', '【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！', '<p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\">2017<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">10</span><span style=\"word-wrap: break-word;\">月</span><span style=\"word-wrap: break-word;\">13</span><span style=\"word-wrap: break-word;\">日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司</span><span style=\"word-wrap: break-word;\">CEO</span><span style=\"word-wrap: break-word;\">吴鸿先生成功当选为理事会副会长。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161056_408.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">此次代表大会总结了江西省互联网金融协会成立以来所做的工作，指出协会的成立，是响应国家互联网金融业健康发展的具体要求，对我省互联网金融业的蓬勃发展和有序推进有着十分重要的作用。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">会议总结了全省互联网金融行业的基本情况，指出省内互联网金融行业的发展存在以下特点：第一，在对互联网金融行业的监管上取得了长足的进步，为行业的理性发展奠定了坚实的基础。第二，我省的互联网金融行业规模还有待进一步加大。据相关统计数据，截至</span><span style=\"word-wrap: break-word;\">2017</span><span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">8</span><span style=\"word-wrap: break-word;\">月底，全省在运营的网络借贷信息中介机构共有</span><span style=\"word-wrap: break-word;\">31</span><span style=\"word-wrap: break-word;\">家，累计撮合成交量为</span><span style=\"word-wrap: break-word;\">301.23</span><span style=\"word-wrap: break-word;\">亿元，贷款余额为</span><span style=\"word-wrap: break-word;\">30.89</span><span style=\"word-wrap: break-word;\">亿元。第三，我省的互联网金融行业在运行上处于平稳发展的时期，管理风险是可控的。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161147_72.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">据悉，普金资本运营（赣州）有限公司（以下简称：普金资本）是由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司一同设立的互联网金融平台，</span>2016<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">3</span><span style=\"word-wrap: break-word;\">月注册成立于江西赣州。在平台成立之初，就获得了赣州市国资委备案，并且以前所未有的发展态势为赣州的各类企业提供了精准到位的投融资服务。由于普金资本在人才上始终坚持</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">以人为本</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的原则，大批金融行业、城建行业、供应链管理行业的人才汇集于此，不但为公司的发展做出了自己的贡献，也为解决客户的资金问题提供了高效的运作方案。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171017161234_943.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">作为江西省互联网金融协会第二届副会长单位，普金资本致力于打造</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">专业、稳健、诚信、高效</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的互联网金融平台，自成立以来就始终坚持严谨规范的理念，积极拥抱国家互金监管政策，始终走在省内互金行业规范平台的前列，用合规和自律的基本底线，不断夯实平台自身的发展实力。未来，普金资本必将继续深化在互联网金融领域的工作，担起江西省互金协会副会长单位职责，与全行业共同努力，推动江西互联网金融业的健康发展。</span></p><p><br/></p>', '20180121201231432.jpg', '2018-01-19 11:00:13', 'http://www.sohu.com/a/198324546_244119');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(15000) DEFAULT NULL COMMENT '内容',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '公告时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '<p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">项目简介</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">投资标的为某</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">商业保理有限公司转让出的编号为&nbsp;</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">YC2017TD00012</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">的保理服务合同对应的商业承兑汇票债权，原债权借款人为</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">赣**传媒有限公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">。以恒创置业有限公司商业承兑汇票转让借款，用于补充企业流动性资金。本平台为此次借款提供服务。</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款金额</strong>】132254</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">元</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">产品类别</strong>】恒金宝</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款期限</strong>】6</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">个月</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款利率</strong>】9+1%</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">发标时间</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">2018年01</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">月8</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">日</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;15:00</span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p>', '2018年01月08日新标预告', '2018-01-09 08:42:02');
INSERT INTO `t_notice` VALUES ('3', '<p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">项目简介</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">投资标的为某</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">商业保理有限公司转让出的编号为&nbsp;</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">YC2017TD00012</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">的保理服务合同对应的商业承兑汇票债权，原债权借款人为</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">赣**传媒有限公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">。以恒创置业有限公司商业承兑汇票转让借款，用于补充企业流动性资金。本平台为此次借款提供服务。</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款金额</strong>】132254</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">元</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">产品类别</strong>】恒金宝</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款期限</strong>】6</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">个月</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款利率</strong>】9+1%</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">发标时间</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">2018年01</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">月8</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">日</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;15:00</span></p>', '2018年01月08日新标预告', '2018-01-08 08:42:02');
INSERT INTO `t_notice` VALUES ('4', '<p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">项目简介</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">投资标的为某</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">商业保理有限公司转让出的编号为&nbsp;</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">YC2017TD00012</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">的保理服务合同对应的商业承兑汇票债权，原债权借款人为</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">赣**传媒有限公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">。以恒创置业有限公司商业承兑汇票转让借款，用于补充企业流动性资金。本平台为此次借款提供服务。</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款金额</strong>】132254</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">元</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">产品类别</strong>】普金宝</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款期限</strong>】6</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">个月</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">借款利率</strong>】9+1%</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">【<strong style=\"word-wrap: break-word;\">发标时间</strong>】</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">2018年01</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">月8</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">日</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\">&nbsp;15:00</span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: &quot;background-color:#FFFFFF;&quot;;\"><br/></span></p>', '2018年01月08日新标', '2018-01-09 08:42:02');

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` char(11) NOT NULL COMMENT '电话',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES ('1', '18174099439', '反馈内容反馈内容反馈内容反馈内容反馈内容', '2018-01-01 14:50:22');
INSERT INTO `t_option` VALUES ('2', '18370710329', '投资有风险理财需谨慎', '2017-12-30 15:30:55');
INSERT INTO `t_option` VALUES ('3', '18779749107', '反馈内容反馈内容反馈内容', '2018-01-03 10:55:47');

-- ----------------------------
-- Table structure for t_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `tname` varchar(20) DEFAULT NULL COMMENT '推荐人姓名',
  `uid` bigint(20) DEFAULT NULL COMMENT '被推荐人id',
  `rname` varchar(20) DEFAULT NULL COMMENT '被推荐人姓名',
  `date` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recommend
-- ----------------------------
INSERT INTO `t_recommend` VALUES ('23', '3', '王五', '4', '老张', '2018-01-14 10:40:46');
INSERT INTO `t_recommend` VALUES ('24', '6', '李珊', '39', 'test0', '2018-01-22 21:14:39');
INSERT INTO `t_recommend` VALUES ('25', '6', '李珊', '40', 'test10', '2018-01-22 21:18:01');
INSERT INTO `t_recommend` VALUES ('26', '1', '12121', '41', '王五', '2018-01-23 09:59:40');

-- ----------------------------
-- Table structure for t_reward
-- ----------------------------
DROP TABLE IF EXISTS `t_reward`;
CREATE TABLE `t_reward` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '投资人id，t_user前台用户表id字段',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0已发放，1未发放）',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reward
-- ----------------------------

-- ----------------------------
-- Table structure for t_rewardsetting
-- ----------------------------
DROP TABLE IF EXISTS `t_rewardsetting`;
CREATE TABLE `t_rewardsetting` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `minmoney` decimal(10,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(10,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double(255,0) DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rewardsetting
-- ----------------------------
INSERT INTO `t_rewardsetting` VALUES ('1', '0.00', '50000.00', '5');
INSERT INTO `t_rewardsetting` VALUES ('3', '50000.00', '100000.00', '3');
INSERT INTO `t_rewardsetting` VALUES ('4', '100000.00', '10000000.00', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `content` varchar(500) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '拥有本平台所有的权限');
INSERT INTO `t_role` VALUES ('2', '普通管理员', '拥有平台的大部分权限');
INSERT INTO `t_role` VALUES ('3', '普通员工', '只有平台的小部分权限');

-- ----------------------------
-- Table structure for t_rolejur
-- ----------------------------
DROP TABLE IF EXISTS `t_rolejur`;
CREATE TABLE `t_rolejur` (
  `rjid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id，t_role主键id',
  `jid` bigint(20) DEFAULT NULL COMMENT '权限id，t_jur主键id',
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB AUTO_INCREMENT=1219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rolejur
-- ----------------------------
INSERT INTO `t_rolejur` VALUES ('908', '1', '5');
INSERT INTO `t_rolejur` VALUES ('909', '1', '6');
INSERT INTO `t_rolejur` VALUES ('910', '1', '7');
INSERT INTO `t_rolejur` VALUES ('911', '1', '8');
INSERT INTO `t_rolejur` VALUES ('912', '1', '9');
INSERT INTO `t_rolejur` VALUES ('913', '1', '10');
INSERT INTO `t_rolejur` VALUES ('914', '1', '11');
INSERT INTO `t_rolejur` VALUES ('915', '1', '12');
INSERT INTO `t_rolejur` VALUES ('916', '1', '13');
INSERT INTO `t_rolejur` VALUES ('917', '1', '14');
INSERT INTO `t_rolejur` VALUES ('918', '1', '23');
INSERT INTO `t_rolejur` VALUES ('919', '1', '24');
INSERT INTO `t_rolejur` VALUES ('920', '1', '25');
INSERT INTO `t_rolejur` VALUES ('921', '1', '26');
INSERT INTO `t_rolejur` VALUES ('922', '1', '27');
INSERT INTO `t_rolejur` VALUES ('923', '1', '28');
INSERT INTO `t_rolejur` VALUES ('924', '1', '29');
INSERT INTO `t_rolejur` VALUES ('925', '1', '30');
INSERT INTO `t_rolejur` VALUES ('926', '1', '31');
INSERT INTO `t_rolejur` VALUES ('927', '1', '32');
INSERT INTO `t_rolejur` VALUES ('928', '1', '33');
INSERT INTO `t_rolejur` VALUES ('929', '1', '34');
INSERT INTO `t_rolejur` VALUES ('930', '1', '35');
INSERT INTO `t_rolejur` VALUES ('931', '1', '36');
INSERT INTO `t_rolejur` VALUES ('932', '1', '37');
INSERT INTO `t_rolejur` VALUES ('933', '1', '38');
INSERT INTO `t_rolejur` VALUES ('934', '1', '39');
INSERT INTO `t_rolejur` VALUES ('935', '1', '40');
INSERT INTO `t_rolejur` VALUES ('936', '1', '41');
INSERT INTO `t_rolejur` VALUES ('937', '1', '42');
INSERT INTO `t_rolejur` VALUES ('938', '1', '43');
INSERT INTO `t_rolejur` VALUES ('939', '1', '44');
INSERT INTO `t_rolejur` VALUES ('940', '1', '45');
INSERT INTO `t_rolejur` VALUES ('941', '1', '46');
INSERT INTO `t_rolejur` VALUES ('942', '1', '47');
INSERT INTO `t_rolejur` VALUES ('943', '1', '48');
INSERT INTO `t_rolejur` VALUES ('944', '1', '49');
INSERT INTO `t_rolejur` VALUES ('945', '1', '50');
INSERT INTO `t_rolejur` VALUES ('946', '1', '51');
INSERT INTO `t_rolejur` VALUES ('947', '1', '52');
INSERT INTO `t_rolejur` VALUES ('948', '1', '53');
INSERT INTO `t_rolejur` VALUES ('949', '1', '54');
INSERT INTO `t_rolejur` VALUES ('950', '1', '55');
INSERT INTO `t_rolejur` VALUES ('951', '1', '56');
INSERT INTO `t_rolejur` VALUES ('952', '1', '57');
INSERT INTO `t_rolejur` VALUES ('953', '1', '58');
INSERT INTO `t_rolejur` VALUES ('954', '1', '59');
INSERT INTO `t_rolejur` VALUES ('955', '1', '60');
INSERT INTO `t_rolejur` VALUES ('956', '1', '61');
INSERT INTO `t_rolejur` VALUES ('957', '1', '62');
INSERT INTO `t_rolejur` VALUES ('958', '1', '63');
INSERT INTO `t_rolejur` VALUES ('959', '1', '64');
INSERT INTO `t_rolejur` VALUES ('960', '1', '65');
INSERT INTO `t_rolejur` VALUES ('961', '1', '66');
INSERT INTO `t_rolejur` VALUES ('962', '1', '67');
INSERT INTO `t_rolejur` VALUES ('963', '1', '69');
INSERT INTO `t_rolejur` VALUES ('964', '1', '70');
INSERT INTO `t_rolejur` VALUES ('965', '1', '71');
INSERT INTO `t_rolejur` VALUES ('966', '1', '73');
INSERT INTO `t_rolejur` VALUES ('967', '1', '74');
INSERT INTO `t_rolejur` VALUES ('968', '1', '75');
INSERT INTO `t_rolejur` VALUES ('1025', '3', '11');
INSERT INTO `t_rolejur` VALUES ('1026', '3', '12');
INSERT INTO `t_rolejur` VALUES ('1027', '3', '13');
INSERT INTO `t_rolejur` VALUES ('1028', '3', '27');
INSERT INTO `t_rolejur` VALUES ('1029', '3', '28');
INSERT INTO `t_rolejur` VALUES ('1030', '3', '29');
INSERT INTO `t_rolejur` VALUES ('1031', '3', '32');
INSERT INTO `t_rolejur` VALUES ('1032', '3', '33');
INSERT INTO `t_rolejur` VALUES ('1033', '3', '41');
INSERT INTO `t_rolejur` VALUES ('1034', '3', '45');
INSERT INTO `t_rolejur` VALUES ('1035', '3', '47');
INSERT INTO `t_rolejur` VALUES ('1036', '3', '49');
INSERT INTO `t_rolejur` VALUES ('1037', '3', '50');
INSERT INTO `t_rolejur` VALUES ('1038', '3', '51');
INSERT INTO `t_rolejur` VALUES ('1039', '3', '52');
INSERT INTO `t_rolejur` VALUES ('1040', '3', '53');
INSERT INTO `t_rolejur` VALUES ('1041', '3', '54');
INSERT INTO `t_rolejur` VALUES ('1042', '3', '55');
INSERT INTO `t_rolejur` VALUES ('1043', '3', '56');
INSERT INTO `t_rolejur` VALUES ('1044', '3', '59');
INSERT INTO `t_rolejur` VALUES ('1045', '3', '62');
INSERT INTO `t_rolejur` VALUES ('1046', '3', '65');
INSERT INTO `t_rolejur` VALUES ('1047', '3', '69');
INSERT INTO `t_rolejur` VALUES ('1048', '3', '73');
INSERT INTO `t_rolejur` VALUES ('1162', '2', '5');
INSERT INTO `t_rolejur` VALUES ('1163', '2', '6');
INSERT INTO `t_rolejur` VALUES ('1164', '2', '8');
INSERT INTO `t_rolejur` VALUES ('1165', '2', '9');
INSERT INTO `t_rolejur` VALUES ('1166', '2', '11');
INSERT INTO `t_rolejur` VALUES ('1167', '2', '12');
INSERT INTO `t_rolejur` VALUES ('1168', '2', '13');
INSERT INTO `t_rolejur` VALUES ('1169', '2', '14');
INSERT INTO `t_rolejur` VALUES ('1170', '2', '23');
INSERT INTO `t_rolejur` VALUES ('1171', '2', '24');
INSERT INTO `t_rolejur` VALUES ('1172', '2', '25');
INSERT INTO `t_rolejur` VALUES ('1173', '2', '27');
INSERT INTO `t_rolejur` VALUES ('1174', '2', '28');
INSERT INTO `t_rolejur` VALUES ('1175', '2', '29');
INSERT INTO `t_rolejur` VALUES ('1176', '2', '30');
INSERT INTO `t_rolejur` VALUES ('1177', '2', '31');
INSERT INTO `t_rolejur` VALUES ('1178', '2', '32');
INSERT INTO `t_rolejur` VALUES ('1179', '2', '33');
INSERT INTO `t_rolejur` VALUES ('1180', '2', '34');
INSERT INTO `t_rolejur` VALUES ('1181', '2', '35');
INSERT INTO `t_rolejur` VALUES ('1182', '2', '36');
INSERT INTO `t_rolejur` VALUES ('1183', '2', '37');
INSERT INTO `t_rolejur` VALUES ('1184', '2', '38');
INSERT INTO `t_rolejur` VALUES ('1185', '2', '39');
INSERT INTO `t_rolejur` VALUES ('1186', '2', '40');
INSERT INTO `t_rolejur` VALUES ('1187', '2', '41');
INSERT INTO `t_rolejur` VALUES ('1188', '2', '42');
INSERT INTO `t_rolejur` VALUES ('1189', '2', '43');
INSERT INTO `t_rolejur` VALUES ('1190', '2', '45');
INSERT INTO `t_rolejur` VALUES ('1191', '2', '46');
INSERT INTO `t_rolejur` VALUES ('1192', '2', '47');
INSERT INTO `t_rolejur` VALUES ('1193', '2', '48');
INSERT INTO `t_rolejur` VALUES ('1194', '2', '49');
INSERT INTO `t_rolejur` VALUES ('1195', '2', '50');
INSERT INTO `t_rolejur` VALUES ('1196', '2', '51');
INSERT INTO `t_rolejur` VALUES ('1197', '2', '52');
INSERT INTO `t_rolejur` VALUES ('1198', '2', '53');
INSERT INTO `t_rolejur` VALUES ('1199', '2', '54');
INSERT INTO `t_rolejur` VALUES ('1200', '2', '55');
INSERT INTO `t_rolejur` VALUES ('1201', '2', '56');
INSERT INTO `t_rolejur` VALUES ('1202', '2', '57');
INSERT INTO `t_rolejur` VALUES ('1203', '2', '58');
INSERT INTO `t_rolejur` VALUES ('1204', '2', '59');
INSERT INTO `t_rolejur` VALUES ('1205', '2', '60');
INSERT INTO `t_rolejur` VALUES ('1206', '2', '61');
INSERT INTO `t_rolejur` VALUES ('1207', '2', '62');
INSERT INTO `t_rolejur` VALUES ('1208', '2', '63');
INSERT INTO `t_rolejur` VALUES ('1209', '2', '64');
INSERT INTO `t_rolejur` VALUES ('1210', '2', '65');
INSERT INTO `t_rolejur` VALUES ('1211', '2', '66');
INSERT INTO `t_rolejur` VALUES ('1212', '2', '67');
INSERT INTO `t_rolejur` VALUES ('1213', '2', '69');
INSERT INTO `t_rolejur` VALUES ('1214', '2', '70');
INSERT INTO `t_rolejur` VALUES ('1215', '2', '71');
INSERT INTO `t_rolejur` VALUES ('1216', '2', '73');
INSERT INTO `t_rolejur` VALUES ('1217', '2', '74');
INSERT INTO `t_rolejur` VALUES ('1218', '2', '75');

-- ----------------------------
-- Table structure for t_roleuser
-- ----------------------------
DROP TABLE IF EXISTS `t_roleuser`;
CREATE TABLE `t_roleuser` (
  `ruid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id',
  `huid` bigint(20) DEFAULT NULL COMMENT '后台用户id',
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleuser
-- ----------------------------
INSERT INTO `t_roleuser` VALUES ('1', '1', '1');
INSERT INTO `t_roleuser` VALUES ('2', '2', '2');
INSERT INTO `t_roleuser` VALUES ('3', '2', '3');
INSERT INTO `t_roleuser` VALUES ('5', '3', '5');
INSERT INTO `t_roleuser` VALUES ('6', '3', '6');

-- ----------------------------
-- Table structure for t_rzvip
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvip`;
CREATE TABLE `t_rzvip` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `xl` varchar(40) DEFAULT NULL COMMENT '学历',
  `ism` tinyint(4) DEFAULT NULL COMMENT '婚否（0已婚，1未婚，2单身）',
  `bschool` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `addr` varchar(40) DEFAULT NULL COMMENT '居住地址',
  `work` varchar(30) DEFAULT NULL COMMENT '现工作',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `ispass` tinyint(4) DEFAULT '1',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `t_rzvip_rid_uindex` (`rid`) USING BTREE,
  UNIQUE KEY `t_rzvip_uid_uindex` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvip
-- ----------------------------
INSERT INTO `t_rzvip` VALUES ('1', '1', '本科', '2', '宏图学院', '博兴花园', 'java高级工程师', '20', '2', null, null);
INSERT INTO `t_rzvip` VALUES ('2', '7', '本科', '1', '不知道', '不知道', '不知道', '22', '4', null, null);
INSERT INTO `t_rzvip` VALUES ('3', '3', '硕士', '1', '农大', '北京', '攻城狮', '20', '3', null, null);
INSERT INTO `t_rzvip` VALUES ('4', '2', '高中', '1', '北大', '北京', '教师', '33', '4', null, null);
INSERT INTO `t_rzvip` VALUES ('6', '4', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('7', '5', '本科', '1', '台大', '南昌', '攻城狮', '21', '3', null, null);
INSERT INTO `t_rzvip` VALUES ('8', '6', '本科', '1', '交大', '上海', '商人', '55', '3', null, null);
INSERT INTO `t_rzvip` VALUES ('9', '25', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('10', '27', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('11', '28', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('12', '29', '小学', '1', '财大', '日本', '司机', '12', '2', null, null);
INSERT INTO `t_rzvip` VALUES ('13', '30', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('14', '31', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('16', '33', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('17', '34', '本科', '1', '不不不', '灌灌灌灌', '各个环节', '20', '2', null, null);
INSERT INTO `t_rzvip` VALUES ('19', '36', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('20', '37', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('21', '38', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('22', '39', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('23', '40', null, null, null, null, null, null, '1', null, null);
INSERT INTO `t_rzvip` VALUES ('24', '41', '大专', '1', '北大', '赣州', '程序员', '22', '2', null, null);

-- ----------------------------
-- Table structure for t_rzvipcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvipcheck`;
CREATE TABLE `t_rzvipcheck` (
  `rcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，2通过，4未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvipcheck
-- ----------------------------
INSERT INTO `t_rzvipcheck` VALUES ('1', '29', '1', '2', '', '2018-01-21 20:49:43');
INSERT INTO `t_rzvipcheck` VALUES ('2', '5', '1', '4', '真实姓名不正确', '2018-01-21 21:12:26');
INSERT INTO `t_rzvipcheck` VALUES ('3', '5', '1', '4', '真实姓名不正确', '2018-01-22 08:32:25');
INSERT INTO `t_rzvipcheck` VALUES ('4', '7', '1', '4', '内容不详细', '2018-01-22 08:49:26');
INSERT INTO `t_rzvipcheck` VALUES ('5', '2', '1', '4', '真实姓名不正确', '2018-01-22 17:34:20');
INSERT INTO `t_rzvipcheck` VALUES ('6', '34', '1', '2', '', '2018-01-22 20:18:43');
INSERT INTO `t_rzvipcheck` VALUES ('7', '41', '1', '2', '', '2018-01-23 10:01:57');

-- ----------------------------
-- Table structure for t_shborrow
-- ----------------------------
DROP TABLE IF EXISTS `t_shborrow`;
CREATE TABLE `t_shborrow` (
  `shid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id，t_huser后台用户主键id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过（0未通过，1已通过）',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply申请借款表主键id字段',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shborrow
-- ----------------------------

-- ----------------------------
-- Table structure for t_skb
-- ----------------------------
DROP TABLE IF EXISTS `t_skb`;
CREATE TABLE `t_skb` (
  `skid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id，前台用户t_user主键id',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `ybx` decimal(10,2) DEFAULT '0.00' COMMENT '应收本息',
  `rbx` decimal(10,2) DEFAULT '0.00' COMMENT '已收本息',
  `ylx` decimal(10,2) DEFAULT '0.00' COMMENT '应收利息',
  `rlx` decimal(10,2) DEFAULT '0.00' COMMENT '已收利息',
  `ybj` decimal(10,2) DEFAULT '0.00' COMMENT '应收本金',
  `rbj` decimal(10,2) DEFAULT '0.00' COMMENT '已收本金',
  `rnum` int(11) DEFAULT '0' COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `hkdate` datetime DEFAULT NULL COMMENT '日期',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `tzmoney` decimal(10,2) DEFAULT '0.00' COMMENT '投资金额',
  `state` tinyint(4) DEFAULT NULL COMMENT '收款状态，1未收款，2已收款',
  `djq` int(11) DEFAULT '1' COMMENT '第几期',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_skb
-- ----------------------------
INSERT INTO `t_skb` VALUES ('1', '1', '2', '630.66', '630.66', '55.00', '55.00', '575.66', '575.66', '1', '10', '2018-02-11 11:44:05', '18', '50000.00', '3', '1');
INSERT INTO `t_skb` VALUES ('2', '1', '2', '630.66', '630.66', '49.72', '49.72', '580.94', '580.94', '1', '10', '2018-03-11 11:44:05', '18', '50000.00', '3', '2');
INSERT INTO `t_skb` VALUES ('3', '1', '2', '630.66', '630.66', '44.40', '44.40', '586.26', '586.26', '1', '10', '2018-04-11 11:44:05', '18', '50000.00', '3', '3');
INSERT INTO `t_skb` VALUES ('4', '1', '2', '630.66', '630.66', '39.02', '39.02', '591.64', '591.64', '1', '10', '2018-05-11 11:44:05', '18', '50000.00', '3', '4');
INSERT INTO `t_skb` VALUES ('5', '1', '2', '630.66', '630.66', '33.60', '33.60', '597.06', '597.06', '1', '10', '2018-06-11 11:44:05', '18', '50000.00', '3', '5');
INSERT INTO `t_skb` VALUES ('6', '1', '2', '630.66', '0.00', '28.13', '0.00', '602.53', '0.00', '0', '10', '2018-07-11 11:44:05', '18', '50000.00', '2', '6');
INSERT INTO `t_skb` VALUES ('7', '1', '2', '630.66', '0.00', '22.60', '0.00', '608.06', '0.00', '0', '10', '2018-08-11 11:44:05', '18', '50000.00', '2', '7');
INSERT INTO `t_skb` VALUES ('8', '1', '2', '630.66', '0.00', '17.03', '0.00', '613.63', '0.00', '0', '10', '2018-09-11 11:44:05', '18', '50000.00', '2', '8');
INSERT INTO `t_skb` VALUES ('9', '1', '2', '630.66', '0.00', '11.41', '0.00', '619.25', '0.00', '0', '10', '2018-10-11 11:44:05', '18', '50000.00', '2', '9');
INSERT INTO `t_skb` VALUES ('10', '1', '2', '630.66', '0.00', '5.73', '0.00', '624.93', '0.00', '0', '10', '2018-11-11 11:44:05', '18', '50000.00', '2', '10');
INSERT INTO `t_skb` VALUES ('11', '1', '2', '52333.33', '0.00', '2333.33', '0.00', '50000.00', '0.00', '0', '1', '2018-09-11 11:45:53', '17', '6000.00', '2', '1');

-- ----------------------------
-- Table structure for t_sway
-- ----------------------------
DROP TABLE IF EXISTS `t_sway`;
CREATE TABLE `t_sway` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `way` varchar(100) DEFAULT NULL COMMENT '方式',
  `fw` varchar(200) DEFAULT NULL COMMENT '算法',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款方式状态（0不可用，1可用）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sway
-- ----------------------------
INSERT INTO `t_sway` VALUES ('2', '一次性还本付息', '一次性还本付息', '0');
INSERT INTO `t_sway` VALUES ('3', '先息后本', '先息后本', '0');
INSERT INTO `t_sway` VALUES ('4', '等额本金', '等额本金', '0');
INSERT INTO `t_sway` VALUES ('5', '等额本息', '等额本息', '0');

-- ----------------------------
-- Table structure for t_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(4) DEFAULT NULL COMMENT '优惠券类型，如现金劵，代金券，体验金',
  `tkmoney` decimal(7,2) DEFAULT NULL COMMENT '优惠券金额',
  `tktime` datetime DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ticket
-- ----------------------------
INSERT INTO `t_ticket` VALUES ('1', '1', '50.00', '2018-01-31 00:00:00');
INSERT INTO `t_ticket` VALUES ('2', '2', '30.00', '2018-01-31 00:00:00');
INSERT INTO `t_ticket` VALUES ('3', '3', '60.00', '2018-01-26 00:00:00');
INSERT INTO `t_ticket` VALUES ('4', '4', '1000.00', '2018-01-26 00:00:00');

-- ----------------------------
-- Table structure for t_txcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_txcheck`;
CREATE TABLE `t_txcheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `txid` bigint(20) DEFAULT NULL COMMENT '提现人id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_txcheck
-- ----------------------------
INSERT INTO `t_txcheck` VALUES ('1', '6', '1', null, '', '2018-01-16 11:07:21');
INSERT INTO `t_txcheck` VALUES ('2', '13', '1', null, '', '2018-01-16 11:07:25');
INSERT INTO `t_txcheck` VALUES ('3', '14', '1', '2', '', '2018-01-21 18:41:22');
INSERT INTO `t_txcheck` VALUES ('4', '11', '1', null, '', '2018-01-21 18:59:01');
INSERT INTO `t_txcheck` VALUES ('5', '18', '1', '2', '提交的个人信息很完善很真实', '2018-01-22 08:51:08');

-- ----------------------------
-- Table structure for t_tzb
-- ----------------------------
DROP TABLE IF EXISTS `t_tzb`;
CREATE TABLE `t_tzb` (
  `tzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户t_user表id字段',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `money` decimal(7,2) NOT NULL COMMENT '投资金额',
  `time` datetime NOT NULL COMMENT '投资时间',
  `nprofit` float(6,2) NOT NULL COMMENT '利率',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款id 取t_borrowapply表id',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tzb
-- ----------------------------
INSERT INTO `t_tzb` VALUES ('13', '1', '2', '50000.00', '2018-01-09 10:57:19', '7.00', 'PJZB2217', '17', null, null);
INSERT INTO `t_tzb` VALUES ('14', '1', '2', '6000.00', '2018-01-09 11:26:24', '11.00', 'PJZB3118', '18', null, null);
INSERT INTO `t_tzb` VALUES ('15', '2', '1', '3000.00', '2018-01-15 21:26:55', '7.00', 'PJZB1228', '28', null, null);
INSERT INTO `t_tzb` VALUES ('16', '2', '1', '1000.00', '2018-01-15 21:27:17', '6.00', 'PJZB1224', '24', null, null);
INSERT INTO `t_tzb` VALUES ('17', '2', '1', '1000.00', '2018-01-15 21:30:22', '9.00', 'PJZB1215', '15', null, null);
INSERT INTO `t_tzb` VALUES ('18', '2', '1', '6200.00', '2018-01-15 21:30:56', '5.00', 'PJZB2325', '25', null, null);
INSERT INTO `t_tzb` VALUES ('19', '2', '1', '52000.00', '2018-01-15 21:31:21', '6.00', 'PJZB2116', '16', null, null);
INSERT INTO `t_tzb` VALUES ('20', '2', '1', '3000.00', '2018-01-15 21:31:45', '5.00', 'PJZB3127', '27', null, null);
INSERT INTO `t_tzb` VALUES ('21', '2', '1', '2500.00', '2018-01-15 21:32:16', '6.00', 'PJZB3126', '26', null, null);
INSERT INTO `t_tzb` VALUES ('22', '41', '1', '2600.00', '2018-01-23 12:16:05', '7.00', 'PJZB1228', '28', null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `face` varchar(50) NOT NULL DEFAULT 'upload/123.jpg' COMMENT '头像',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `upwd` varchar(100) NOT NULL COMMENT '密码，进行MD5加密',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `tzm` varchar(100) DEFAULT NULL COMMENT '推荐码',
  `idtype` varchar(20) DEFAULT '身份证' COMMENT '证件类型',
  `idno` char(18) DEFAULT NULL COMMENT '证件号（身份证号）',
  `zpwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id， t_recommend推荐人表主键id',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（0男，1女）',
  `isvip` tinyint(4) DEFAULT '1' COMMENT '是否为VIP用户，0是，1否',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `t_user_phone_uindex` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'upload/123.jpg', '凤囚凰灬', '4QrcOUm6Wau+VuBX8g+IPg==', '13333333333', '259001', '身份证', '360730199901021111', '4QrcOUm6Wau+VuBX8g+IPg==', '1427916171@qq.com', '12121', null, '1', '1', null, null, '2018-01-01 20:40:13');
INSERT INTO `t_user` VALUES ('2', 'upload/123.jpg', '她只喝酒不说话', '4QrcOUm6Wau+VuBX8g+IPg==', '13361778694', '256002', '身份证', '360730199912121212', 'ZwsUcorZkCrsujLiL6T2vQ==', '2252064541@qq.com', '老师', null, '1', '1', null, null, '2018-01-05 20:40:21');
INSERT INTO `t_user` VALUES ('3', 'upload/123.jpg', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '18370710329', '256003', '身份证', '361731199205261103', '4QrcOUm6Wau+VuBX8g+IPg==', '2252064542@qq.com', '老李', null, '2', '1', null, null, null);
INSERT INTO `t_user` VALUES ('4', 'upload/123.jpg', '老张', '4QrcOUm6Wau+VuBX8g+IPg==', '18370715969', '256004', '身份证', '360730199212121212', '4QrcOUm6Wau+VuBX8g+IPg==', '2252064543@qq.com', '老大', null, '1', '1', null, null, null);
INSERT INTO `t_user` VALUES ('5', 'upload/123.jpg', '张三', '4QrcOUm6Wau+VuBX8g+IPg==', '18779749107', '256005', '身份证', '361732199110102020', '4QrcOUm6Wau+VuBX8g+IPg==', '2252064544@qq.com', '王老五', null, '2', '1', null, null, null);
INSERT INTO `t_user` VALUES ('6', 'upload/123.jpg', '天天', '4QrcOUm6Wau+VuBX8g+IPg==', '18779749108', '256006', '身份证', '361732199110102027', '4QrcOUm6Wau+VuBX8g+IPg==', '2252064545@qq.com', '李珊', null, '2', '1', null, null, null);
INSERT INTO `t_user` VALUES ('7', 'upload/123.jpg', '朋友', '4QrcOUm6Wau+VuBX8g+IPg==', '18174099439', '256007', '身份证', '360731199210222315', '4QrcOUm6Wau+VuBX8g+IPg==', '2252064546@qq.com', '三十', null, '1', '1', null, null, null);
INSERT INTO `t_user` VALUES ('25', 'upload/123.jpg', '曦哥哥', '4QrcOUm6Wau+VuBX8g+IPg==', '13479720508', '39175', '身份证', null, '4QrcOUm6Wau+VuBX8g+IPg==', '2252064547@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('27', 'upload/123.jpg', '余鹏', '4QrcOUm6Wau+VuBX8g+IPg==', '13333333334', 'a48b4', '身份证', null, '4QrcOUm6Wau+VuBX8g+IPg==', '2252064548@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('28', 'upload/123.jpg', '云谷', '4QrcOUm6Wau+VuBX8g+IPg==', '13333333335', 'cbb84', '身份证', null, null, '2252064549@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('29', 'upload/123.jpg', 'test1', '4QrcOUm6Wau+VuBX8g+IPg==', '18111111111', 'ca4ee', '身份证', '360731199102021126', null, '2252064555@qq.com', '老二', null, '2', '1', null, null, null);
INSERT INTO `t_user` VALUES ('30', 'upload/123.jpg', 'test', '4QrcOUm6Wau+VuBX8g+IPg==', '13555555555', '31edb', '身份证', null, '4QrcOUm6Wau+VuBX8g+IPg==', '2252164541@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('31', 'upload/123.jpg', '如何', '4QrcOUm6Wau+VuBX8g+IPg==', '18770714017', '63153', '身份证', null, null, '2252364541@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('33', 'upload/123.jpg', '陈六', '4QrcOUm6Wau+VuBX8g+IPg==', '18770714016', '345c6', '身份证', null, null, '2252564541@qq.com', null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('34', 'upload/123.jpg', '澂', '4QrcOUm6Wau+VuBX8g+IPg==', '18779077235', '411a5', '身份证', '362427199801270825', 'UsaeOlczEIGCMzHE5p0/Lg==', '2252764541@qq.com', 'nvv', null, '2', '1', null, null, null);
INSERT INTO `t_user` VALUES ('36', 'upload/123.jpg', 'test6', '4QrcOUm6Wau+VuBX8g+IPg==', '18174000000', 'b4bce', '身份证', null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('37', 'upload/123.jpg', 'test7', '4QrcOUm6Wau+VuBX8g+IPg==', '18319111111', '69353', '身份证', null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('38', 'upload/123.jpg', 'test8', '4QrcOUm6Wau+VuBX8g+IPg==', '18943111111', '639ae', '身份证', null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('39', 'upload/123.jpg', 'test0', '4QrcOUm6Wau+VuBX8g+IPg==', '18923131111', '64c37', '身份证', null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('40', 'upload/123.jpg', 'test10', '4QrcOUm6Wau+VuBX8g+IPg==', '13912345611', 'ee44e', '身份证', null, null, null, null, '6', null, '1', null, null, null);
INSERT INTO `t_user` VALUES ('41', 'upload/123.jpg', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '18174099445', 'e2286', '身份证', '360730199709191913', null, null, '温宁宁', '1', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for t_usermoney
-- ----------------------------
DROP TABLE IF EXISTS `t_usermoney`;
CREATE TABLE `t_usermoney` (
  `umid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `zmoney` decimal(10,2) DEFAULT '0.00' COMMENT '总资产',
  `kymoney` decimal(10,2) DEFAULT '0.00' COMMENT '可用余额',
  `symoney` decimal(10,2) DEFAULT '0.00' COMMENT '收益总额',
  `tzmoney` decimal(10,2) DEFAULT '0.00' COMMENT '投资总额',
  `djmoney` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `dsmoney` decimal(10,2) DEFAULT '0.00' COMMENT '待收金额',
  `jlmoney` decimal(10,2) DEFAULT '0.00' COMMENT '奖励金额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usermoney
-- ----------------------------
INSERT INTO `t_usermoney` VALUES ('1', '1', '116686.57', '9106.60', '13783.96', '106000.00', '114300.00', '1261.32', '1000.00');
INSERT INTO `t_usermoney` VALUES ('2', '2', '43923.05', '40943.40', '0.00', '68700.00', '0.00', '71679.65', '0.00');
INSERT INTO `t_usermoney` VALUES ('3', '8', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('4', '9', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('5', '10', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('6', '11', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('7', '12', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('8', '13', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('9', '14', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('10', '15', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('11', '16', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('12', '17', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('13', '18', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('14', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('15', '20', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('16', '21', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('17', '22', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('18', '23', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('19', '24', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('20', '25', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('21', '26', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('22', '27', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('23', '28', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('24', '29', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('25', '30', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('26', '31', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('28', '33', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('29', '34', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('31', '36', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('32', '37', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('33', '38', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('34', '39', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('35', '40', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('36', '41', '100.00', '100.00', '0.00', '2600.00', '0.00', '2675.85', '0.00');

-- ----------------------------
-- Table structure for t_userticket
-- ----------------------------
DROP TABLE IF EXISTS `t_userticket`;
CREATE TABLE `t_userticket` (
  `ukid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户id',
  `kid` bigint(20) DEFAULT NULL COMMENT '劵id',
  `tktime` datetime DEFAULT NULL COMMENT '领劵时间',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userticket
-- ----------------------------
INSERT INTO `t_userticket` VALUES ('1', '2', '1', '2018-01-01 08:03:00', '2');
INSERT INTO `t_userticket` VALUES ('3', '2', '2', '2018-01-10 18:00:00', '1');
INSERT INTO `t_userticket` VALUES ('4', '2', '2', '2018-01-12 14:12:04', '2');
INSERT INTO `t_userticket` VALUES ('6', '2', '1', '2018-01-16 14:44:39', '2');
INSERT INTO `t_userticket` VALUES ('9', '25', '2', '2018-01-17 11:07:23', '1');
INSERT INTO `t_userticket` VALUES ('10', '27', '1', '2018-01-18 10:09:57', '1');
INSERT INTO `t_userticket` VALUES ('11', '28', '1', '2018-01-18 10:47:25', '1');

-- ----------------------------
-- Table structure for t_ydate
-- ----------------------------
DROP TABLE IF EXISTS `t_ydate`;
CREATE TABLE `t_ydate` (
  `yid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '交易总额',
  `mmoney` decimal(7,2) DEFAULT NULL COMMENT '月交易总额',
  `tuser` int(11) DEFAULT NULL COMMENT '总用户数',
  `muser` int(11) DEFAULT NULL COMMENT '月用户数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Records of t_ydate
--查询所有用户角色以及权限
--select r.rname,h.huname,j.jurl,j.content from t_role r,t_jur j,t_huser h  where r.rid in(select rj.rid from t_rolejur rj) and j.jid in(select rj.jid from t_rolejur rj) and h.huid in(select ru.rid from t_roleuser ru) 

-- ----------------------------

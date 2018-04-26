/*
 Navicat Premium Data Transfer

 Source Server         : Zachary
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : estate

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 24/01/2018 15:23:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `agency_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('402880055e280ee6015e28cf2e0b0005', '七夕浪漫日 相约赣州城东观澜！', '2017-08-27 00:00:00', '2017-08-29 00:00:00', '赣州·兴国路章江风光带/武陵大桥桥头', '	周末(8月26-27日)晚上城东观澜综合楼顶露台将举办天台派对，大人们可以吃着龙虾烧烤侃侃大山，小孩可以在天台儿童娱乐区玩耍，再配上天台爱情的音乐，让这个七夕轻松又惬意。					\r\n					', '20170828202658.jpg', '402880055e26374e015e26827f4a0006', '402880105da09eb8015da0a1d5680000', 'Y');
INSERT INTO `t_activity` VALUES ('402880055e2bea3a015e2cc59bde0016', '国庆大酬宾', '2017-09-05 00:00:00', '2017-09-08 00:00:00', '江西赣州', '						\r\n	　286㎡君朢大宅 礼阅自然与艺术的回归				', '20170829145501.jpg', '402880055de58f1e015de5dddf74000b', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880105dbfaf2a015dbfb04aa00000', '快来看看', '2017-08-08 00:00:00', '2017-08-29 00:00:00', '红谷滩区九龙湖上饶大街与阁皂大道交汇处', '任购满100万送哈佛h3						\r\n					', '20170811194321.jpg', '402880105da5a937015da5aa81910000', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880105dd1022a015dd10fc8c20001', '10月开盘大放送', '2017-10-04 00:00:00', '2017-10-08 00:00:00', '红谷滩区九龙湖上饶大街与阁皂大道交汇处', '豆腐干士大夫士大夫				\r\n					', '20170811193058.jpg', '402880105da73e41015da74835fb0001', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880105e0ce0c7015e0ce206910000', '最划算的房子来了', '2017-08-02 00:00:00', '2017-08-18 00:00:00', '赣州章贡区', '222						骗你的，现在哪里还有什么内容', '20170829111413.jpg', '402880055de58f1e015de5e77e90000c', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880105e0ce0c7015e0ce2582b0001', '买房送家具', '2017-08-11 00:00:00', '2017-08-13 00:00:00', '赣州章贡区', '222						骗你的，现在哪里还有什么内容', '20170828135821.jpg', '402880055de58f1e015de5c64caa0005', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880105e0cf715015e0cf7e1d30000', '买房包装修', '2017-08-25 00:00:00', '2017-08-31 00:00:00', '赣州沙石镇', '222	骗你的，现在哪里还有什么内容', '20170828103010.jpg', '402880055de58f1e015de5c64caa0005', '4028800c5d86fa7b015d86fb264b0000', 'Y');
INSERT INTO `t_activity` VALUES ('402880455dea3c48015dea3cf2c40000', '的风格的风格的', '2017-10-28 00:00:00', '2017-10-31 00:00:00', '赣州南门口', '骗你的，现在哪里还有什么内容', '20170828135821.jpg', '', '', 'Y');

-- ----------------------------
-- Table structure for t_ads
-- ----------------------------
DROP TABLE IF EXISTS `t_ads`;
CREATE TABLE `t_ads`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ad_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `show_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `show_order` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ads
-- ----------------------------
INSERT INTO `t_ads` VALUES ('402880055e3ae583015e3ae666990000', '新房大促销', '<p class=\"otitle\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><span style=\"text-indent: 2em;\">6亿元，同比大增139%。</span><br/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">随着半年报披露净利润锐减，截至8月28日收盘，长城汽车港股下跌3.84%。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">在这样的情况下，收购Jeep一事被不少业内人士称作是“蛇吞象”。有不愿具名的分析师向记者表示，FCA如果要把Jeep卖掉，开出的价格绝对不会低，对于目前的长城来说，是否有足够的能力和资金来承担这笔收购，并不容乐观。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">同时他提到，就现在各方的态度来看，所谓的收购事宜也只是长城单方面表达了意愿。随着FCA方面发布了否认声明，似乎<img src=\"http://localhost:8080/Estate/upload/image/20170830/1504093492242009730.jpg\" title=\"1504093492242009730.jpg\" alt=\"u=1513796149,272970270&amp;fm=26&amp;gp=0.jpg\"/>对与长城接触一事表现冷淡。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong>广告费用大增</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">根据其半年报显示，1月份-6月份，公司的营业总收入为412.56亿元，同比下降1%；扣非净利润为20.92亿元，同比减少56.62%；归属于上市公司股东的净利润为24.2亿元，同比下降50.87%。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">对此，公司方面表示，上半年净利润锐减，主要有两个原因：一是让利卖车及营销活动和广告投放的大幅增加；二是为提升SUV产品的</p><p>asfsdssdfagfdgsdfgsdfhsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd<br/></p>', '20170901104039.jpg', '/Estate/ads/showAds?ads.id=402880055e3ae583015e3ae666990000', 'Y', 0, '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880055e3ae583015e3ae666990001', '买房哦', '<p class=\"otitle\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><span style=\"text-indent: 2em;\">6亿元，同比大增139%。</span><br/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">随着半年报披露净利润锐减，截至8月28日收盘，长城汽车港股下跌3.84%。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">在这样的情况下，收购Jeep一事被不少业内人士称作是“蛇吞象”。有不愿具名的分析师向记者表示，FCA如果要把Jeep卖掉，开出的价格绝对不会低，对于目前的长城来说，是否有足够的能力和资金来承担这笔收购，并不容乐观。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">同时他提到，就现在各方的态度来看，所谓的收购事宜也只是长城单方面表达了意愿。随着FCA方面发布了否认声明，似乎<img src=\"http://localhost:8080/Estate/upload/image/20170830/1504093492242009730.jpg\" title=\"1504093492242009730.jpg\" alt=\"u=1513796149,272970270&amp;fm=26&amp;gp=0.jpg\"/>对与长城接触一事表现冷淡。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong>广告费用大增</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">根据其半年报显示，1月份-6月份，公司的营业总收入为412.56亿元，同比下降1%；扣非净利润为20.92亿元，同比减少56.62%；归属于上市公司股东的净利润为24.2亿元，同比下降50.87%。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px;\"><br/></p>', '20170904110728.jpg', '/Estate/ads/showAds?ads.id=402880055e3ae583015e3ae666990001', 'N', 1, '2017-08-30 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880105e2da6d3015e2dca30b20003', '买房哦', '<p>rfafs<br/></p>', '20170901104146.jpg', '/Estate/ads/showAds?ads.id=402880105e2da6d3015e2dca30b20003', 'Y', 0, '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880435e3aca13015e3acf76100000', '豪华住宅即将开售', '<p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　一个人会不会享受生活，往往不仅仅是看他开什么车、戴什么腕表这么简单，还包括他住在哪里。所谓生活方式，讲的是经济独立的人们追求更高层次的生活质量的各种方法，选择一处住宅，体现着内心当中对自己的肯定，一份自己给自己的归属感;选择一处住宅，选的不是住宅本身，而是选择想要拥有什么样的生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"><strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">　　进可</strong><strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">繁华 退享宁静</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　喜欢城市间的宁静，但又留恋城市间的繁华。总想找一处既能享受生活间的宁静，又不落后于城市的繁华。位于东江源大道西侧金兰路北侧的金湾·爱尚里，悄声无息地将美学融入日常琐碎生活细节之中，让居于其中的人既能享受到市区繁华，又能拥有宁静的居住环境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"><strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">　　34.3%绿化率 打造生态宜居环境</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　金湾·爱尚里拥有34.3%的绿化率，合理的景观打造，有效消除建筑带给生活的压迫感，放飞视野，让您和家人位于阳台之上、或是临台于飘窗之前都可以直接的看到小区园林的风景。或是春天百花齐放的绚烂落英缤纷，或是和夏日浓阴下得闲的家人与友邻打一个招呼，或是秋日中从天际直泻进来的慵懒阳光，或是隆冬的早晨推窗即享无垠皑皑的雪景。这些舒阔的感觉，让你和家人拥有更广阔的天空与心境。</p><p><br/></p>', '20170901104659.jpg', '/Estate/ads/showAds?ads.id=402880435e3aca13015e3acf76100000', 'Y', 0, '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880435e3ad88b015e3ad993510000', '低密美宅 保留生活的纯粹怡然', '<p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　城市繁华向来与高密度成正比，拥挤、喧嚣已成为生活常态，私密、安静、敞阔的生活环境反而成为我们追求的品质生活。恒骄·玲珑苑为渴望亲近自然的赣州居民提供了低密的居家之所，实现生态、绿色的人居理想生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　每一位追求品质生活的人心中，都有一个魂牵梦绕的人居梦，这不仅是对人居环境的考量，更是对生活品质的甄选。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　恒骄·玲珑苑容积率低至2.0，绿化覆盖率达到30%，阳光、清风、绿树、蓝天在这里融合。休憩时刻，站在阔景阳台上，倚窗远眺，满眼翠绿将楼下风景尽收眼底。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　恒骄·玲珑苑匠心筑造低密住区，赋予生活纯粹的空间，将这座城市难得的绿色留给居住者，从此坐拥满园绿色和一生幸福。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　恒骄·玲珑苑约99-142㎡三至五房优质户型，板式结构，采光、通风、景观视野处处优越。同时，项目拥有儿童成长互动园林，包含认知成长了、探索成长、互动成长三大成长关爱体系，将自然、植物、儿童设施和人文关怀理念融合在一起，大大提高园林的实用性。恒骄·玲珑苑，为品质生活而来，一生之宅，纵享静逸美好时光。</p><p><br/></p>', '20170901104752.jpg', '/Estate/ads/showAds?ads.id=402880435e3ad88b015e3ad993510000', 'Y', 0, '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880435e3adb97015e3aeb06f00000', '多数人欣赏的风景 因少数人拥有而臻贵', '<p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　倚章江河畔，环视一众清风绿水。“耳得之而为声，目遇之而成色。”古往今来，文学上关于江湾的灿烂诗篇总是随着时间的流逝而历久弥新。而江湾生活自古便受到名人雅士的推崇，更因为江景的稀缺和不可求而成为多数人的理想生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　<strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">一席入湾藏大美，在这里放下世界</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　一江一世界，江河湖海，不同于河流的澎湃，湖水的冷冽，江湾因其纯粹深邃历经千年蛰伏，一直是人类所向往的栖居地。<a class=\"channel_keylink\" href=\"http://www.9ihome.com/showloupan600.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; list-style-type: none; outline: 0px; border: 0px; color: rgb(84, 84, 84); text-decoration-line: none;\">宝能太古城</a>位于章江湾区，在湾区占据U形章江大拐角，从江入湾，给予了高品质湾区更好的阐释。同时，凭借大平层空中视野，以及对空间方位的考究，成就了观江景更佳的产品优势。依江而居，是赣州人物对于世间万物的向往，也是放下天地对于生活的至上回归。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　<strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">3000㎡大师主题会所，高人间的平视</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　每一个城市人物都有着与之匹配的世界向往。太古城精工细著，打造逾3000㎡主题会所，逾2000万投入，典藏一座城市的瑰宝，也为成功人士构筑了品茗会客的理想之地。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　“艺术展示区、品茗区包厢、国内非物质文化遗产…”，艺术领地中的大千玩味，了却了层峰人物对于精致世界的心之驰往，也成就了高人间会心一笑的默契。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"><strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\">　　保姆房独立电梯，将时间回归圈子私享</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　未来永远是属于创造它的人。<a class=\"channel_keylink\" href=\"http://www.9ihome.com/showloupan600.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; list-style-type: none; outline: 0px; border: 0px; color: rgb(84, 84, 84); text-decoration-line: none;\">宝能太古城</a>以开拓性的尺寸打造三梯两户，开赣州豪宅之先河。三梯两户设置也让保姆房出入独立出来，与主人生活互不干扰，尊重了业主对私密需求的渴望的同时，也让圈子聚会的私密与时间的从容两者兼得。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p><br/></p>', '20170901104949.jpg', '/Estate/ads/showAds?ads.id=402880435e3adb97015e3aeb06f00000', 'Y', 0, '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880435e3adb97015e3aeb6c220001', '在时代更迭之处 只遇一处府院 不负期望', '<p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">面对机遇，经开区不断加大市政建设的规模。建设西城区、香港工业园、临空经济区等六大板块，合理布局科教文卫体项目、公共设施项目，完善城市配套功能。构建美丽城市家园。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　示意图</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　中梁·蟠龙府，位于西城区域，经开区交通主干道迎宾大道及金岭路，交通便利，规划多个综合体、公园等，让生活更加丰富多彩。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　示意图</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　中梁·蟠龙府，总建筑面积约15万㎡，新亚洲建筑风格。小区由洋房和高层构成，容积率仅为2.2。近2万㎡中式园林，绿化率超35%，更加亲近自然。宽敞的楼间距，高车位配比，让您享受西城品质生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　　示意图</p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\">　<strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\"><span style=\"color:#ff0000\">　城市展厅 荣耀启幕</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; list-style-type: none; outline: none; color: rgb(51, 51, 51); line-height: 29px; font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); padding: 0px 30px 10px !important;\"><strong style=\"margin: 0px; padding: 0px; list-style-type: none; outline: none;\"><span style=\"color:#ff0000\">　　到访有礼 恭迎品鉴</span></strong></p><p><br/></p>', '20170901105123.jpg', '/Estate/ads/showAds?ads.id=402880435e3adb97015e3aeb6c220001', 'Y', 0, '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880455e03d216015e03d2ba440000', '快来看', '                                     ', '20170825204727.jpg', '/Estate/ads/showAds?ads.id=402880455e03d216015e03d2ba440000', 'N', 0, '2017-08-21 00:00:00', 'Y');
INSERT INTO `t_ads` VALUES ('402880455e047ca6015e0489cf570000', '买房啦', '<p>dsfsadfsadf &nbsp;</p>', '20170904111059.jpg', '/Estate/ads/showAds?ads.id=402880455e047ca6015e0489cf570000', 'N', 1, '2017-08-21 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_agency
-- ----------------------------
DROP TABLE IF EXISTS `t_agency`;
CREATE TABLE `t_agency`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/aa.jpg',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `checked_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1',
  `created_time` date NULL DEFAULT NULL,
  `checked_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `name_2`(`name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_agency
-- ----------------------------
INSERT INTO `t_agency` VALUES ('4028800c5d86fa7b015d86fb264b0000', '恒大集团', '2012293155@qq.com', '123456', '温宁宁', '18174099445', '0797123', '吉安', '20170728101632.jpg', '是时候表演真正的技术了', '', '2017-07-28', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('402880105da09eb8015da0a1d5680000', '绿地集团', '321.com', '123456', '李宏', '13838384387', '0797438', '赣州', '20170901100930.jpg', '我们是最好的房地产公司', '', '2017-08-02', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('402880105dc5a8e1015dc5abedc80000', '龙湖地产', '3231.@com', '123456', '日高', '18174054518', '07974321', '南昌', '20170901101900.jpg', '龙湖地产，天下第一的房地产', '', '2017-08-09', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('402880105e26c067015e26c45bfa0000', '九龙桂园', '1@12222.com', '111111', '4655', '13766368446', '2343541', 'tianshang ', '20170901101924.jpg', '', NULL, '2017-08-28', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('4028802e5d87e33d015d87e4ffde0000', '华润置地', '123.cn', '123456', '李四', '18174099332', '099711003', '中国北京', '20170901101949.jpg', '做清闲的人', '', '2017-07-28', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('4028802e5d93652f015d936786320000', '新城地产', '123123.com', '123456', '张六', '18174099334', '123', '江西赣州', '20170901102046.jpg', '张三', '', '2017-07-30', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('4028802e5e22a982015e22c48a230000', '保利地产', '123@qq.com', '123456', '马云', '18174069534', '1231231', '上海', '20170901101121.jpg ', '', NULL, '2017-08-27', 'Y', 'Y');
INSERT INTO `t_agency` VALUES ('402as62e5e22a982015e22c48a230000', '招商地产', '659116@qq.com', '123456', '马化腾', '13207077446', '38384386', '广州', '20170901102108.jpg', NULL, '', '2017-08-27', 'Y', 'Y');

-- ----------------------------
-- Table structure for t_appointment
-- ----------------------------
DROP TABLE IF EXISTS `t_appointment`;
CREATE TABLE `t_appointment`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_arrive_time` datetime(0) NULL DEFAULT NULL,
  `arrive_time` datetime(0) NULL DEFAULT NULL,
  `house_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_appointment
-- ----------------------------
INSERT INTO `t_appointment` VALUES ('1', '402880105d9b25f1015d9b27f4830000', '402880055d8c1a49015d8c1dc1cc0001', '2017-08-01 10:14:55', '2017-09-05 00:00:00', '4028802e5ddea86f015ddeaa5d400000', '已购房', '2017-08-01 10:15:23', 'Y');
INSERT INTO `t_appointment` VALUES ('2', '402880105da6bc43015da6be325a0000', '402880055d8c1a49015d8c1cab590000', '2017-08-02 15:15:28', '2017-08-03 15:15:33', '402880055e0c649e015e0c6990ff0000', '已看房', '2017-08-02 15:15:57', 'N');
INSERT INTO `t_appointment` VALUES ('402880055e3fe5f6015e400229890004', '402880105dc5d69f015dc5d81d0e0000', '402880055e2bea3a015e2d0b8eb10018', '2017-09-06 00:00:00', NULL, '402880055e2bea3a015e2cb1b0810015', '已联系', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_appointment` VALUES ('402880635e4bb18b015e4bd1c8600001', '402880105da6bc43015da6c003e40001', '402880105de49f76015de4a0820c0000', '2018-09-04 00:00:00', NULL, '402880055e2bea3a015e2ca4df8f0013', '已购房', '2017-09-04 00:00:00', 'N');
INSERT INTO `t_appointment` VALUES ('402880635e4c95d4015e4cd4741a00b8', '402880105dba2970015dba2a02e00000', '4028802e5e2d1bbb015e2d1d95470000', '2017-09-20 00:00:00', '2017-09-04 00:00:00', '402880055e3fe5f6015e406f6c08001c', '已预约', '2017-09-04 00:00:00', 'Y');
INSERT INTO `t_appointment` VALUES ('4028ab1c5e4f8aed015e4fe75aa90016', '4028ab1c5e4f8aed015e4fe6eae30015', '4028802e5e2d1bbb015e2d1d95470000', '2017-09-15 00:00:00', NULL, '402880055e3fe5f6015e406c0512001a', '已购房', '2017-09-05 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `abstracts` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `article_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('402880105e3838a6015e38470f320001', '南昌湖居新生活 新力公园壹号美景与繁华转换自如', '从来名贵，必居于湖畔。追溯世界豪宅的发展史，临湖而居，一直都是层峰共识', '<p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">从来名贵，必居于湖畔。追溯世界豪宅的发展史，临湖而居，一直都是层峰共识。无论是东方“仁者乐山，智者乐水”的居住文化，还是西方的“流水别墅”，人类对湖居的追求从未停止。从华盛顿湖、日内瓦湖、到中国西湖，东西方文化虽有差别，但对“湖”的解读却惊人相似。“一湖一世界”，居住在河边、湖边或是海边，也一直是人们所渴望的。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">南昌人对于水的情节可谓由来已久、根深蒂固。“城在湖中、湖在城中”说的就是南昌，东湖、西湖、青山湖、象湖、艾溪湖、瑶湖……南昌市区内有十几个大大小小的天然湖泊，美丽的湖光水色、璀璨的人文景观，给人视觉的盛宴，精神的享受，也为南昌平添一份妩媚。择水而居或临湖而居也一直被品质南昌人所追求。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\"><strong>湖居新生活&nbsp;南昌人心之所向</strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">湖居的最大价值在于自然、自由、和谐的人文价值。在喧嚣的城市中，能够回归自然，又与自然共生，让所有的人情有独钟。在南昌就有这样一处生态圣地，波清水澜，不喧嚣，不嘈杂，更拥有着独一无二的低密规划和无与伦比的生态环境，这便是瑶湖。</p><p><br/></p>', '20170901105151.jpg', '影视', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880105e3fed94015e3ff558c20000', '顶层住宅利弊大PK！选中合适房源只需这4点！', '在高层住宅中，顶层的房子往往成了开发商手中的鸡肋，也是购房者观望徘徊的对象，利弊相伴，实在不敢轻易下手。', '<p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\"><strong>顶层的优点</strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\"><strong>1、景观和视野</strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">住在顶层的人至少不用担心隐私被窥探，同时也不用担心采光问题，这是一个优点。另一个是顶层视野开阔，比起低层的拥挤与狭隘，抬头所见只有高楼铁窗，顶层景观更佳，更有利于放松心情。最重要的是，顶层没有人来人往的噪杂声和楼上生活的影响，比较安静。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\"><strong>2、价格</strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">相比其他楼层，顶楼的单价便宜是最大的优点。购房者花最少的价钱享受到和其他业主相同的服务和配套，显然对于一整套房子来说，省下的是一大笔钱，减价不减配。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\"><strong>3、层高</strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">按照建筑设计标准要求，顶层住宅的层高要比标准层高多出10cm左右，有时候也恰恰因为这多出来的空间会让家里的面积完全变大不少，也可以邀请专业的装修设计公司，也许一个顶层大复式就可能被改成精致的小复式和阁楼，使用率也是大大的提高。</p><p><br/></p>', '20170825204459.jpg', '理财', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880105e3fed94015e3ff82bdf0001', '四大行半年报齐出炉 个人住房贷款增速纷纷下滑', '随着银行半年报接近尾声，工、农、中、建四大国有银行半年业绩报告均已出炉。', '<p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">随着银行半年报接近尾声，工、农、中、建四大国有银行半年业绩报告均已出炉。在今年上半年，四大行业绩出现回暖，而个人住房按揭贷款的增速普遍出现下滑。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">昨日发布的业绩报告显示，如果按照一年365天计算，相当于四家银行每天净赚约14.03亿元。四家银行净利润增速均出现了回暖。其中，工商银行是上半年实现净利润最多的银行，净利润为1537亿元。建设银行净利润增速最快，净利润为1390.09亿元，增速为3.8%。而中行上半年净利润为1037亿元，农行净利润为1086.7亿元。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">值得注意的是，在去年支撑各家银行业绩增长的个人住房按揭贷款业务，在今年上半年的增速却普遍出现了下行。中国银行发布的数据显示，个人住房按揭贷款上半年增长9.28%，较去年同期下降了7.7个百分点。而农业银行上半年按揭贷款增速为11.6%，同比下降4.5个百分点。建行业绩报告中也指出，个人按揭贷款增幅为9.50%，增速较上年同期放缓。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, arial; line-height: 30px; white-space: normal; widows: 1; text-indent: 2em;\">据工商银行行长谷澍介绍，上半年，工行按揭贷款比年初增加3700亿元，这些主要是支持自主性和改善性，首套房占比超过90%。“在新增的个人住房贷款中，一二线城市和三四线城市的比例大概在1比1，热点城市逐渐下降，16个热点城市的住房占比，较去年年底减少13个百分点。”对于未来发展，工行、中行在业绩发布会上均表示，仍将积极支持居民合理的购房需求，并坚守“房子是用来住的”原则，差异化发展个人按揭贷款业务。</p><p><br/></p>', '20170825204655.jpg', '理财', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880455df4794b015df479c87d0000', '恒大半年净利增两倍的逻辑 规模之王放慢脚步降杠杆', '公租房可成稳定器 租购同权仍有细节需落实', '<p>儿似的发射点<img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0020.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0050.gif\"/><img src=\"http://localhost:8080/Estate/upload/image/20170826/1503706728001048971.jpg\" title=\"1503706728001048971.jpg\" alt=\"u=2794525266,3079216591&amp;fm=26&amp;gp=0.jpg\" width=\"272\" height=\"180\"/></p><p>房地产调控何去何从</p><p><img src=\"http://localhost:8080/Estate/upload/image/20170825/1503664984328077573.jpg\" title=\"1503664984328077573.jpg\" alt=\"u=1513796149,272970270&amp;fm=26&amp;gp=0.jpg\" width=\"313\" height=\"218\"/><br/></p><p>在去年召开的中央政治局会议和中央经济工作会议上，关于房地产政策的最新表述，可以看出一些端倪。</p><p><br/></p><p>在我看来，表述是两句話。一句話是加强住房保障，第二句話叫改善宏观调控。这次经济工作会议把保障放在了前面，把调控放在了后面。可以看出新的调控思路的雏形——先解决保障的问题，剩余的交给市场。</p><p><br/></p><p>取消错误调控，不一刀切</p><p><br/></p><p>从统计数据可以看出，过去一、二、三线城市房价的上下浮动基本上是同向变化，最近两年开始明显分化。不管是面积、销售、施工、价格，历史上的“同上同下”，现在都变成了逆向变化，这表明房地产调控已经不具备一刀切的条件。<img src=\"http://localhost:8080/Estate/upload/image/20170825/1503665003512015989.jpg\" title=\"1503665003512015989.jpg\" alt=\"u=2794525266,3079216591&amp;fm=26&amp;gp=0.jpg\" width=\"493\" height=\"229\"/></p><p><br/></p><p>在我前段时间参加的一个讨论房地产调控政策的全国政协会议上，重庆、山东、黑龙江、陕西四个省市的意见比较激烈，都提出了市场调控不能再一刀切。以山东为例，因为人口流入不多、土地指标充分，山东的平均房价比全国的还低1340元。</p><p><br/></p><p>住建部原副部长、中国房地产业协会理事会会长刘志峰在发言中提出，过去10年房地产政策的错误主要是因为调控的错误，最后导致市场极端不平衡，出现了很多问题。</p><p><br/></p><p><span class=\"edui-editor-imagescale-hand1\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: n-resize; top: 0px; margin-top: -4px; left: 284.5px; margin-left: -4px; color: rgb(85, 85, 85); font-family: LatoRegular, \"></span><span class=\"edui-editor-imagescale-hand2\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: ne-resize; top: 0px; margin-top: -4px; left: 569px; margin-left: -3px; color: rgb(85, 85, 85); font-family: LatoRegular, \"></span></p><p>调控政策不能一刀切，更不能频繁出台调控政策。房地产是一个长周期的行业，如果不到一个生产周期就进行调控，就会出现逆向的效果，这个逆向和货币政策又会产生冲突，形成双重压力。</p><p><br/></p><p>短期频出的调控政策会造成投向房地产的资金剧烈动荡，货币时松时紧，不能保持一个平衡的状态，结果可能是今年货币供应多了，明年的供应又迅速地减少。最近10年来始终如此。</p><p><br/></p><p>另外，土地市场也会随着短期调控政策波动频繁且剧烈。从历史的数据可以看出，土地供应量有时负增长，有时高增长。在房地产市场上，经常会出现这样的情况，新供应土地之后，在房子尚未建成之时，调控即已开始，导致房地产供大于求；还有一种情况是，房子供给严重不足时，因为上一阶段对土地的紧缩调控，导致地产商想盖房子时，却没有土地供给。</p><p><br/></p><p>2013年的土地供应量比2012年略有增加，明年的住房供应量因此会比今年有所好转，整个价格会相对平稳，涨幅会略有下降。我想借这句話说明——采取什么样的宏观调控政策，将会对未来房地产市场产生重大影响。2013年年底，我们看到有17个城市又出台了一些政策，按照“国五条”签订的房价上涨任务指标而采取行动。这依旧是不顾周期的调控行为，对当地的市场都产生了一些不良影响，如果这些政策继续的話，房价仍然还会爆涨。</p><p><br/></p><p>因此，房地产政策亟须转向长期化，建立以法治为基础的长效机制，对房地产业立法迫在眉睫，其核心是对土地的高度垄断机制开刀。</p><p><br/></p><p>土地在严重垄断和供应不足中，形成了高企的价格。很多人认为是开发商把大量的土地拿走了，最后导致18亿亩红线。事实上，住宅所占的土地供应量是极低的，大量的土地不是给了房屋建筑，而是园区、工矿、开发区等等，它们占的土地远大于住宅的比例。从土地价格的变化就可以看出，住宅价格的涨幅是最快的，超过5倍，而工业土地只上涨了七成。道理很简单，前者供应量少，后者供应量多。</p><p><br/></p><p><br/></p>', '20170901105259.jpg', '内政', '2017-08-18 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880455e07c093015e07d928a50000', '如何选好看的房子', '曝光银十热门楼盘 这些房源是购房者心头好', '他才多大？难道已经达到了和火影大人三忍大人他们一样的境界？！\r\n\r\n    虽然羽说得轻描淡写，但是言语之间显露出来的自信还是让在场的众人震惊不已。\r\n\r\n    虽说在羽这个年纪达到影级的人物历史上并不是没有，在五大忍者村建立以前战乱不休的战国时代，就出过不少这样的忍者。\r\n\r\n    在比如前不久水之国雾隐忍者村刚上任的四代水影，听说也是一个和羽差不多大的少年，但是最起码人家是三尾人柱力，体内有着尾兽的力量。\r\n\r\n    而羽呢？虽说拥有特殊的血继限界线遁，但是归根结底还是一个籍籍无名的平民忍者，凭什么在这个年纪却可以达到这样打破常规的实力？\r\n\r\n    “明天这场战斗，岩忍吃了上次的亏，估计还会派出更多的兵力。”\r\n\r\n    这时沉稳的秋道堂东干咳一声，将所有人的注意力拉回到了明天的战斗上，“不过之前我已经发了密函给火影大人，相信新的支援部队很快就会往我们这边赶来。”\r\n\r\n    “是吗？那太好了！”\r\n\r\n    其他众人听到支援将会抵达，顿时士气大增。\r\n\r\n    “不过……”\r\n\r\n    秋道堂东这时一脸正色看着眼前的羽，“明天这场战斗，就拜托你了羽。”\r\n\r\n    毕竟通过上次的战斗，所有人都知道，如果这场战争没有羽的发挥，等待木叶的，将会是全军覆没。\r\n', '20170825204459.jpg', '内政', '2017-08-22 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880455e080cf1015e084254130000', '明知道房地产商有问题,但房子便宜,你还会买么?', '金九银十已过大半赣州这些楼盘都是潜力股!', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0039.gif\"/>sdfsadf<strong>asdfasdfsdfsadfsdfasdfasdfasdfsdfsadfsadf</strong><strong><span style=\"border: 1px solid rgb(0, 0, 0);\">asdfasdfasdf</span></strong></p><p><strong><span style=\"border: 1px solid rgb(0, 0, 0);\"><span style=\"font-size: 24px;\">sdfasdfasdfasdfasdfasfwertawertwer<img src=\"http://img.baidu.com/hi/jx2/j_0063.gif\"/></span></span></strong><span style=\"border: 1px solid rgb(0, 0, 0);\"><span style=\"font-size: 24px;\"><sup><em>sdfasdfasdfasdfasdf</em></sup></span></span><strong><span style=\"border: 1px solid rgb(0, 0, 0);\"><span style=\"font-size: 24px;\"></span><br/></span></strong></p>', '20170825204509.jpg', '内政', '2017-08-22 00:00:00', 'Y');
INSERT INTO `t_article` VALUES ('402880455e091490015e0916f3ab0000', '为什么有些在购买二手房时，有些房主要求一手清全款，如果办理按揭，他同样是应该可以拿到全款的呀？', '中航云府洋房在售一次性付款97折按揭99折', '<p><img src=\"http://localhost:8080/Estate/upload/image/20170825/1503665135024029782.jpg\" title=\"1503665135024029782.jpg\" alt=\"u=2794525266,3079216591&amp;fm=26&amp;gp=0.jpg\" width=\"211\" height=\"193\"/></p><p>we让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地方史蒂夫纳什的牢房吗那是似的发射点立法模式的李凡时代付款啊松井大辅啦世界的分厘卡圣诞节发上的飞机啊是两地分居阿里山扩大飞机啊是塑料袋放进阿斯利康的飞机啊是的但是技法卢卡斯的飞机撒冷的发生的手动阀手动阀，阿斯蒂芬士大夫马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地方史蒂夫纳什的牢房吗那是似的发射点立法模式的李凡时代付款啊松井大辅啦世界的分厘卡圣诞节发上的飞机啊是两地分居阿里山扩大飞机啊是塑料袋放进阿斯利康的飞机啊是的但是技法卢卡斯的飞机撒冷的发生的手动阀</p><p><img src=\"http://localhost:8080/Estate/upload/image/20170825/1503665152793001942.jpg\" title=\"1503665152793001942.jpg\" width=\"386\" height=\"349\" alt=\"u=4079609042,2946133588&amp;fm=26&amp;gp=0.jpg\"/></p><p>动阀手动阀，e让位发马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地<img src=\"http://img.baidu.com/hi/jx2/j_0027.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0070.gif\"/>模wewe&#39;r&#39;t&#39;we&#39;r&#39;w&#39;we&#39;r&#39;we&#39;r&#39;we&#39;r&#39;we&#39;r&#39;r&#39;t&#39;we&#39;r&#39;w式we&#39;r&#39;t&#39;we&#39;r地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿斯顿发生，1手动阀手动阀，e让位发射点发射点发卡了似的撒旦发生的是疯狗模式地方啦没事地马上到了父母卡桑德拉发上点击发送；了的发售登陆士大夫，阿</p>', '20170825204655.jpg', '理财', '2017-08-22 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `des` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES ('402880455df013d2015df0147a810000', 'IT', '', 'Y');
INSERT INTO `t_article_type` VALUES ('402880455df024f7015df03e785c0000', '内政', '有光政府	', 'Y');
INSERT INTO `t_article_type` VALUES ('402880455df024f7015df0420b7b0001', '游戏', '介绍游戏					', 'Y');
INSERT INTO `t_article_type` VALUES ('402880455df2c5aa015df2cb233e0000', '影视', '与影视幽暗						\r\n					', 'Y');
INSERT INTO `t_article_type` VALUES ('402880455df2e0cf015df2e12c050000', '明星', '有关明星', 'Y');
INSERT INTO `t_article_type` VALUES ('402880455e077d28015e077e42430000', '理财', '学会理财', 'Y');

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_floor` int(11) NOT NULL,
  `total_lift` int(11) NOT NULL,
  `floor_rooms` int(11) NOT NULL,
  `total_room` int(11) NOT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27a48a310057', '汤臣一品-A栋2区', 30, 6, 3, 90, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'N');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27a559ec0058', '汤臣一品-A栋3区', 30, 6, 4, 120, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27a5fff00059', '浅水湾别墅-A栋2区', 3, 1, 1, 4, '402880055de58f1e015de5b2749a0002', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区', 6, 2, 4, 24, '402880055de58f1e015de5b2749a0002', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27a7de56005b', '浅水湾别墅-A栋1区', 8, 2, 4, 32, '402880055de58f1e015de5b2749a0002', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27aabc72005c', '雍晟·上城湾畔-B栋A区', 30, 4, 2, 60, '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27ab2ed5005d', '雍晟·上城湾畔-B栋C区', 40, 4, 2, 80, '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27ac977b005e', '玺宝·城上城-C栋A区', 28, 4, 3, 84, '402880055e26896c015e26af58fc0005', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e26f7c4015e27bfdaa4009a', '雍晟·上城湾畔-B栋B区', 34, 4, 2, 68, '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e2bea3a015e2c962202000d', '保利海德公园-A栋1区', 18, 4, 4, 72, '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e2bea3a015e2c96fb66000e', '保利海德公园-A栋2区', 30, 4, 4, 120, '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880055e2bea3a015e2c97a619000f', '保利海德公园A栋3区', 30, 4, 4, 120, '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880105e2da6d3015e2db6c9590001', '按时啊', 60, 4, 5, 30, '402880055e26896c015e268fd84c0000', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('4028802e5de08e1e015de08e6d340000', '新力合园-A栋1区', 18, 4, 2, 36, '402880105da5a937015da5aa81910000', '2017-08-14 00:00:00', 'N');
INSERT INTO `t_building` VALUES ('4028802e5e03f68e015e048fcb510000', '中洲中央公园-B栋2区', 25, 4, 2, 50, '402880055de58f1e015de5f9406a000f', '2017-08-21 00:00:00', 'N');
INSERT INTO `t_building` VALUES ('4028802e5e03f68e015e049289570003', '汤臣一品-B栋1区', 30, 4, 2, 60, '402880055de58f1e015de5a1c5e30000', '2017-08-21 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('4028802e5e074973015e074d43940000', ' 汤臣一品-A栋1区', 30, 4, 1, 30, '402880055de58f1e015de5a1c5e30000', '2017-08-22 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('402880635e4c95d4015e4cbd34630001', 'A栋一区', 60, 4, 2, 50, '402880055e26374e015e267a2d440005', '2017-09-04 00:00:00', 'Y');
INSERT INTO `t_building` VALUES ('4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋', 6, 2, 4, 24, '4028802e5e2b6799015e2be7c3f30001', '2017-09-05 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_buildings
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings`;
CREATE TABLE `t_buildings`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `agency_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `floor_area` double NULL DEFAULT NULL,
  `building_area` double NULL DEFAULT NULL,
  `house_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `building_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `avg_price` double NOT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `open_date` date NULL DEFAULT NULL,
  `total_rooms` int(11) NULL DEFAULT NULL,
  `reception_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `green_ratio` double NULL DEFAULT NULL,
  `plot_ratio` double NULL DEFAULT NULL,
  `property_company` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `property_fee` double NULL DEFAULT NULL,
  `car_station` int(11) NULL DEFAULT NULL,
  `traffic` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `equipments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/jpg',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_buildings
-- ----------------------------
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5a1c5e30000', '4028800c5d86fa7b015d86fb264b0000', '汤臣一品', '上海市上海市市辖区嘉定区', '上海市陆家嘴滨江大道旁', 20000, 115000, '住宅', '塔楼', 121.48, 31.22, 51000, '恒大集团', '2017-06-14', 446, '浦东大道浦东南路', '68554378', 70, 90, '汤臣集团有限公司', 800, 429, '公交：798路浦东南路银城中路站，795路浦城路东昌路站，81路，86路等；自驾：浦东大道浦东南路，陆家嘴环路世纪大道等	\r\n					', '						\r\n学校 菊园洋泾实验学校、菊园幼儿园、东格致中学\r\n医院 东方医院、仁济医院\r\n银行 花旗银行、兴业银行\r\n商场 易初莲花、正大广场\r\n餐饮 海龙海鲜舫、香格里拉大酒店\r\n娱乐 滨海高尔夫、东方明珠			', '20170815192250.jpg', '						\r\n汤臣一品标准层只有2个户型！A-D栋标准层面积为597平，三梯一户；B-C栋标准层面积为434平。在售为A-B栋，C-D栋对外出租。其中，B栋总高49层，标准层434平，高区8套复式，面积764--1202平；A栋总高45层，标准层597平，270度江景，距江仅50米，真正一线江景！4套高区复式，面积876--986平！\r\n价格：B栋仅余27楼上房源在售，单价16万起，总价约7000万，复式单价20万起！\r\nA栋房源相对充足，单价20万起，每套总价均超过1亿。复式单价约25万起。', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5b2749a0002', '4028800c5d86fa7b015d86fb264b0000', '浅水湾别墅 ', '青岛', '青岛华山国际高尔夫球场', 7000, 70, '花园洋房', '板楼', 119.3, 31, 1500000, '恒大集团', '2017-06-14', 150, '青岛华山国际高尔夫球场内', '5328873', 97, 99, 'Sunshine Seacoast', 10000, 1000, '						\r\n在穗胜门乘345路汽车到昌平换乘314路前往。地安门有定时班车往返				', '						\r\n		以社区大型景观游泳池为节点，顺地势往两畔弯曲舒展，\r\n完美的融入华山高尔夫3000亩无边绿意之中。\r\n社区湖面面积高达28500M2，户户与水为邻，在无边的湖光与绿意中，涵养诗意人生			', '20170815194104.jpg', '						\r\n					浅水湾高尔夫别墅如同一个大花园。\r\n3期铂宫260M2的别墅享有1200M2的大空间。\r\n赠送面积高达140M2~920M2，部分更享有赠送的精装景观花园。\r\n极尽富贵的3000亩高尔夫球场绿色，作为生活唯一大面积绿化领地。\r\n10大私家果岭，3012株名贵树木、罕见的孔雀湖……只为不凡人士绽放。', '2017-08-15 00:00:00', 'N');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5ba6fa00003', '4028800c5d86fa7b015d86fb264b0000', '保利海德公园', '北京市', '海淀区北三环蓟门桥北500米', 450000, 100000, '别墅', '塔楼', 114.75, 37.34, 9998, '恒大集团', '2017-07-18', 530, '海淀区北三环蓟门桥北', '1244535', 50, 69, '保利物业管理（北京）有限公司', 9.8, 550, '						\r\n		海德公园处于北三环核心地带，交通四通八达，轨道交通及主干道环伺，众多公共交通方式及路线为项目出行提供保证			', '						\r\n		海德公园所在的学院路是北京乃至全国最知名的学府区，周边各学龄学校、高等院校林立，人文气息浓厚。此外，项目周边政治、文化、历史、自然景观资源皆十分丰富，可谓齐集自然、历史、人文之大成。			', '20170815194946.jpg', '						\r\n			保利海德公园，位于海淀区北三环蓟门桥北500米路西。项目总建筑面积约10万平米，采用维多利亚时期纯正英伦风格，打造一个集墅品公馆、城市别墅、五星级酒店、甲级写字楼于一体的高端社区。		', '2017-08-15 00:00:00', 'N');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5beb16b0004', '4028800c5d86fa7b015d86fb264b0000', '望京·金茂府', '望京区', '朝阳区广顺桥西北500米', 379835, 86817, '住宅', '塔楼', 117.8, 34.35, 89002, '恒大集团', '2016-10-14', 314, '朝阳大道', '0965378', 30, 2.5, '中化金茂物业管理(北京)有限公司', 20, 340, '						\r\n	周边地铁5号线、10号线、13号线、15号线、机场快轨；周边公车404、409、416、422、621、630、632、667、695、707、966、991、运通104、运通111路车				', '						\r\n	周边商业：欧尚超市、百安居、六佰本、家乐福、宜家特、宜家家居、华彩商业中心、NOVO、望京新世界、望京华堂\r\n周边公园：朝来森林公园、望湖公园、大望京公园、北小河公园、太阳宫公园、四得公园\r\n周边医院：望京医院、和睦家医院、美中宜和医院、中国中医科学院望京医院，北京惠兰医院，北亚医院，天使妇儿医院等\r\n周边学校：八十中、陈经纶中学、韩国国际学校、格顿双语幼儿园、朝师附小、首都师范大学附属中学、中央美院、来广营中心小学、首都师范大学、北京青年政治学院、中央美院、中医药大学东区等				', '20170815195426.jpg', '		望京·金茂府位于北京国际大都会之全球门户大望京区域，以全球顶级精装品质，九年制一站式名校教育，稀有3米台地主题园林等至臻价值，将人居品质推向新的高度。尤其是由12大绿色科技系统所创造的恒温、恒湿、恒氧的舒居环境，上演了智慧居住的极致盛宴。				\r\n					', '2017-08-15 00:00:00', 'N');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5c64caa0005', '4028800c5d86fa7b015d86fb264b0000', '保利花园', '广东省珠海市香洲区', '广州市海珠区工业大道', 220000, 500000, '住宅', '塔楼', 113.14, 23.08, 8897, '恒大集团', '2017-08-14', 1845, '天心区湘府西路省政府西行370米（省交通厅新址西侧）', '0987544', 57, 30, '耿佳丽物业有限公司', 10, 1900, '						\r\n		乘坐105，134，105区间，地铁1号线可到达。乘坐134，在交通厅下往西100米即到达；乘坐705在五凌电力南站下往西200米即到达；乘坐105区间在青少年活动中心下，往西走大约10分钟即到达；乘坐长株潭201、长株潭202路在省政府站下，往西走大约15分钟即可到达\r\n			', '						\r\n		周边公园：省府文化公园、豹子岭公园、杜鹃花公园、沿江风光带\r\n周边医院：长沙市中心医院、中医大学附属区院、省医疗中心、湖南省第二人民医院等\r\n周边学校：明德中学、新姚小学、九峰小学、青园小学，中南林业科技大学、长沙铁道学院、湖南女子大学、			', '20170815200244.jpg', '						\r\n	项目总规划用地15万平米，建筑面约35万平方米，是省府核心区域内大型生态宜居社区。项目共分三期开发，其中一期总建筑面积6万多平方米，由5栋小高层建筑组成，总户数为341户；二期总建筑面积约4万平方米，由6栋小高层建筑组成，总户数为267户，目前一、二期均已售罄，三期在建中。				', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5ccc95b0007', '4028800c5d86fa7b015d86fb264b0000', '恒大御景湾', '海口市 (海口秀英区)', '海口市西海岸·盈滨半岛旅游度假区二环路', 239333, 559999, '公寓', '塔楼', 114.17, 22.7, 19000, '恒大集团', '2017-08-20', 3730, '海口西海岸·盈滨半岛旅游度假区二环路', '6780244', 50, 1.8, '金碧物业有限公司海南分公司', 1.8, 3737, '		区域三维交通日趋完臻，15分钟连接CBD中心区；20分钟直达海口美兰国际机场，瞬息通达全国；15分钟直达海口东线高铁站，衔接建设中的西线高铁实现一小时环岛生活圈；规划建设的跨海大桥桥头堡位于区域板块内；绕城高速连接东、西、中线出入口，交通路网发达，尽享城市繁华。			', '						\r\n		商业中心：26万㎡深圳东购物娱乐中心\r\n教育中心：15年一站式名校教育体系\r\n酒店中心：五星标准龙光城戴斯酒店\r\n　　体育中心：近万平全能健康运动中心\r\n　　湖泊中心：南北双湖景观生态大氧吧\r\n　　交通中心：跨多元都会生活交通枢纽站			', '20170815200949.jpg', '						\r\n				海南恒大御景湾外拥琼州海峡壮阔海景，内揽陆地湾海园区御湖，稀缺资源成就359亩双海度假生活社区。精心打造中央内湖，萃取欧陆古典元素，以景观水系、珍贵植被为核心，打造世界级皇家园林，贵族品位彰显不凡。金碧物业——国际品质，24小时全天候“管家式”贴心服务，尊崇礼遇，尽享海居城市铂金生活。	', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5d094fe0008', '4028800c5d86fa7b015d86fb264b0000', '龙光城', '惠州', '龙岗区坪山新区兰竹路东(深惠经济合作区)', 5000, 400, '别墅', '板楼', 117.8, 45.9, 12000, '恒大集团', '2017-07-18', 335, '亚湾石化大道—西南大道', '5589034', 3.4, 2.7, '龙光物业管理公司', 8, 350, '						\r\n		厦深高铁全线通车，停靠深圳坪山站距龙光城不到10分钟车程，加之已有的深汕高速和沿海高速，远程出行自在无忧。龙光城内的专属社区巴士，每天27班次直达罗湖、福田、龙岗，满足业主外出交通，工作日更增设早晚7点班次，上班、生活两不误。而今年更将引进多条深圳公交线路，并设立龙光城站。			', '						\r\n				银行：响水河工行、西区工行、中行提款机(新华昌)、建行提款机(龙亿)、建行(熊猫国际)；酒店：新都会大酒店、琼苑国际大酒店、中海酒店、假日酒店；菜市场：老畲菜市场(龙光城旁边)、新寮菜市场、樟树浦菜市场、东联菜市场；购物中心：福鑫购物、德洲城超市、西区好宜多、沃尔玛、人人乐；\r\n周边公园：深圳聚龙山公园、滨河休闲绿化带(规划中)\r\n周边医院：坑梓人民医院、惠阳人民医院、大亚湾人民医院、西区医院；\r\n周边学校：大亚湾三中、宣平小学、新畲小学、上扬小学、樟浦小学、新廖小学；	', '20170815201358.jpg', '						\r\n		龙光城讲究建筑与环境的紧密结合，与本地文化气候特征相互呼应，有值得品味和揣摩的空间层次，通过层次划分，形成以入口商业广场至中心湖区为主轴的风格化景观，建筑、广场、街区、庭院、小品等近人的尺度感倾心营造了一个威严、宏伟而又典雅、富于趣味性的地中海风情社区，设计中引用现代国际景观的重要理念，在植物设计中重点考虑了纳荫保健的功能，无论是规划还是材料的应用，以及将来的物业管理都能体现这种对环境及未来的考虑			', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5d4dc050009', '4028800c5d86fa7b015d86fb264b0000', '恒大雅苑', '九龙坡区', '九龙坡华岩新城华福大道北段29号', 318666, 970000, '写字楼', '塔楼', 113, 33.06, 7700, '恒大集团', '2017-06-20', 7249, '恒大雅苑营销中心位于开福万家丽路北路一段699号(月湖公园北侧)', '6679045', 30.5, 2.6, '金碧物业管理有限公司', 1.5, 7300, '						\r\n		838(西城绿锦站→南坪辅仁路)，487(毛线沟→巴福)，486(西彭→杨家坪)，478(美每家→杨家坪)，259(小南海水泥厂→锦霞街)等			', '						\r\n				周边商业：3万余方风情商业街\r\n周边公园：华岩寺风景区、龙门阵魔幻山主题公园、市政休闲公园\r\n　　周边医院：九龙坡区第二人民医院\r\n　　周边学校：重庆外国语学校﹑国际学校﹑人和小学﹑人和中学﹙初中﹚、田坝小学﹑田坝中学﹙初中﹚	', '20170815201838.jpg', '				恒大地产集团扛鼎巨献恒大雅苑恢宏揭幕。以118万㎡华岩新城大盘之势打造旷世力作，傲踞华岩新城中心，紧临200亩城市原生公园，阔悦1609亩华岩旅游区盛景，轻轨二号线和五号线轻松通达各区中心。项目建于浅丘地貌自然高地之上，由A.B两区——点式小高层与高层围合而成，以现代简约风格建筑展现公园生态宜居品质。68-133㎡舒适两房、臻稀三房、尊崇四房饱览自然山水。		\r\n					', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5d8fc49000a', '4028800c5d86fa7b015d86fb264b0000', '湘江一号', '长沙经济开发区', '芙蓉北路与创远路交汇处', 617700, 947801, '别墅', '板楼', 112.5, 28.12, 20000, '恒大集团', '2017-06-06', 3569, '开福区创远路1号（芙蓉北路与创远路交汇处）', '5367908', 48.6, 0.6, '长沙创远物业管理有限公司', 2.2, 3600, '						\r\n			可搭乘128、801路到兴联学校下车即可。		', '						\r\n			休闲：鹅羊山公园、秀峰山公园、沿江风光带、私家山体福地公园、两馆一厅\r\n综合商场：华润万家\r\n幼稚园：诺贝尔国际双语幼儿园\r\n中小学：诺贝尔国际双语幼儿园、诺贝尔小学、兴联学校、周南中学\r\n银行：建设银行、农业银行、中国银行、工商银行\r\n邮局：中国邮政\r\n医院：湘雅医院、湘雅泰和医院\r\n内部商业街，会所		', '20170815202309.jpg', '						\r\n	湘江壹号位于长沙定位于高端文化区域的开福区城北片区，项目紧邻规划在建的两馆一厅，而在建的地铁1号线汽车北站站和福元路站均在此区域之内。项目依靠城市第一主动脉芙蓉北路配以浏阳河过江隧道连接湘江大道，加上在建的福元路湘江大桥以及福元北路，本区域将在数分钟内通达\r\n				', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5dddf74000b', '4028800c5d86fa7b015d86fb264b0000', '锦绣华城', '哈尔滨西部整体开发区', '学府路382号', 800000, 779808, '住宅', '板楼', 125.42, 130.28, 9990, '恒大集团', '2017-08-11', 4234, '	 南岗区学府路382号', '4678903', 30, 3.9, '哈尔滨弘润物业管理有限公司', 3.1, 4400, '						\r\n			68、104、114、220、343、369（新中新集团下车）地铁：地铁一号线首站		', '						\r\n		学校：学府小学，哈尔滨铁路第八小学，哈尔滨54中学，73中学，师大附中\r\n幼稚园：黑大幼儿园，申童幼儿园\r\n综合商场：学府服装城商圈及哈西商圈，项目自行配套商业步行街及大型商超医院：医大二院，二一一医院\r\n邮局：学府路邮政储蓄\r\n银行：建设银行，农业银行，工商银行，邮政储蓄，兴业银行\r\n1、雅园、霁园：2000平方米休闲会所\r\n2、滨园：配有休闲会所\r\n3、一栋四层独立商超			', '20170815202829.jpg', '						\r\n				锦绣华城汇集多元精品业态，以法式新古典主义风格为基调打造集板式高层、精品公寓、餐饮购物街、大型超市、星级双会所等为一体的正地铁生活国度，树立特色的城市CID（中心智力区）生活典范，将完全升级改善区域内数十万人的生活模式。	', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5e77e90000c', '4028800c5d86fa7b015d86fb264b0000', '金地艺境', '上海宝山区', '宝山区台路515弄50号(近真陈路)', 91000, 182000, '写字楼', '板楼', 119.78, 30.65, 18000, '恒大集团', '2017-08-01', 1912, '东湖高新技术开发区康魅路1号', '35678964', 35, 2, '上海金地物业服务有限公司', 2.85, 2000, '		离外环丰翔路出口1.5公里\r\n地铁：步行到7号线15号启华路站10分钟，17号丰翔路站5分钟。离虹桥枢纽18公里，人民广场23公里。				\r\n					', '	周边商业：好又多大卖场、苏宁电器、锦秋新天地商业圈等\r\n周边医院：华山医院北院\r\n周边学校：祁连山路二学，上师大附中					\r\n					', '20170815203859.jpg', '						\r\n			金地艺境距离虹桥人民广场16公里、大虹桥板块15公里，是离浦西双中心最近的外环板块之一。距外环线丰翔路口1.5公里，A20及沪嘉高速公路(3公里)可快速切换到中环达市区，通达性强，半小时车程尽享都市繁华。项目周边轨道交通7号线、11号线双轨环绕，出行便捷。		', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5eb1fdb000d', '4028800c5d86fa7b015d86fb264b0000', '御珑湾', '钦南区', '钦州市河东新区蓬莱大道北段', 1334000, 330000, '别墅', '板楼', 119.78, 30.65, 18000, '恒大集团', '2017-08-01', 1912, '东湖高新技术开发区康魅路1号', '35678964', 31.72, 2.5, '钦州市物业服务有限公司', 2.85, 2000, '		22路公交车 离外环丰翔路出口1.5公里\r\n地铁：步行到7号线15号启华路站10分钟，17号丰翔路站5分钟。离虹桥枢纽18公里，人民广场23公里。				\r\n					', '	周边商业：河东工业园、五星级酒店\r\n周边图\r\n周边图\r\n\r\n　　周边公园：中央体育公园\r\n　　周边医院：钦州市中医院\r\n　　周边学校：钦州市二中			\r\n					', '20170815204257.jpg', '						\r\n			政务圈&中央生活圈”区位优势，项目钦州未来的“CLD中央居住区”，作为城市重点建设区域，区域规划配套齐备，规划科教文卫配套齐全，特别是号称“八大场馆”的配套更是将未来区域配套发挥到淋漓尽致。另市政广场以及紧邻本项目地块的市政公园（规划中）也为本项目的外景锦上添花。捷。		', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5f577f9000e', '4028800c5d86fa7b015d86fb264b0000', '中粮锦云 ', '宝安区', '前进路与湖滨路交叉口', 36942.65, 92810, '住宅', '塔楼', 107.9, 35.6, 20000, '恒大集团', '2017-02-07', 1238, '宝安区前进路与流塘路交汇处', '35689879', 36, 4.06, '中粮地产（集团）股份有限公司物业公司', 3, 1250, '			宝安区前进路与流塘路交汇处西南角交通状况：坐享前海中心海陆空铁四维交通网络体系。项目临近规划中的地铁10号(流塘站)，扼守前进路主轴之上，坐享107国道、西乡大道、广深高速等城市核心枢纽，小区西南侧配备公交总站，尽享半小时无忧通达全城			\r\n					', '						\r\n		周边商业\r\n购物：家乐福、沃尔玛银行：中国工商银行、中国农业银行\r\n周边公园\r\n宝安公园、流塘公园、铁仔山郊野公园、灵芝公园、新安公园等\r\n周边医院\r\n深圳宝安中医院、深圳宝安妇幼保健院、深圳市宝安人民医院、西乡人民医院\r\n周边学校\r\n幼儿园：流塘幼儿园、小区内配备建筑面积为3320平米幼儿园；小学：流塘小学、陆兴小学、天骄小学；中学：西乡中学、文汇中学			', '20170815205415.jpg', '						\r\n				中粮锦云以中大户型为主，产品面积段包括78-139㎡的三房四房，是低容积率的高档住宅区。合理的规划、创新的户型设计、稳重典雅的造型，规划包括3栋11座高层建筑组成，住宅30-31层，商务办公22层，以及幼儿园、文化中心、社区健康服务中心等等配套设施。	', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055de58f1e015de5f9406a000f', '4028800c5d86fa7b015d86fb264b0000', '中洲中央公园', '深圳市宝安区', '宝安区创业路与前进路交汇处西南角', 90836.2, 513910, '公寓', '板楼', 117.9, 34.8, 25000, '恒大集团', '2016-06-06', 2090, '宝安区创业路与前进路交汇处西南角', '556700988', 35, 4.47, '深圳市中洲物业管理有限公司', 3, 2150, '						\r\n	周边公共交通：610、382、602、616、651、K651、718、789、866等多条公交线路经过				', '						\r\n		周边商业：海雅百货商业广场、好百年、苏宁、国美电器\r\n周边公园：灵芝公园、新安公园、宝安公园等五大市政公园环绕\r\n周边医院：宝安中医院、宝安妇幼保健院、宝安区人民医院\r\n周边学校：宝安中学、文汇中学、新安中学、冠华育才学校、宝民小学			', '20170815205823.jpg', '						\r\n					中洲中央公园位于深圳市宝安区创业路与前进路交汇处。项目总体量近百万平米，其中一期占地面积9万㎡，建筑面积40.6万㎡，商业面积逾8万㎡，住宅面积约26万㎡，超高层公寓5万㎡，并配有3200㎡的幼儿园。总户数约2090户。中洲中央公园汇聚了高尚住宅、公寓、商业等物业形态，是目前深圳罕有的高端旗舰城市综合体项目。', '2017-08-15 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26374e015e266f73bb0004', '4028800c5d86fa7b015d86fb264b0000', '碧桂园联发·蓉江府', '江西省赣州市龙南县', '赣州市蓉江新区兴国路（武陵大桥桥头）', 9832, 9700, '公寓', '塔楼', 116.938477, 40.688969, 15000, '恒大集团', '2017-08-03', 824, '章江新区琴江路万象城地面停车场旁', '35689879', 35.6, 2.44, '碧桂园物业管理公司', 3, 0, '			项目雄踞赣州市章江新区与蓉江新区交汇处，毗邻城市大动脉兴国路，路网四通八达，保障业主工作生活出行畅通。			\r\n					', '						\r\n	西客站、万象城、大学城、奥体中心				', '20170828092311.jpg', '						\r\n		千亿房企碧桂园集团\r\n\r\n　　25年，匠心营造好家园\r\n\r\n　　碧桂园集团成立于1992年，是一家以房地产为主营业务的综合性企业集团。如今，碧桂园集团强势进驻赣州，以前瞻性的目光落子赣州，高度契合大赣州城市规划的发展战略，以匠心精神精心打造碧桂园联发·蓉江府，致敬追求美好生活的赣州人士。\r\n			', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26374e015e267a2d440005', '402880105da09eb8015da0a1d5680000', '天上人间', '江西省赣州市会昌县', '河北省张家口市赤城县龙门所镇071乡道', 86298, 278644, '住宅', '塔楼', 115.949707, 41.025499, 3334, '绿地集团', '2017-08-15', 1620, '赣州开发区华坚北路西侧/纬一路北侧', '35689879', 35, 2.5, '暂无', 3.3, 2157, '						\r\n		项目交通便利、出行顺畅。毗邻华坚北路，联通经开交通动脉迎宾大道，东延繁华老城区，西行可至黄金机场、高铁站。规划中地铁2号线即在家门口。32、35、121路公交环伺周边。			', '						\r\n		项目交通便利、出行顺畅。毗邻华坚北路，联通经开交通动脉迎宾大道，东延繁华老城区，西行可至黄金机场、高铁站。规划中地铁2号线即在家门口。32、35、121路公交环伺周边。			', '20170828093454.jpg', '		　规划中坚持以创造大尺度庭院空间为设计理念，让客户受到开阔的空间和舒适的环境，摒除常规小区的压抑感。庭院中设置中心水景、乐趣广场、泳池等汇聚场所主题活动空间，成为保利心生活、心向往的社区生活场所。并利用大尺度楼间距设置为社区活动增添活力的老人休闲广场、儿童娱乐场、滑板广场、园艺树林等主题活动区，丰富社区活动、娱乐活动。				\r\n					', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26374e015e26827f4a0006', '402880105da09eb8015da0a1d5680000', '城东观澜', '江西省赣州市会昌县', '南康东山新区消防大队正后方（赣南大道旁）', 29458, 121118, '公寓', '塔楼', 117.158203, 41.008921, 6000, '绿地集团', '2017-11-08', 740, '南康东山新区消防大队正后方（赣南大道旁）', '35689879', 40, 3, '暂无资料', 4.3, 0, '	135路公交可抵达项目地					\r\n					', '						\r\n		项目所在区域属于南康未来十年重点发展区域，拥有南康第一人民医院、公交总站、汽车总站、南康中学新校址（国家级重点中学）、南康第六中学、逸夫小学、中心公园、南康金融中心、赣州中部物流园等一大批高端城市配套，是南康区内未来最适宜居住的区域			', '20170828094400.jpg', '						\r\n				项目位于东山新区核心地段，毗邻东山新区生态公园绝佳生态湖景观资源，由江西新星房地产开发有限公司投资建设。城东观澜项目总建筑面积约12万平米，容积率3.0，建筑密度20%、绿化率40%，由7栋32层的百米高楼组成，共计户数740套。项目采用法式Art-Deco风格的外立面，实行全封闭人车分流管理，车位比达到1:1.3。城东观澜将建设成为东山新区目前首屈一指的规划最超前、品质最好、园林投资最大的高端住宅项目。	', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e268fd84c0000', '402880105da09eb8015da0a1d5680000', '丽景江山', '江西省赣州市会昌县', '赣州市赞贤路88号（赣州三中西行约800米）', 58747, 235921.58, '经济适用房', '塔楼', 88.945313, 38.479395, 7800, '绿地集团', '2017-07-04', 1520, '赣州市赞贤路88号(赣州三中西行约800米)', '35689879', 40, 3, '暂无资料', 2.5, 0, '		南门口乘坐112、117路公交车过东江源大道可直达项目现场				\r\n					', '						\r\n	赣三中、赣州南站、建材市场、水果市场、中央生态公园				', '20170828095834.jpg', '		丽景江山项目总建筑面积约23万平方米，规划建筑形态由14幢Art-Deco古典艺术装饰性风格百米高层建筑错落布局而成；同时按先进的规划理念配置社区商业中心、多种生活配套，通过超大规模地下车库设计有效实现人车分流；借鉴意大利园林轴线对称经典景观的布局，融合台地、花镜、景观泳池、儿童游戏区等多种园林要素；再以约21%低密度生活样板最大程度保证了高层的室内光照，南北阳台远观江景、生态公园，从而造就赣州市罕有的低密度生态宜居高端社区。				\r\n					', '2017-08-28 00:00:00', 'N');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26941ba50001', '402880105da09eb8015da0a1d5680000', '云星·公园大观', '江西省赣州市会昌县', '章江新区章江路中央生态公园正面', 57546.8, 239949, '经济适用房', '塔楼', 116.287537, 40.965382, 13000, '绿地集团', '2017-08-08', 809, '章江新区章江路中央生态公园正面', '35689879', 30, 3.5, '暂无资料', 4.6, 0, '						\r\n	北侧为锦江路，西邻赣康路，南靠章江路，东侧为高兴路				', '						\r\n		赣州市政府、章贡区政府、赣州市工商局、赣州市体育局、赣州市卫生局、区检察院；行政服务中心、青少年活动中心、体育中心、游泳馆、图书馆、科技馆、博物馆、自然博物馆、城市规划馆；赣州中学、章贡中学、水南中学、黄金小学、项目规划五星级幼儿园；万象城、水游城、九方购物中心、天虹购物中心、万盛MALL、项目自带近2万㎡商业区；浦发银行、中国人民银行、商业银行；中央生态公园、章江国家湿地公园、市政公园、樱花公园			', '20170828100314.jpg', '						\r\n	云星集团22年11城，如今，云星集团在这座拥有千年文化积淀的赣州理想的纬度上，邀请团队精工考究，打造赣州湖景美宅之作。\r\n　　1、建筑布局行列式一字排开，户户南向瞰湖;\r\n\r\n　　2、先进的人车分流设计，1：1.2车户比;\r\n\r\n　　3、高档建材，精良施工，采用断桥铝合金、LOW-E玻璃等先进材料;\r\n\r\n　　4、现代风格景观园林，一步一景，步步皆景;配以室外叠泉泳池，外湖内景一览无余。				', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e2698dbe50002', '4028800c5d86fa7b015d86fb264b0000', '汇金壹号·孔雀湾', '钦南区', '赣南大道与贡江大道交汇处（桃源公园旁、梅林湿地公园斜对面', 31726.7, 188698.89, '写字楼', '塔楼', 116.264191, 40.90521, 7000, '龙湖地产', '2017-11-14', 698, '赣县公园道1号二期123号店铺（客家大桥旁）', '35689879', 40, 3.8, '花样年国际物业', 1.6, 0, '						\r\n		项目交通四通八达，出行进退自如，盘踞赣南大道与贡江大道交汇处，可迅速通达全城； 赣南大道是赣州大都市发展主要干道之一，沿赣南大道贯穿赣州老城区、章江新区、蓉江新区、直达南康区； 贡江大道贯穿赣新大道和城南大道两条赣县城区主干道，通往赣县主城区交通便捷； 厦蓉高速、赣州绕城高速环伺；从贡江大道延伸至客家大桥，连接323国道和赣州绕城高速； 项目距离厦蓉高速收费站咫尺可及，可迅速直达机场			', '	教育资源： 城关第六小学、赣县中学北校区、赣县第二中学、赣南汽车职业技术学校、江西省赣县职业技术学校等； 公园休闲： 500亩梅林湿地公园、桃源公园、河滨水空间、小区健身休闲场所等； 生活配套： 强强便民超市、百户超市等； 商业风情：项目打造的特色商业街，天桥连廊尽显精彩，同时规划有大型购物中心、情景餐饮、休闲娱乐等丰富业主生活，以及对面云星、嘉福、华润地块的配套商业；					\r\n					', '20170828100825.jpg', '						\r\n		约18.8万方公园综合体\r\n\r\n　　桃源公园\r\n\r\n　　桃源公园与项目仅一路之隔，出门即可享受公园的醇美景致，园内休闲设施完善，既是小孩玩耍的天地，也是老人休闲的胜地;\r\n\r\n　　梅林湿地公园\r\n\r\n　　梅林湿地公园位于赣县城北新区，总占地约500亩，其中绿地面积85亩，水域面积67亩，总投资6600万元。赣州晚报记者了解到，该公园为科技部科技惠民项目，遵循“自由行走的天然氧吧，科普教育的第二课堂”设计理念，以不破坏原有河流、植被、山体为原则，因地制宜种植了具有净化空气、土壤修复功能的菖蒲、垂柳等25种花木，植物种类达160种，从南向北依次呈现出塘湾水韵、桃源踏青、七彩童趣等11个生态湿地景观区。			', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26a4d2e90003', '402880105dc5a8e1015dc5abedc80000', '恒明珠·龙域', '钦南区', '赣县双龙大道60号', 2120, 15000, '经济适用房', '塔楼', 116.313629, 40.973677, 5600, '龙湖地产', '2017-08-08', 132, '赣县双龙大道与城南大道交汇处（中国银行旁）', '556700988', 48, 4, '暂无资料', 3.8, 0, '						\r\n	赣县县城环城公交				', '						\r\n			城关三小、城关小学、赣县中学、梅林菜场、人民医院、妇保院、中国银行、建设银行，南临贡江与杨仙岭隔江相望，江边有远近闻名的十里樱花公园及百年古榕树；东临市政中心、图书馆、文体中心，青少年宫等；北接城关三小，离菜场、医院、银行等仅需十分钟左右路程		', '20170828102129.jpg', '						\r\n			恒明珠·龙域项目由两栋11层小高层组成，住宅总户数84户，商铺23间、写字楼25间，项目东临客家文化城，南临贡江与杨仙岭隔江相望，江边有远近闻名的十里樱花公园及百年古榕树;东临市政中心、图书馆、文体中心，青少年宫等;北接城关三小，离菜场、医院、银行等仅需十分钟左右路程		', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26acc5fb0004', '402880105dc5a8e1015dc5abedc80000', '中洋·公园首府', '宝安区', '兴国路与赣康路交界处', 40000, 220000, '住宅', '塔楼', 116.16394, 40.945676, 6500, '龙湖地产', '2017-08-14', 1269, '章贡区区政府西侧', '556700988', 50, 3.4, '暂无资料', 1.5, 0, '		公交28路、135路、137路、139路', '						\r\n赣州中学、、赣三中、滨江二小、生态公园、万象城、自然博物					', '20170828103010.jpg', '						\r\n	中洋·公园首府由江西中洋实业控股有限公司开发的继多个项目之后的又一力作。项目位于赣州市章江新区核心居住区，紧邻城市中央公园、赣州中学、赣州自然博物馆等，地理位置优越。作为赣州罕有的人居大盘，小区以中心近25000平米的欧式园林及建筑之间超宽的楼间距独树一帜。小区由12栋Art Deco建筑合围而成，户型以100-140平米的三、四房为主，户型精致、功能齐全，超高得房率，是您理想生活空间的绝对选择!				', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26af58fc0005', '4028800c5d86fa7b015d86fb264b0000', '玺宝·城上城', '宝安区', '南康南水新区南山大道第四小学旁', 380000, 87355, '公寓', '塔楼', 116.185913, 40.97264, 7590, '龙湖地产', '2017-08-02', 348, '临时展示中心:南康大酒店、南康国光超市', '556700988', 60, 3.9, '暂无资料', 3.8, 0, '						\r\n交通网便利，四通八达。畅享城市“四横三纵”主干道交通动脉；前有南山大道，西有天马山大道、规划路，东依幸福路、和谐大道，北靠倚峰大道。城市主干道、国道、高速公路多线连接，交通更加便利					', '						\r\n	教育配套：立德幼儿园、吉的堡幼儿园、南康四小、南康一小、南康中学、南康五中、南康八中等名校环绕，全程优教，起点高昂；休闲配套：南山森林公园、体育公园、百家姓和谐城、文化艺术中心等；医疗配套：妇幼保健医院；生活配套：南水净菜市场（农贸市场）、坚强量贩购物广场、商业中心、大地影城、帕沃健身等				', '20170828103010.jpg', '						\r\n	【玺宝城上城】是由台湾知名开发企业-玺宝置业开发。汇集台湾和内地高端人居标准，精心规划设计全优生活系统，创造出独具人文底蕴的舒适居住新标准。用建筑的名义，献礼一座城的安居梦想。				', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26cc55610006', '402880105dc5a8e1015dc5abedc80000', '时代新城', '惠州', '赣州市绕城高速龙岭出入口', 247922, 500000, '住宅', '塔楼', 116.179047, 40.96953, 4300, '龙湖地产', '2017-08-18', 4743, '赣州绕城高速龙岭出入口（赣南大道龙岭段）', '15770745452', 45, 3.7, '暂无资料', 1.1, 3000, '						\r\n		赣南大道、105国道、赣粤高速、绕城高速		', '						\r\n					周边配套龙岭中心幼儿园、龙岭中心小学、南康四中、赣州儿童医院、南康市第一人民医院	', '20170828110439.jpg', '			赣州市政府将赣州都市区构筑“一带、三轴、六区”的城市空间发展总体结构，切实提升城市的集聚效能和综合服务水平。蓉江新城现代服务业聚集区定位为赣州市的金融中心、科教与创新服务中心、市级公共服务中心。主要建设农产品、金融、教育、科技、商贸物流等各项配套，项目位于蓉江新城的中心位置。			\r\n					', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26896c015e26d83a940007', '4028800c5d86fa7b015d86fb264b0000', '雍晟·上城湾畔', '惠州', '赣县城南杨仙大道梅林大桥旁', 37668.5, 115266.75, '别墅', '塔楼', 116.209259, 40.986118, 12000, '华润置地', '2017-08-22', 702, '赣县城南杨仙大道梅林大桥畔上城湾畔项目地', '15770745452', 56, 5, '暂无资料', 5.9, 754, '						\r\n	105、323国道，杨仙大道东段，101、105公交车', '		周边配套规划学校，4星级酒店，赣县影剧院，赣县体育馆，图书馆，樱花公园，客家文化城\r\n							\r\n					', '20170828111738.jpg', '						\r\n		上城湾畔是江西雍晟地产在赣州的成功开发的第二个项目，项目位于赣县贡江边杨仙大道西侧S2地块。 项目用地37668.5平米，建筑面积115266.75平米，容积率2.4，由6栋29-31层高层、40栋多层住宅及部分临街商铺组成，共计708户人家，754个车位。而其中的多层住宅将打造成双拼小别墅。			', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e26f7c4015e276b5dc00002', '4028802e5d87e33d015d87e4ffde0000', '方圆·文昌苑', '惠州', '赣县城南杨仙大道西段，樱花公园旁', 750000, 130000, '住宅', '塔楼', 116.260071, 40.958123, 7600, '华润置地', '2017-08-15', 670, '赣县城南杨仙大道西段（文昌阁斜对面）', '15770745452', 2.4, 4, '暂无资料', 0.6, 0, '						\r\n		“文昌苑”位居赣县城南中心，远望延绵青山、近观贡江水、十里樱花；客家大桥开通后直通红旗大道，5分钟可入赣州城中心。			', '						\r\n	200米无忧生活圈：小孩上学（城关四小、规划四中）；年轻人逛街（梅林古镇商业街、银河商业广场）；老人休闲看病（县人民医院、樱花公园、体育中心、图书馆）；商务接待（金融大厦、新饭店、银河酒店）				', '20170828135821.jpg', '13万方赣县城南人文大宅，位踞赣县新城市核心区杨仙大道西段，十分钟大赣州都市圈，便捷中，让您感受宁静背后的咫尺繁华。随即200米繁华中心顶级生活圈，即刻满足您日常生活的细微需求。\r\n　　在贡江河畔，杨仙岭对岸，尽享城南“生态绿肺”阴翳，玉带缠腰的风水宝地，景色怡人的天地山水，为我私家典藏。\r\n　　望城静清 水环涌，拂去 都市喧嚣;方圆·文昌苑，集多层、高层、小高层于一体，是赣县城南新区不可多得的诗意栖居地\r\n　　建筑与景观和谐统一，移步换景层层递进，令人感叹。景观Y型轴、中心假日广场、现代主题院落，风景里, 亦诗，亦画，亦人居!\r\n　　空间设计，恣意延伸，94—136㎡完美户型，彰显现代居住人文内涵，妆点您的雅致生活风范。\r\n交通阡陌纵横，别具一格的商业街，巧然屹立，即便繁华也被惬意萦绕。人车分流，人性规划;24小时星级物业服务，礼遇生活，尊崇享受。\r\n　方圆·文昌苑，一片梦想中的世外桃源，一席现实中的都市净土，一座繁华中的人文宅邸，历经千年承传的人文地脉，在智山乐水中复兴归来。文昌苑，静山·近水·境生活		', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e280ee6015e28d65d8b0006', '402880105da09eb8015da0a1d5680000', '樱花公馆', '江西省赣州市赣县', '赣县城南大道与银河大道交汇处', 8108, 140000, '住宅', '塔楼', 120.9375, 82.676285, 15001, '绿地集团', '2017-08-02', 843, '赣县城南大道与银河大道交汇处往南150米樱花公馆售楼部', '35689879', 36.8, 4.3, '暂无资料', 0.6, 900, '						\r\n	项目在赣县城南大道与银河大道交汇处，赣县城南核心地段，交通四通八达，距赣州市区仅10分钟车程			', '						\r\n	东面与赣县县政府新行政大楼一路之隔，南面是赣县贡江十里樱花带、名人公园、贡江北岸，西面毗邻梅林古镇，北面为赣县最繁华商业街—梅林大街；距城关三小、四小仅几分钟路程，文体中心、图书馆近在咫尺，周边银行、医院、超市等配套齐全					', '20170828203450.jpg', '	樱花公馆地处黄金地段，金而不贵，即买即升值。小区布局合理，采用客家建筑设计，造型丰富、古朴雅致、风格内敛，讲究韵律之美，尽享清幽静雅、恬淡舒适的居住环境。\r\n　　樱花公馆，“以山为屏、以水为镜、城在林中、山水共融”，户户座北朝南，景随季变、步换景移，多主题休闲设施让樱花公馆成为休闲养生福地 ，传世珍藏好宅。 					\r\n					', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e2bea3a015e2bef510e0000', '4028800c5d86fa7b015d86fb264b0000', '五龙·桂园', '江西省赣州市章贡区', '赣州市沙河大道18号 ', 150000, 1700000, '别墅', '板楼', 116.221619, 40.958123, 5800, '恒大集团', '2017-07-21', 340, '赣州市沙河大道18号五龙客家风情园主大门', '4008988', 30.87, 1.24, '暂无资料', 0.9, 539, '			项目在城南核心地段，交通四通八达，距赣州市区仅10分钟车程				\r\n					', '						\r\n		五龙幼儿园(京九路)\r\n772米赣州市厚德路小学京九路校区\r\n928米章贡中学京九路校区			', '20170829110057.jpg', '五龙桂园项目位于沙河大道，占地170亩，总建筑面积15万多平米，容积率为1.24，是一个集别墅、多层、小高层、高层多种产品一体的旅游地产项目。						\r\n					', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e2bea3a015e2bfb76510001', '4028800c5d86fa7b015d86fb264b0000', '银河名都', '江西省赣州市章贡区', '赣县城南新区银河大道南段窑村', 2124, 15266.17, '住宅', '塔楼', 116.089783, 40.876141, 33000, '恒大集团', '2017-08-14', 198, '赣县银河大道与城南大道红绿灯交汇处', '4499988', 33, 6.296, '暂无资料', 1.3, 300, '	项目在赣县城南新区银河大道南段，赣县城南核心地段，交通四通八达，距赣州市区仅10分钟车程。', '						\r\n	周边配套项目南面是赣县贡江十里樱花公园、名人公园、贡江北岸、西面毗邻梅林古镇、北面为赣县最繁华商业街—梅林大街、距城关幼儿园、三小、四小、四中仅5分钟路程、文体中心、图书馆近在咫尺、周边银行、医院、超市等配套齐全。					\r\n									', '20170829111413.jpg', '						\r\n	1、赣县绝版4.9米超高层高，50平米买一层抵两层，独具赣县领头产品，稀缺资源，市场占有率高;\r\n　　2、烫金地段，位于城南新区最核心地段，得天独厚的地利基石，价值巨大无限;\r\n　　3、360℃全景配套;行政、金融、商务、休闲、旅游、文化、教育等样样俱全;\r\n　　4、名居赣县城南核心商圈，首席商务核心区，商业价值巨大;\r\n　　5、绝版铺王，雄踞赣县商业发展金轴;\r\n　　6、“低总价、低投入、低门槛”不限购、不限贷投资置业的绝佳首选之地。\r\n				', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e2bea3a015e2c057b040002', '4028800c5d86fa7b015d86fb264b0000', '创嘉·90號', '江西省赣州市南康区', '赣州南康市南水大道与文峰路交汇处', 32192.5, 46720.72, '花园洋房', '塔楼', 115.949707, 40.979898, 12003, '恒大集团', '2017-08-08', 90, '赣州南康市南水大道与文峰路交汇处', '6553333', 50, 0.65, '暂无资料', 1.7, 200, '						\r\n	项目紧邻南水大道与文峰路，城市交通便捷；沿文峰路往北即可上赣南大道，往南通往信丰、龙回高速路口，区域交通优越。				', '	周边配套5分钟涵盖文化艺术中心、体育活动中心、青少年活动中心、坚强量贩购物广场、南康大酒店、大地影城等城市高端休闲购物配套；享受中心幼儿园、南康一小、南康中学、南康五中、南康八中等名校资源。					\r\n					', '20170829112510.jpg', '						\r\n	　创嘉•90號由赣州市南康区创嘉置业投资有限公司倾力打造，是南康区唯一在售的纯别墅区项目。项目力求以空间形态解析更高层次的生活方式，从而创造出更舒适、更具品位的生活标准。在历经深圳、上海、北京、厦门等多个高端别墅项目考察、研究后，创嘉•90號创造了别墅的新尺度。其拥有极致的产品打造、最舒适的尺度空间。项目由32栋类独栋、26栋双拼、28栋联排、4栋墅王组成，仅此90大户。创嘉90號城央纯别墅具备更稀缺的珍藏价值、更高端的人脉圈层，更舒适的生活空间，独创7重尺度空间，是改善首选。\r\n				', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880055e2bea3a015e2c0c52410003', '4028800c5d86fa7b015d86fb264b0000', '佳兴云府', '江西省宜春市靖安县', '南康区南水大道与文澜路交汇处', 53428, 138912, '经济适用房', '塔楼', 116.209259, 40.965382, 8500, '恒大集团', '2017-08-15', 1000, '南康区南水大道与文澜路交汇处', '5833333', 35, 2.6, '前期物业：中航物业', 0.9, 1240, '交通状况项目位于南康南水新区，南临南水大道，北临地税路，东临院前路，西临文澜路。', '周边配套	南康区幼儿园、吉的堡幼儿园、南康三小、南康四小、南康五中、南康八中、赣州银行、交通银行、万客隆超市\r\n				\r\n											\r\n					', '20170829113238.jpg', '						\r\n	楼盘点评项目总建筑面积约13万平米，位于南水新区，南水大道与文澜路交汇处!出则繁华，入则静谧，佳兴云府项目配套完善!\r\n\r\n			', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880105da5a937015da5aa81910000', '4028800c5d86fa7b015d86fb264b0000', '新力合园', '章贡区', '红谷滩区九龙湖上饶大街与阁皂大道交汇处', 90419.71, 242800.75, '公寓', '板楼', 114.75, 25.66, 8800, '恒大集团', '2017-05-10', 13, '章江新区中央生态公园对面', '614952', 2.4, 2, '华润置地（赣州）有限公司', 1.5, 868, '																								乘坐28路、135路公交车到章贡区政府站下车，对面100米即到。					\r\n					\r\n					\r\n					\r\n					\r\n					', '																								市政配套：近省级行政中心，享市政配套便捷\r\n文旅配套：国体中心、新青少年宫、九龙湖市民中心、万达旅游城\r\n教育配套：社区幼儿园、南师附小、龙岗学校、南昌工程学校、站前中学、水厂小学、九龙湖学校\r\n交通配套：临近西客站、长途汽车站；高铁1/2路；地铁2/4号线在此近距离接驳；朝阳大桥、生米大桥无缝对接老城\r\n医疗配套：临近省人民医院、省二附院、省妇保、省儿童医院						\r\n					\r\n					\r\n					\r\n					\r\n					', '20170803091641.jpg', '																								新力合园项目位于九龙湖上饶大街与阁皂大道交汇处，为新力地产7年换代的园系作品。新力合园是新力在九龙湖的第6个项目。项目总建面约24万方，共1476户。整个小区是市区少有的低密度花园洋房为主的社区。项目整体容积率约2.0，绿地率为35%。 新力合园位于九龙湖核心区，临近省级行政中心、国体中心、西客站等城市鼎盛配套；周边大学城、中小学校环伺，规划社区幼儿园；地铁2/4号线在项目附近接驳，极速穿越全城。新力合园，总建筑面积24万㎡，由13栋洋房、8栋高层组成。建筑面积约134—137㎡洋房产品，全通透四房设计，建筑面积约90—118㎡高层产品纯板式三房设计。						\r\n					\r\n					\r\n					\r\n					\r\n					', '2017-08-03 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880105da73e41015da74835fb0001', '4028800c5d86fa7b015d86fb264b0000', '汇仁阳光花园', '章贡区', ' 南昌县汇仁大道1号（昌南客运站旁）', 300000, 801144, '住宅', '塔楼', 109.75, 23.66, 9500, '恒大集团', '2016-10-22', 16, '南昌市汇仁大道1号（项目现场）', '6844365', 0.5, 2.7, '江西恒美物业', 1.5, 652, '																																										昌南客运站：15路、16路、20路、25路、203路、224路、230路、235路、239路、515路、519路、525路、526路、601路					\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					', '教育：莲塘八小、莲塘三小、莲塘二中 、莲塘一中\r\n银行、商业：农业银行、工商银行、餐饮、商场；\r\n其他：桂花村大酒店、东风雪铁龙4S店、县中医院、莲西菜市场、洪客隆莲塘店、邮局等 ；			\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					', '20170803164833.jpg', '																																										汇仁阳光花园由汇仁集团房地产开发有限公司开发，项目位于迎宾大道，项目占地面积约445.08亩，容积率2.7，总建筑面积801144平方米，项目规划为高层						\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					\r\n					', '2017-08-03 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('4028802e5e27a27b015e27b395420001', '402880105da09eb8015da0a1d5680000', '博兴花园', '河北省张家口市赤城县茨营子乡069乡道', '河北省张家口市赤城县茨营子乡069乡道', 41, 21, '经济适用房', '板楼', 116.213379, 40.980935, 13441312, '绿地集团', '2017-01-01', 3413, '江西赣州', '123123', 123, 123, '治安天下', 123, 1234, '						\r\n	距武广高铁站15分钟车程，3分钟到河西，周边16条公交线路，纵横城市，四通八达。				', '						\r\n					', '20170803091641.jpg', '江景房，园景房，双景豪宅，南北通透，室内宽敞明亮', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('4028802e5e27b96b015e27eaaef70002', '4028800c5d86fa7b015d86fb264b0000', '中创国际城', '北京市北京市市辖区密云区', '河北省张家口市赤城县茨营子乡', 123, 123, '经济适用房', '塔楼', 116.167374, 40.950344, 123, '恒大集团', '2017-01-01', 123, '123', '1231231', 123123, 123, '123', 116, 1123, '项目为赣州市章江新区黄金走廊新赣南大道金脊轴的最中心位置，东面紧邻蓉江路，南面紧邻长岗路，西面紧邻新赣州大道，北面紧邻长征大道，立于章江新区主干道交汇处，交通四通八达。乘坐k2商会大厦下车即可到达。', '						\r\n					中小学：豪德小学，赣州中学\r\n综合商场：华润万家，水游城综合体\r\n医院：水南卫生院\r\n银行：人民银行、赣州银行总部、浦发银行\r\n邮局：申通、圆通、韵达、汇通、\r\n其他：中国移动、中国联通', '20170829112510.jpg', '						\r\n				赣州中创国际城位于赣州章江新区三条主要道路长征大道、赣江源大道及新赣南大道的交汇处，城市地标性雕塑“十龙聚龟”正南侧。项目占地面积34826.6平米，总建筑面积232102.23平米，由4栋标高150-165米超高层建筑及6栋围合式商业组成，以6E级写字楼、商居皆宜studio百变格局空间、慢生活格调商业街区三种业态，创造性地将商务办公、商务消费、商务公园、商务酒店、商务居住融合一体，于城市地标之上，再造赣州核心商务区罕见的超高地标群。	', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('4028802e5e2b6799015e2be7c3f30001', '4028800c5d86fa7b015d86fb264b0000', '海亮天城', '天津市天津市市辖区和平区', '河北省张家口市赤城县茨营子乡069乡道', 123, 123, '经济适用房', '板楼', 116.206512, 40.978861, 123, '恒大集团', '2017-01-01', 123, '123', '1231231', 123, 120, '123', 123, 123, '						\r\n		123			东侧为赣康路，西侧为文武坝路，北侧为九曲河路，南侧为红都大道， 10分钟抵达火车站，20分钟直达黄金机场。', '						\r\n				幼儿园：爱心幼儿园\r\n中小学：赣州中学、赣州外国语学校、滨江二小、章贡中学\r\n综合商场：华润万象城\r\n医院：市人民医院\r\n银行：人民银行、浦发银行、招商银行、建设银行\r\n其他：中央生态公园、滨江公园、自然博物馆、钨都广场 \r\n小区内部配套：中央下沉式广场、中央星空泳池、精品街区商业、皇家对称式园林、新亚洲商务会所、奢阔精英幼儿园	', '20170828103010.jpg', '						\r\n					海亮天城，位于章江新区中心，南侧靠近赣江，北侧咫尺赣州中心城区，统驭滨江公园和中央公园，紧邻滨江二小和赣州八中，交通便利。项目总建筑面积约46.6万㎡，规划有叠墅、小高层、高层等多种业态，开创赣州的低密度人生。', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_buildings` VALUES ('402880b65e278518015e27a454a30000', '4028802e5e22a982015e22c48a230000', '景秀香江', '江西省赣州市兴国县', '江西省赣州市兴国县潋江镇将军大道547号', 8878, 5765, '住宅', '塔楼', 115.339966, 26.33773, 4500, '保利地产', '2017-08-28', 1, '江西省赣州市兴国县潋江镇将军大道547号', '15770745452', 50, 90, '腾光物业公司', 1000, 30, '天心区书院路和二环线交汇处，东起书院南路，西靠湘江大道，南依600亩浩瀚绿色森林“天然氧吧”南郊公园和湘江三桥猴子石大桥，“湘江”与“南郊公园”双景观资源的不可多得的城市高端社区。\r\n距武广高铁站15分钟车程，3分钟到河西，周边16条公交线路，纵横城市，四通八达。	', '小区人车人流，指纹开锁，楼下就是步步高超市以及商业街，对面还有新一佳超市，银行、医院、酒店、茶楼、会所，应有尽有，生活特别的方便。', '20170828094400.jpg', '朝向： 3房朝南，视野超开阔,远眺湘江，俯瞰公园\r\n房源优势\r\n双公园，双地铁，双中心\r\n环境好，人车分流，高端物管，居住人群高涵养\r\n江景房，园景房，双景豪宅，南北通透，室内宽敞明亮		', '2017-08-28 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_buildings_img
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings_img`;
CREATE TABLE `t_buildings_img`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img_des` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_buildings_img
-- ----------------------------
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e276d35320003', '2017082814002200u=2140662763,1269823827&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e276d36060004', '2017082814002211u=3158303684,3499240265&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e276d36670005', '2017082814002222u=7301824,4005293225&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27701e670006', '20170828140332006_201705231126470713.jpg', '暂无', '402880055de58f1e015de5ba6fa00003', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27701eea0007', '2017082814033211267609-9oiu-0o.jpg', '暂无', '402880055de58f1e015de5ba6fa00003', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27701f260008', '20170828140333226_201705231127072729.jpg', '暂无', '402880055de58f1e015de5ba6fa00003', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277964280009', '2017082814134000u=211879787,909627730&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5beb16b0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277964fa000a', '2017082814134011u=981115340,697105024&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5beb16b0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27796569000b', '2017082814134022235103-13031G0023958.jpg', '暂无', '402880055de58f1e015de5beb16b0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277aa33c000c', '2017082814150200u=275356691,268722766&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5c64caa0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277aa43b000d', '2017082814150211timg (3).jpg', '暂无', '402880055de58f1e015de5c64caa0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277aa4d4000e', '2017082814150222u=3158303684,3499240265&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5c64caa0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277aa52c000f', '2017082814150233u=211879787,909627730&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5c64caa0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277b90e60010', '2017082814160300timg (4).jpg', '暂无', '402880055de58f1e015de5ccc95b0007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277b91770011', '2017082814160311u=811065385,2710900224&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5ccc95b0007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277b91f80012', '2017082814160322u=981115340,697105024&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5ccc95b0007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277b926f0013', '2017082814160333235103-13031G0023958.jpg', '暂无', '402880055de58f1e015de5ccc95b0007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277c69410014', '2017082814165800timg (7).jpg', '暂无', '402880055de58f1e015de5d094fe0008', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277c69e10015', '2017082814165811u=1498313019,4217925242&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d094fe0008', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277c6a390016', '2017082814165822u=1624895370,3159831826&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d094fe0008', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277c6c4e0017', '2017082814165833267609-9oiu-0o.jpg', '暂无', '402880055de58f1e015de5d094fe0008', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277e80470018', '20170828141915006_201705231126470713.jpg', '暂无', '402880055de58f1e015de5d4dc050009', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277e80ca0019', '2017082814191511u=2950921049,8412413&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d4dc050009', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277e8108001a', '2017082814191522u=770177291,3594662661&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d4dc050009', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e277e8145001b', '20170828141915331260179083577.jpg', '暂无', '402880055de58f1e015de5d4dc050009', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2780fafa001c', '2017082814215700下载 (1).jpg', '暂无', '402880055de58f1e015de5d8fc49000a', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2780fb5c001d', '2017082814215711u=1747613683,751203539&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d8fc49000a', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2780fba8001e', '2017082814215822u=981115340,697105024&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5d8fc49000a', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2780fbf9001f', '201708281421583301200000194428134373680942783_s.jpg', '暂无', '402880055de58f1e015de5d8fc49000a', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27834ba10020', '2017082814242900timg (2).jpg', '暂无', '402880055de58f1e015de5dddf74000b', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27834be70021', '2017082814242911u=2207541751,3126557733&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5dddf74000b', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27834c290022', '2017082814242922u=2551855340,515786965&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5dddf74000b', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27834c9d0023', '2017082814242933c83d70cf3bc79f3da08ab824baa1cd11728b29be.jpg', '暂无', '402880055de58f1e015de5dddf74000b', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27841b120024', '20170828142522006_201705231126470713.jpg', '暂无', '402880055de58f1e015de5e77e90000c', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27841b9b0025', '2017082814252211下载 (1).jpg', '暂无', '402880055de58f1e015de5e77e90000c', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27841bf60026', '2017082814252222u=4195671085,2235973635&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5e77e90000c', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27841c360027', '2017082814252233200910252116172374.jpg', '暂无', '402880055de58f1e015de5e77e90000c', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278aad260028', '2017082814323300timg (8).jpg', '暂无', '402880055de58f1e015de5eb1fdb000d', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278aade00029', '2017082814323311u=1818218501,1249973709&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5eb1fdb000d', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278aae5f002a', '2017082814323322u=811065385,2710900224&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5eb1fdb000d', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278aae9a002b', '2017082814323333u=1899171539,4113428222&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5eb1fdb000d', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278b7476002c', '2017082814332400u=1957636428,861227120&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5f577f9000e', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278c24fe002d', '2017082814340900下载 (1).jpg', '暂无', '402880055de58f1e015de5f577f9000e', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278c257a002e', '2017082814340911下载 (4).jpg', '暂无', '402880055de58f1e015de5f577f9000e', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278c25da002f', '2017082814340922u=7301824,4005293225&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5f577f9000e', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278de8f60030', '2017082814360500timg (3).jpg', '暂无', '402880055de58f1e015de5f9406a000f', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278de99d0031', '2017082814360511下载 (2).jpg', '暂无', '402880055de58f1e015de5f9406a000f', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278de9e80032', '2017082814360522u=623843634,3837949438&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5f9406a000f', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278dea350033', '2017082814360533200910252116172374.jpg', '暂无', '402880055de58f1e015de5f9406a000f', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278e695f0034', '20170828143638003_201704301859018545.JPG', '暂无', '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278e69dd0035', '20170828143638115_201703182101034887.jpg', '暂无', '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278e6a290036', '20170828143638226_201705231127308954.jpg', '暂无', '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278e6a5e0037', '20170828143638337_201703111212146904.jpg', '暂无', '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278e6ae60038', '20170828143638442_201704301928113401.JPG', '暂无', '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278f32000039', '20170828143729002_201708020928327998.jpg', '暂无', '402880055e26374e015e267a2d440005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278f3240003a', '20170828143729114_201708010956451336.jpg', '暂无', '402880055e26374e015e267a2d440005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278f3274003b', '20170828143729225_201705231510568680.jpg', '暂无', '402880055e26374e015e267a2d440005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278f32cd003c', '20170828143729337_201705231046536950.jpg', '暂无', '402880055e26374e015e267a2d440005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278fb9c9003d', '201708281438040020131120160845707005.jpg', '暂无', '402880055e26896c015e268fd84c0000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278fba51003e', '201708281438041120140410142536877210.jpg', '暂无', '402880055e26896c015e268fd84c0000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278fba9a003f', '201708281438042220151121162451626283.jpg', '暂无', '402880055e26896c015e268fd84c0000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278fbae20040', '201708281438043320160202152755273855.jpg', '暂无', '402880055e26896c015e268fd84c0000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e278fbb5a0041', '20170828143804442_201702201148454978.JPG', '暂无', '402880055e26896c015e268fd84c0000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e279044590042', '20170828143839006_201708150856032869.jpg', '暂无', '402880055e26896c015e2698dbe50002', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e279044c80043', '20170828143839117_201708150857553785.jpg', '暂无', '402880055e26896c015e2698dbe50002', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e279045420044', '20170828143839228_201708150900259145.jpg', '暂无', '402880055e26896c015e2698dbe50002', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e279045810045', '20170828143839335_201708150859587324.png', '暂无', '402880055e26896c015e2698dbe50002', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2790db530046', '20170828143918006_201612261001304146.jpg', '暂无', '402880055e26896c015e26af58fc0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2790dbd90047', '20170828143918117_201611111507152557.JPG', '暂无', '402880055e26896c015e26af58fc0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2790dc760048', '20170828143918228_201611121452209025.jpg', '暂无', '402880055e26896c015e26af58fc0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2790dd850049', '20170828143918335_201612251812157920.jpg', '暂无', '402880055e26896c015e26af58fc0005', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27920cf2004a', '20170828144036004_201706121445093375.JPG', '暂无', '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27920de1004b', '20170828144036116_201705091620066998.jpg', '暂无', '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27920e7e004c', '201708281440362220160929091442355099.jpg', '暂无', '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27920ebb004d', '201708281440373320161008090129467434.jpg', '暂无', '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27920ef4004e', '20170828144037443_201705271539038698.jpg', '暂无', '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2792b7ee004f', '2017082814412000下载.jpg', '暂无', '402880105da5a937015da5aa81910000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2792b8620050', '2017082814412011下载.jpg', '暂无', '402880105da5a937015da5aa81910000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2792b8dc0051', '2017082814412022u=623843634,3837949438&fm=26&gp=0.jpg', '暂无', '402880105da5a937015da5aa81910000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e2792b9210052', '20170828144120333456789pthjnm.jpg', '暂无', '402880105da5a937015da5aa81910000', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27936e330053', '2017082814420700timg (10).jpg', '暂无', '402880105da73e41015da74835fb0001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27936eb50054', '2017082814420711u=3904318964,3393423379&fm=26&gp=0.jpg', '暂无', '402880105da73e41015da74835fb0001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27936eed0055', '2017082814420722u=1716470664,1307905041&fm=26&gp=0.jpg', '暂无', '402880105da73e41015da74835fb0001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27936f360056', '20170828144207331260179083577.jpg', '暂无', '402880105da73e41015da74835fb0001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27efa47000a4', '201708281622500020160105112714612783.jpg', '暂无', '402880055e26374e015e26827f4a0006', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27efa5cc00a5', '201708281622501120160105112732452740.jpg', '暂无', '402880055e26374e015e26827f4a0006', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27efa60c00a6', '201708281622502220160105112839327509.jpg', '暂无', '402880055e26374e015e26827f4a0006', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27efa67900a7', '201708281622503320151014155456446340.jpg', '暂无', '402880055e26374e015e26827f4a0006', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27f0298200a8', '20170828162324004_201706231253494784.jpg', '暂无', '402880055e26896c015e26941ba50001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27f029fa00a9', '20170828162324116_201707061053332981.jpg', '暂无', '402880055e26896c015e26941ba50001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27f02a3a00aa', '201708281623242220150605090850108497.jpg', '暂无', '402880055e26896c015e26941ba50001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27f02a7600ab', '201708281623243320160115154604552125.jpg', '暂无', '402880055e26896c015e26941ba50001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e26f7c4015e27f02b0400ac', '20170828162324443_201704251622453444.JPG', '暂无', '402880055e26896c015e26941ba50001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e280ee6015e28c77c8b0000', '20170828201835003_201704251622453444.JPG', '暂无', '4028802e5e27a27b015e27b395420001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e280ee6015e28c7925f0001', '201708282018411120150605090850108497.jpg', '暂无', '4028802e5e27a27b015e27b395420001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e280ee6015e28c792c90002', '20170828201841226_201707061053332981.jpg', '暂无', '4028802e5e27a27b015e27b395420001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e280ee6015e28c793670003', '201708282018413320160115154604552125.jpg', '暂无', '4028802e5e27a27b015e27b395420001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e280ee6015e28c794230004', '20170828201841444_201706231253494784.jpg', '暂无', '4028802e5e27a27b015e27b395420001', '2017-08-28 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c0f91e80004', '201708291136110011110448f72f3f88a08014_200_150.jpg', '暂无', '402880055e2bea3a015e2bef510e0000', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c0f926f0005', '2017082911361111111104466f6b44f3031756_200_150.jpg', '暂无', '402880055e2bea3a015e2bef510e0000', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c0f92c90006', '20170829113611222917200599fd00113c0096_380_280.jpg', '暂无', '402880055e2bea3a015e2bef510e0000', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c0f93430007', '2017082911361133011522387de6069bae8825_200_150.jpg', '暂无', '402880055e2bea3a015e2bef510e0000', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c0f93920008', '201708291136114411110445c149b6b3356600_200_150.jpg', '暂无', '402880055e2bea3a015e2bef510e0000', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c1043310009', '201708291136560020140925155316957919.jpg', '暂无', '402880055e2bea3a015e2bfb76510001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c1043ca000a', '201708291136571120140927100243220818.jpg', '暂无', '402880055e2bea3a015e2bfb76510001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c10442d000b', '201708291136572220140927100306355016.jpg', '暂无', '402880055e2bea3a015e2bfb76510001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e2bea3a015e2c104468000c', '201708291136573320140925155257478091.jpg', '暂无', '402880055e2bea3a015e2bfb76510001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2342750003', '201709010952000020160712114121708776.jpg', '暂无', '402880055e2bea3a015e2c057b040002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2343040004', '201709010952001120160712114217214323.jpg', '暂无', '402880055e2bea3a015e2c057b040002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2343600005', '201709010952002220160712113620183863.jpg', '暂无', '402880055e2bea3a015e2c057b040002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b260af60006', '20170901095502008_201704101059378706.jpg', '暂无', '402880055e2bea3a015e2c0c52410003', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b260b860007', '2017090109550211small_3_201704101722254219.JPG', '暂无', '402880055e2bea3a015e2c0c52410003', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b260bef0008', '2017090109550222small_3_201704101722257611.JPG', '暂无', '402880055e2bea3a015e2c0c52410003', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b260c5d0009', '20170901095502335_201704101102246287.jpg', '暂无', '402880055e2bea3a015e2c0c52410003', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2835a5000a', '2017090109572400u=2531526846,2085587426&fm=26&gp=0.jpg', '暂无', '4028802e5e27b96b015e27eaaef70002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b283637000b', '2017090109572411下载 (3).jpg', '暂无', '4028802e5e27b96b015e27eaaef70002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2836a6000c', '2017090109572422u=3768284480,3115519873&fm=26&gp=0.jpg', '暂无', '4028802e5e27b96b015e27eaaef70002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b2836e8000d', '201709010957243320130930155004446048.jpg', '暂无', '4028802e5e27b96b015e27eaaef70002', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b28ed26000e', '2017090109581100u=211879787,909627730&fm=26&gp=0.jpg', '暂无', '4028802e5e2b6799015e2be7c3f30001', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b28edaf000f', '201709010958111120130625160613791874.jpg', '暂无', '4028802e5e2b6799015e2be7c3f30001', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b28ee020010', '2017090109581122下载 (1).jpg', '暂无', '4028802e5e2b6799015e2be7c3f30001', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b28ee970011', '2017090109581133u=116877216,647042114&fm=26&gp=0.jpg', '暂无', '4028802e5e2b6799015e2be7c3f30001', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b4e86b80012', '201709011039150020131015153728763639.jpg', '暂无', '402880055e280ee6015e28d65d8b0006', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b4e870b0013', '201709011039151120131015154215848769.jpg', '暂无', '402880055e280ee6015e28d65d8b0006', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b4e874e0014', '201709011039152220131015154254640688.jpg', '暂无', '402880055e280ee6015e28d65d8b0006', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880055e3b06ad015e3b4e87bb0015', '201709011039153320131015153316200933.jpg', '暂无', '402880055e280ee6015e28d65d8b0006', '2017-09-01 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e080590015e0805dc920000', '20170815192250.jpg', '暂无', '402880055de58f1e015de5a1c5e30000', '2017-08-22 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e080590015e08084ca50001', '20170815194104.jpg', '暂无', '402880055de58f1e015de5b2749a0002', '2017-08-22 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e0cc999015e0cd6137c0000', '20170815194946.jpg', '暂无', '402880055de58f1e015de5ba6fa00003', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e0cde53015e0cdeaeef0000', '20170815195426.jpg', '暂无', '402880055de58f1e015de5beb16b0004', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e0cde53015e0cdeafc80001', '20170815200244.jpg', '暂无', '402880055de58f1e015de5c64caa0005', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e0cde53015e0cdeb0580002', '20170815200949.jpg', '暂无', '402880055de58f1e015de5ccc95b0007', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e119e8c015e11a537f00000', '2017090109572400u=2531526846,2085587426&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5b2749a0002', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e119e8c015e11a539160001', '2017090109572400u=2531526846,2085587426&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5b2749a0002', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e119e8c015e11a539900002', '201709011039152220131015154254640688.jpg', '暂无', '402880055de58f1e015de5b2749a0002', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e122425015e1227b6950000', '201709010958111120130625160613791874.jpg', '暂无', '402880055de58f1e015de5d4dc050009', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e122425015e122b25c30001', '201709011039151120131015154215848769.jpg', '暂无', '402880055de58f1e015de5d094fe0008', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e122425015e122c2d650003', '2017082814242911u=2207541751,3126557733&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5dddf74000b', '2017-08-24 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880105e122425015e122c7a3d0004', '2017090109572400u=2531526846,2085587426&fm=26&gp=0.jpg', '暂无', '402880055de58f1e015de5e77e90000c', '2017-08-24 00:00:00');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `comment_time` datetime(0) NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('402880055dd00033015dd0011cc70000', '一叶轻船\r\n\r\n一双桨悠懒\r\n\r\n一绵江风微拂素罗衫\r\n\r\n渔火点点聚散\r\n\r\n欸乃声声浅淡', '402880105da5a937015da5aa81910000', '2017-08-11 00:00:00', '402880055dcbecc6015dcbef77ce0000', 'Y');
INSERT INTO `t_comment` VALUES ('402880055df2d122015df2d19d940000', '价格比较能接受', '402880055de58f1e015de5a1c5e30000', '2017-08-18 00:00:00', '402880055db03591015db03af7250001', 'Y');
INSERT INTO `t_comment` VALUES ('402880055df2d122015df2dc96900001', '还可以', '402880055de58f1e015de5a1c5e30000', '2017-08-18 00:00:00', '402880055db03591015db03af7250001', 'Y');
INSERT INTO `t_comment` VALUES ('402880055df2d122015df2opop900001', '这楼盘实在是太好了，高端大气上档次，低调奢华有内涵', '402880055de58f1e015de5ccc95b0007', '2017-08-30 10:06:04', '402880055db03591015db03af7250001', 'Y');
INSERT INTO `t_comment` VALUES ('402880055e3b06ad015e3b0a3f130001', '楼盘很好', '402880055de58f1e015de5a1c5e30000', '2017-09-01 00:00:00', '402880055e2bea3a015e2d0b8eb10018', 'Y');
INSERT INTO `t_comment` VALUES ('402880105e36773b015e3678beb90000', '价格高了些，赣州都这样的价钱了，房子还可以', '402880055de58f1e015de5ccc95b0007', '2017-08-31 00:00:00', '402880105de49f76015de4a0820c0000', 'Y');
INSERT INTO `t_comment` VALUES ('402880105e36773b015e3687accc0002', '这楼盘实在是太好了，高端大气上档次，低调奢华有内涵', '402880055de58f1e015de5c64caa0005', '2017-08-31 00:00:00', '402880105de49f76015de4a0820c0000', 'Y');
INSERT INTO `t_comment` VALUES ('402880105e3b614a015e3b6934490000', '这楼盘实在是太好了！', '402880055de58f1e015de5dddf74000b', '2017-09-01 00:00:00', '402880105de49f76015de4a0820c0000', 'Y');
INSERT INTO `t_comment` VALUES ('402880105e4ab320015e4ab90ea80003', '感觉不错', '402880055e2bea3a015e2bfb76510001', '2017-09-04 00:00:00', '402880105de49f76015de4a0820c0000', 'Y');
INSERT INTO `t_comment` VALUES ('4028ab1c5e4f8aed015e4fe2b6440010', '这楼盘实在是太好了', '402880055de58f1e015de5d8fc49000a', '2017-09-05 00:00:00', '4028802e5e2d1bbb015e2d1d95470000', 'Y');

-- ----------------------------
-- Table structure for t_coslers
-- ----------------------------
DROP TABLE IF EXISTS `t_coslers`;
CREATE TABLE `t_coslers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_PY` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cBegin` smallint(5) UNSIGNED NOT NULL,
  `cEnd` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_coslers
-- ----------------------------
INSERT INTO `t_coslers` VALUES (1, 'A', 45217, 45252);
INSERT INTO `t_coslers` VALUES (2, 'B', 45253, 45760);
INSERT INTO `t_coslers` VALUES (3, 'C', 45761, 46317);
INSERT INTO `t_coslers` VALUES (4, 'D', 46318, 46825);
INSERT INTO `t_coslers` VALUES (5, 'E', 46826, 47009);
INSERT INTO `t_coslers` VALUES (6, 'F', 47010, 47296);
INSERT INTO `t_coslers` VALUES (7, 'G', 47297, 47613);
INSERT INTO `t_coslers` VALUES (8, 'H', 47614, 48118);
INSERT INTO `t_coslers` VALUES (9, 'J', 48119, 49061);
INSERT INTO `t_coslers` VALUES (10, 'K', 49062, 49323);
INSERT INTO `t_coslers` VALUES (11, 'L', 49324, 49895);
INSERT INTO `t_coslers` VALUES (12, 'M', 49896, 50370);
INSERT INTO `t_coslers` VALUES (13, 'N', 50371, 50613);
INSERT INTO `t_coslers` VALUES (14, 'O', 50614, 50621);
INSERT INTO `t_coslers` VALUES (15, 'P', 50622, 50905);
INSERT INTO `t_coslers` VALUES (16, 'Q', 50906, 51386);
INSERT INTO `t_coslers` VALUES (17, 'R', 51387, 51445);
INSERT INTO `t_coslers` VALUES (18, 'S', 51446, 52217);
INSERT INTO `t_coslers` VALUES (19, 'T', 52218, 52697);
INSERT INTO `t_coslers` VALUES (20, 'W', 52698, 52979);
INSERT INTO `t_coslers` VALUES (21, 'X', 52980, 53640);
INSERT INTO `t_coslers` VALUES (22, 'Y', 53689, 54480);
INSERT INTO `t_coslers` VALUES (23, 'Z', 54481, 55289);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `identity_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `together` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `contract` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `archives` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `employee_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_phone`(`phone`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('402880625dc703fe015dc709659e0000', '王五', '男', '1998-05-28', '360782199805284430', '858751460@qq.com', '18816485440', '江西省赣州市章贡区', '购房客户', '张三，刘丽', '20170809204727.docx', '20170809204727.zip', '402880105d9b25f1015d9b27f4830000', '2017-08-09 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880625dceade1015dceb55a760000', '刘丽', '女', '1997-05-14', '360782199705143321', '458294789@qq.com', '15574304434', '江西省赣州市章贡区', '购房客户', '刘丽，王五', '20170811083524.docx', '20170811083524.zip', '402880105d9b25f1015d9b27f4830000', '2017-08-11 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880625dced739015dcee583ea0000', '刘四', '男', '1996-08-20', '360782199608124431', '458294789@qq.com', '13767714408', '江西省赣州市于都县', '购房客户', '刘四，李玉', '20170811092534.docx', '20170811092534.zip', '402880105da6bc43015da6c003e40001', '2017-08-11 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880625ddb6329015ddbaa42670002', '柳芬', '女', '1995-10-18', '360782199810184520', '458294789@qq.com', '15574304445', '江西省赣州市于都县', '购房客户', '柳芬，张三', '20170813205554.docx', '20170813205554.zip', '402880105da6bc43015da6be325a0000', '2017-08-13 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e0e0e0e015e0e13a9da0001', '柏凝', '男', '1995-07-20', '360782199805284421', 'boning@qq.com', '18723580288', '江西省赣州市大余县', '购房客户', '柏凝，季刊', '20170823155203.docx', '20170823155203.zip', '402880105d9b25f1015d9b27f4830000', '2017-08-23 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e365244015e365c0de20000', '昼夜', '男', '1994-07-20', '360782199805284213', 'zhouyeNL@qq.com', '18723580244', '江西省赣州市赣县', '购房客户', '昼夜，刘莉', '20170904153120.docx', '20170904153120.zip', '402880105da6bc43015da6be325a0000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e36ebd1015e36efd4a60001', '刘成', '男', '1995-06-21', '360782199805285541', '858751536@qq.com', '15574301946', '江西省赣州市章贡区', '预约客户', '刘成，李玉', '', '', '402880105d9b25f1015d9b27f4830000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e36ebd1015e36f2784c0002', '李钰', '女', '1997-06-13', '360782199705147712', '8587534578@qq.com', '15574308932', '江西省赣州市赣县', '预约客户', '李钰，王敬', NULL, NULL, '402880105d9b25f1015d9b27f4830000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e36ebd1015e36f7a5df0003', '王鑫', '男', '1995-06-20', '360782199705144431', '858752232@qq.com', '15574307721', '江西省赣州市赣县', '购房客户', '王鑫，李莉', '', '', '402880105dbb9591015dbb981e0b0000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e36ebd1015e36fa9e9e0006', '刘婉', '女', '1992-08-20', '360782199208204218', '858758891@qq.com', '15574305318', '江西省赣州市宁都县', '购房客户', '刘婉，陈岑', '', '', '402880105dc5d69f015dc5d81d0e0000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e37052d015e371764710008', '陈晨', '男', '1994-08-15', '360782199408154430', '1427916171@qq.com', '18174099445', '江西省赣州市信丰县', '购房客户', '陈晨，李露', '', '', '402880105dbb9591015dbb981e0b0000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e476a70015e478f75aa0005', '白墨', '女', '1996-06-18', '360782199606184420', 'baimo@bm.com', '18779077235', '江西省九江市', '预约客户', '白墨，建瓯', NULL, NULL, '402880105dc5d69f015dc5d81d0e0000', '2017-09-03 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e4bb18b015e4bd401730002', '小胡子', '男', '1994-08-15', '360782199408154431', '1729340612@qq.com', '18174099446', '江西省吉安市', '购房客户', '', '', '', '402880105da6bc43015da6c003e40001', '2017-09-04 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('402880635e4c95d4015e4cba08ba0000', '张三丰', '男', '1990-07-16', '360782199007164421', '858755738@qq.com', '13933944314', '江西省赣州市南康区', '预定客户', '张三丰，李莉', '', '', '402880105dba2970015dba2a02e00000', '2017-09-04 00:00:00', 'Y');
INSERT INTO `t_customer` VALUES ('4028ab1c5e4f8aed015e4fea74ea0017', '花君', '女', NULL, '', '1233@111.com', '18174099441', '江西省', '购房客户', '', '', '', '4028ab1c5e4f8aed015e4fe6eae30015', '2017-09-05 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '88888',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `exp` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `des` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `basic_salary` double NOT NULL,
  `headicon` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/aa.jpg',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `angency_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `building_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('402880105d9b25f1015d9b27f4830000', '张三', '858751460@qq.com', '123456', '13838384385', '858751460', '13838384385', '男', '工作三四年，销售经验丰富。\r\n', '性格开朗，礼貌待人。\r\n      \r\n  ', '江西省赣州市', 3000, '20170821142416.jpg', '大学本科毕业，业绩显著。', '4028800c5d86fa7b015d86fb264b0000', '402880055de58f1e015de5a1c5e30000', '2017-08-01 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105da6bc43015da6be325a0000', '李四', '982636051@qq.com', '123456', '13838386546', '982636051', '1383838654', '男', '在房地产公司工作了四五年，经验丰富。', '如果生活捉弄了你，只要你坚定信念，生命的长河中必须会激起绚丽多彩的浪花；', '江西省九江市', 4000, '20170808152238.jpg', '为客户推荐最合适的房子，让客户住的舒心。', '4028800c5d86fa7b015d86fb264b0000', '402880055de58f1e015de5b2749a0002', '2017-08-03 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105da6bc43015da6c003e40001', '李梅', '851237893@qq.com', '123456', '13845216543', '851237893', '1384521654', '女', '本人有扎实的销售专业知识基础，对专业知识有较深入的了解；', '有较强的学习能力、上进心强，处事态度细心谨慎、认真负责；', '江西省南昌市', 4000, '20170808153041.jpg', '有良好的生活习惯，与他人相处融洽，善于与人交际。', '4028800c5d86fa7b015d86fb264b0000', '402880055de58f1e015de5ba6fa00003', '2017-08-03 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105dba2970015dba2a02e00000', '刘梅', '147893574@qq.com', '123456', '13838384654', '暂未设置', '暂未设置', '女', '暂无', '暂无', '暂无', 2000, '20170904113919.jpg', '暂无', '402880105da09eb8015da0a1d5680000', '402880055e26374e015e267a2d440005', '2017-08-07 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105dba2a8a015dba2b46400000', '小丽', '123321@qq.com', '123456', '13838332621', '暂未设置', '暂未设置', '女', '暂无', '暂无', '暂无', 3400, '20170904114821.jpg', '暂无', '402880105da09eb8015da0a1d5680000', '402880055e26896c015e26941ba50001', '2017-08-07 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105dba2ce8015dba2dc8560000', '马冬梅', '2123651@qq.com', '123456', '13838312314', '2123651', '13838312314', '女', '暂无', '暂无', '暂无', 3400, '20170904145526.jpg', '暂无', '402880105da09eb8015da0a1d5680000', '402880055e26374e015e26827f4a0006', '2017-08-07 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105dbb9591015dbb981e0b0000', '娜美', '960473581@qq.com', '123456', '13838363254', '960473581', '1383836325', '女', '工作两年有余，深得客户信任。', '世界上对勇气的最大考验是忍受失败而不丧失信心。', '江西省萍乡市', 3400, '20170821194145.jpg', '绝不辜负每一个客户的信任，为每一个客户选好房。', '4028800c5d86fa7b015d86fb264b0000', '402880055de58f1e015de5a1c5e30000', '2017-08-07 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105dc5d69f015dc5d81d0e0000', '玛丽', '854738297@qq.com', '123456', '13845265815', '854738297', '13845265815', '女', '在二手房中介工作了两年有余，销售经验丰富。', '哪怕此刻的生活有多糟糕，也总会有好转的一天。', '江西省九江市', 3400, '20170821194312.jpg', '挑选出最适合客户的房，让客户有一个温馨的家。', '4028800c5d86fa7b015d86fb264b0000', '402880055de58f1e015de5f9406a000f', '2017-08-09 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('402880105e2da6d3015e2db397be0000', '琳达', '111@qq.com', '123456', '15979734621', '暂未设置', '15979734621', '女', '暂无', '暂无', '暂无', 2000, '20170904145709.jpg', '暂无', '402880105da09eb8015da0a1d5680000', '402880055e26896c015e268fd84c0000', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('4028802e5e239748015e23a18c5b0002', '露丝', '123@11.com', '123456', '18174099334', '暂未设置', '18174099334', '女', '暂无', '暂无', '暂无', 1234, '20170904150206.jpg', '暂无', '402880105da09eb8015da0a1d5680000', '402880055e280ee6015e28d65d8b0006', '2017-08-27 00:00:00', 'Y');
INSERT INTO `t_employee` VALUES ('4028ab1c5e4f8aed015e4fe6eae30015', '凤囚凰灬', '1427916171@qq.com', '123456', '13838384389', '暂未设置', '暂未设置', '女', '暂无', '暂无', '暂无', 4000, '20170905104023.jpg', '暂无', '4028800c5d86fa7b015d86fb264b0000', '4028802e5e2b6799015e2be7c3f30001', '2017-09-05 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS `t_history`;
CREATE TABLE `t_history`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_history
-- ----------------------------
INSERT INTO `t_history` VALUES ('402880055e3fe5f6015e3ff015330000', '402880055e2bea3a015e2d0b8eb10018', '402880055de58f1e015de5e77e90000c', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880055e3fe5f6015e404cdca80005', '402880055e2bea3a015e2d0b8eb10018', '402880055de58f1e015de5a1c5e30000', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880055e3fe5f6015e404d03740006', '402880055e2bea3a015e2d0b8eb10018', '402880055de58f1e015de5ccc95b0007', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880055e3fe5f6015e404eb1db000a', '402880055e2bea3a015e2d0b8eb10018', '402880055de58f1e015de5b2749a0002', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e2ced32015e2ced64ef0002', '402880105de49f76015de4a0820c0000', '402880055e2bea3a015e2c057b040002', '2017-08-29 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e2ced32015e2ceda7b80003', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e376126015e3762ff730000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5a1c5e30000', '2017-08-31 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e3b3ce8015e3b3f51b60000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5dddf74000b', '2017-09-01 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e3b614a015e3b6ae79b0001', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5b2749a0002', '2017-09-01 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e404721015e405167360000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5e77e90000c', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e404721015e405182900001', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5c64caa0005', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e404721015e405184d10002', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5d094fe0008', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e406abd015e406b45710000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5ccc95b0007', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4abc850c0005', '402880105de49f76015de4a0820c0000', '4028802e5e27a27b015e27b395420001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4abe28720007', '402880105de49f76015de4a0820c0000', '4028802e5e2b6799015e2be7c3f30001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4abec9980008', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5eb1fdb000d', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4abf1a620009', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5f577f9000e', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4ac464d1000a', '402880105de49f76015de4a0820c0000', '402880055e2bea3a015e2bfb76510001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4ab320015e4ac561f7000b', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5d8fc49000a', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4acc60015e4acd14fa0000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5d4dc050009', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4acc60015e4ad349030001', '402880105de49f76015de4a0820c0000', '402880055e26896c015e26941ba50001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4acc60015e4ad6985e0002', '402880105de49f76015de4a0820c0000', '402880055e26896c015e2698dbe50002', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880105e4acc60015e4ad6b1400003', '402880105de49f76015de4a0820c0000', '402880055e26f7c4015e276b5dc00002', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880635e400a72015e400d19c50000', '402880055d8c1a49015d8c1cab590000', '402880055de58f1e015de5b2749a0002', '2017-09-02 00:00:00');
INSERT INTO `t_history` VALUES ('402880635e4bb18b015e4bd9911a0004', '4028802e5e266a53015e267bb72d0001', '402880055de58f1e015de5d8fc49000a', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880635e4bb18b015e4bf158950014', '402880055d8c1a49015d8c1cab590000', '402880055de58f1e015de5d8fc49000a', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4f9549c00000', '402880055d8c1a49015d8c1cab590000', '402880055de58f1e015de5dddf74000b', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4f9561610001', '402880055d8c1a49015d8c1cab590000', '402880055e26896c015e2698dbe50002', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4f9576bd0002', '402880055d8c1a49015d8c1cab590000', '402880055e26f7c4015e276b5dc00002', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4f95a47f0003', '402880055d8c1a49015d8c1cab590000', '402880055de58f1e015de5c64caa0005', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4f95b4de0004', '402880055d8c1a49015d8c1cab590000', '402880055e2bea3a015e2c0c52410003', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4fe25e87000f', '4028802e5e2d1bbb015e2d1d95470000', '402880055de58f1e015de5d8fc49000a', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab1c5e4f8aed015e4fe552e80014', '4028802e5e2d1bbb015e2d1d95470000', '4028802e5e2b6799015e2be7c3f30001', '2017-09-05 00:00:00');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/jpg',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `area` double NULL DEFAULT NULL,
  `unit_price` double NOT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('402880055e0c649e015e0c6990ff0000', '3室1厅1卫1厨', '20170828084239.jpg', '3室1厅1卫1厨 ', 100, 3000, '402880055de58f1e015de5d094fe0008', '2017-08-23 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26374e015e2655be210000', '3室两厅两卫', '20170828085507.jpg', '3室两厅两卫，配有独立卫生间', 273, 3000, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26374e015e26585fbd0001', '四房二厅三卫', '20170828085759.jpg', '奢侈主卧，高端布局', 186, 2445, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26374e015e265a68dc0002', 'Y331_D四房二厅三卫', '20170828090012.jpg', '美式橫厅，奢雅大气', 186, 2333, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26374e015e265c35460003', 'Y33—DD四房二厅三卫', '20170828090210.jpg', '套房次卧，舒适之邸', 162, 2445, '402880055de58f1e015de5a1c5e30000', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26f7c4015e27cb28bd00a1', '3室两厅两卫', '20170828154259.jpg', '3室两厅两卫 简单舒适', 123, 3456, '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26f7c4015e27cc31a900a2', '3室一厅两卫', '20170828154407.jpg', '高雅舒适', 109, 2345, '402880055e26896c015e26d83a940007', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e26f7c4015e27cd190600a3', '四室两厅两卫', '20170828154506.jpg', '四室两厅两卫 奢雅主卧', 233, 2333, '402880055e26374e015e266f73bb0004', '2017-08-28 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2c9a4c250010', '三室两厅两卫', '20170829140743.jpg', '三室两厅两卫', 120, 3000, '402880055e2bea3a015e2bfb76510001', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2c9e309d0011', '三室两厅两卫', '20170829141158.jpg', '三室两厅两卫', 200, 4500, '402880055de58f1e015de5b2749a0002', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2c9f7d370012', '二室一厅', '20170829141323.jpg', '奢侈主卧，高端布局带独卫', 120, 3000, '402880055de58f1e015de5b2749a0002', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2ca4df8f0013', '三室两厅两卫', '20170829141916.jpg', '三室两厅两卫独立阳台', 150, 3000, '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2caea6ba0014', '三室一厅两卫', '20170829142957.jpg', '精装修，高贵奢华', 130, 7900, '402880055de58f1e015de5ba6fa00003', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e2bea3a015e2cb1b0810015', '两室一厅', '20170829143316.jpg', '两室一厅，带独卫，精修', 90, 8000, '402880055de58f1e015de5beb16b0004', '2017-08-29 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e405762c8000b', '3室1厅1卫1厨', '20170902100702.jpg', '3室1厅1卫1厨 ', 200, 7000, '402880055de58f1e015de5c64caa0005', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4058973f000c', '3室两厅两卫', '20170902100821.jpg', '3室两厅两卫，配有独立卫生间', 130, 7600, '402880055de58f1e015de5ccc95b0007', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e405966e8000d', '三室两厅两卫', '20170902100914.jpg', '奢侈主卧，高端布局带独卫', 150, 8000, '402880055de58f1e015de5d4dc050009', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e405ad445000e', '三室一厅两卫', '20170902101047.jpg', '精装修，高贵奢华', 140, 8000, '402880055de58f1e015de5d8fc49000a', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e405f1d45000f', '三室两厅两卫', '20170902101528.jpg', '三室两厅两卫 带独卫，精修', 230, 9000, '402880055de58f1e015de5dddf74000b', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4060798a0010', '3室1厅1卫1厨', '20170902101657.jpg', '宽敞，辽阔', 160, 8000, '402880055de58f1e015de5e77e90000c', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406199660011', '三室两厅两卫', '20170902101811.jpg', '三室两厅两卫独立阳台', 268, 12000, '402880055de58f1e015de5eb1fdb000d', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406273050012', 'D 四房二厅三卫', '20170902101907.jpg', '美式橫厅，奢雅大气', 140, 7000, '402880055de58f1e015de5f577f9000e', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406399c20013', '二室一厅', '20170902102022.jpg', '奢侈主卧，高端布局带独卫', 124, 7800, '402880055de58f1e015de5f9406a000f', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4064635e0014', '两室一厅', '20170902102114.jpg', '两室一厅，带独卫，精修', 130, 8900, '402880055e26896c015e2698dbe50002', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406586110015', '3室两厅两卫', '20170902102228.jpg', '3室两厅两卫 简单舒适', 140, 8900, '402880055e26896c015e26af58fc0005', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e40668c310016', '三室两厅两卫', '20170902102335.jpg', '采光度高', 100, 7800, '402880055e2bea3a015e2bef510e0000', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406938600017', '3室一厅一卫', '20170902102631.jpg', '3室一厅一卫', 43, 5400, '402880055e2bea3a015e2c057b040002', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406a5ab10018', '两室一厅', '20170902102745.jpg', '两室一厅，带独卫，精修', 100, 6000, '402880055e2bea3a015e2c0c52410003', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406b0d110019', '三室两厅', '20170902102831.jpg', '三室两厅两卫独立阳台', 180, 9000, '402880055de58f1e015de5a1c5e30000', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406c0512001a', '四室两厅两卫 ', '20170902102934.jpg', '四室两厅两卫 奢雅主卧', 200, 12000, '4028802e5e2b6799015e2be7c3f30001', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406d03e8001b', '3室两厅两卫', '20170902103039.jpg', '3室两厅两卫', 130, 7900, '4028802e5e27b96b015e27eaaef70002', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406f6c08001c', '三室两厅两卫', '20170902103317.jpg', '精装修，高贵奢华', 140, 7600, '402880055e26374e015e267a2d440005', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e406fed0d001d', '四房二厅三卫', '20170902103350.jpg', '美式橫厅，奢雅大气', 120, 7800, '402880055e26374e015e26827f4a0006', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4070aa91001e', '3室两厅两卫', '20170902103439.jpg', '3室两厅两卫，配有独立卫生间', 123, 5600, '402880055e26896c015e26941ba50001', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4071cff9001f', '三室两厅两卫', '20170902103554.jpg', '三室两厅两卫独立阳台', 120, 9800, '402880055e26896c015e26941ba50001', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e40733b4f0020', '三室两厅两卫', '20170902103727.jpg', '三室两厅两卫 ', 130, 8900, '402880055e280ee6015e28d65d8b0006', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4075b4b10021', '4房2厅3卫', '20170902104009.jpg', '独立餐厅设计，秀色可餐', 180, 12000, '4028802e5e27a27b015e27b395420001', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e407885f80022', '两室一厅两卫', '20170902104314.jpg', '双层设计，生活娱乐互不干扰', 105, 11000, '402880055e26896c015e26a4d2e90003', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e407ab9440023', '4房2厅3卫', '20170902104538.jpg', '次卧双飘窗设计', 143, 8900, '402880055e26896c015e26acc5fb0004', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e407cfd310024', '3房2厅2卫', '20170902104806.jpg', '美式橫厅，奢雅大气', 129, 12000, '402880055e26896c015e26cc55610006', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e407ff3ea0025', '4房2厅3卫', '20170902105120.jpg', '次卧双飘窗设计', 123, 10000, '402880055e26f7c4015e276b5dc00002', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880055e3fe5f6015e4084d5d60026', '3室1厅1卫1厨', '20170902105640.jpg', '苛求 自有我成就', 129, 10000, '402880b65e278518015e27a454a30000', '2017-09-02 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('402880105e14206f015e14286bcb0000', '3室1厅1卫1厨', '20170828084251.jpg', '宽敞，辽阔', 300, 1500000, '402880055de58f1e015de5b2749a0002', '2017-08-24 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5ddea86f015ddeaa5d400000', '2室1厅1卫', '20170824081259.jpg', '2室1厅1卫', 140, 2000, '402880105da73e41015da74835fb0001', '2017-08-14 00:00:00', 'N');
INSERT INTO `t_house` VALUES ('4028802e5ddea86f015ddeaa6dc30001', '3室1厅1卫', '20170824081504.jpg', '3室1厅1卫', 120, 3200, '402880105da73e41015da74835fb0001', '2017-08-14 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5ddebbaf015ddecd8c8d0001', '3室2厅1卫', '20170824081640.jpg', '3室2厅1卫', 150, 4000, '402880105da73e41015da74835fb0001', '2017-08-14 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5ddeceed015ddecf397d0000', '2室2厅2卫', '20170824081756.jpg', '2室2厅2卫', 180, 5000, '402880105da73e41015da74835fb0001', '2017-08-14 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5de075fa015de0799cba0000', '三室两厅两卫', '20170828084512.jpg', '三室两厅两卫，采光度高', 123, 123, '402880105da5a937015da5aa81910000', '2017-08-14 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5e07a8b3015e07af98a30000', '8#16#20# A2-A3户型 96㎡ 3房2厅1卫', '20170828084608.jpg', '3室2厅1卫1厨', 96, 86, '402880105da5a937015da5aa81910000', '2017-08-22 00:00:00', 'Y');
INSERT INTO `t_house` VALUES ('4028802e5e1426ad015e142bf2270000', '3室一厅一卫', '20170828084704.jpg', '3室一厅一卫', 123, 123123, '402880055de58f1e015de5a1c5e30000', '2017-08-24 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` date NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_like
-- ----------------------------
INSERT INTO `t_like` VALUES ('402880055dca0426015dca047f300000', '402880055d8c1a49015d8c1cab590000', '402880105da5a937015da5aa81910000', '2017-08-10', 'Y');
INSERT INTO `t_like` VALUES ('402880055dcc02ce015dcc03683a0000', '402880055dcbecc6015dcbef77ce0000', '402880105da5a937015da5aa81910000', '2017-08-10', 'N');
INSERT INTO `t_like` VALUES ('402880055e174d69015e1751b8f70000', '402880055db03591015db03787100000', '402880055de58f1e015de5a1c5e30000', '2017-08-25', 'Y');
INSERT INTO `t_like` VALUES ('402880055e174d69015e1751c9df0001', '402880055db03591015db03787100000', '402880055de58f1e015de5b2749a0002', '2017-08-25', 'Y');
INSERT INTO `t_like` VALUES ('402880055e1862cd015e1865a46a0000', '402880055db03591015db03787100000', '402880055de58f1e015de5ba6fa00003', '2017-08-25', 'Y');
INSERT INTO `t_like` VALUES ('402880055e2bde29015e2be22f940000', '402880055db03591015db03787100000', '402880055e26374e015e267a2d440005', '2017-08-29', 'Y');
INSERT INTO `t_like` VALUES ('402880055e2bea3a015e2cd8db7d0017', '402880055db03591015db03787100000', '402880055e26374e015e26827f4a0006', '2017-08-29', 'Y');
INSERT INTO `t_like` VALUES ('402880055e3ac41e015e3ad3361d0000', '402880055e2bea3a015e2d0b8eb10018', '402880055de58f1e015de5beb16b0004', '2017-09-01', 'Y');
INSERT INTO `t_like` VALUES ('402880105e31f046015e31f9d2db0001', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5ccc95b0007', '2017-08-30', 'Y');
INSERT INTO `t_like` VALUES ('402880105e32ee7c015e3302bd5c0000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5d4dc050009', '2017-08-30', 'Y');
INSERT INTO `t_like` VALUES ('402880105e36e1d6015e36e795470000', '402880105de49f76015de4a0820c0000', '402880055e26896c015e26cc55610006', '2017-08-31', 'Y');
INSERT INTO `t_like` VALUES ('402880105e3b614a015e3b6b1fc70002', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5ba6fa00003', '2017-09-01', 'Y');
INSERT INTO `t_like` VALUES ('402880105e4ab320015e4ab511a40000', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5d8fc49000a', '2017-09-04', 'Y');
INSERT INTO `t_like` VALUES ('402880105e4ab320015e4ab57b890001', '402880105de49f76015de4a0820c0000', '402880055e2bea3a015e2bfb76510001', '2017-09-04', 'Y');
INSERT INTO `t_like` VALUES ('402880105e4ab320015e4abd87f30006', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5beb16b0004', '2017-09-04', 'Y');
INSERT INTO `t_like` VALUES ('402880105e4acc60015e4ad6f2840004', '402880105de49f76015de4a0820c0000', '402880055de58f1e015de5dddf74000b', '2017-09-04', 'Y');
INSERT INTO `t_like` VALUES ('402880435e2bd51f015e2cd8c0790000', '402880055d8c1a49015d8c1cab590000', '402880055e2bea3a015e2c057b040002', '2017-08-29', 'Y');
INSERT INTO `t_like` VALUES ('402880435e2bd51f015e2cd90b030001', '402880055d8c1a49015d8c1cab590000', '402880055e2bea3a015e2c0c52410003', '2017-08-29', 'Y');
INSERT INTO `t_like` VALUES ('402880435e2bd51f015e2cd987780002', '402880055d8c1a49015d8c1cab590000', '402880055e2bea3a015e2bfb76510001', '2017-08-29', 'Y');
INSERT INTO `t_like` VALUES ('402880635e4bb18b015e4bf172de0015', '402880055d8c1a49015d8c1cab590000', '402880055de58f1e015de5d8fc49000a', '2017-09-04', 'Y');
INSERT INTO `t_like` VALUES ('4028ab1c5e4f8aed015e4fe20f7c000d', '4028802e5e2d1bbb015e2d1d95470000', '402880055de58f1e015de5d8fc49000a', '2017-09-05', 'Y');
INSERT INTO `t_like` VALUES ('4028ab1c5e4f8aed015e4fe21afb000e', '4028802e5e2d1bbb015e2d1d95470000', '402880055de58f1e015de5dddf74000b', '2017-09-05', 'Y');
INSERT INTO `t_like` VALUES ('4028ab1c5e4f8aed015e4fe48ff90013', '4028802e5e2d1bbb015e2d1d95470000', '402880055de58f1e015de5b2749a0002', '2017-09-05', 'Y');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `headicon` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('e10adc3949ba59abbe56e057f20f883e', 'Zachary', '', 'fcea920f7412b5da7be0cf42b8c93759', '18720733215', '', NULL);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `buildings_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reply` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `leave_time` datetime(0) NULL DEFAULT NULL,
  `reply_time` datetime(0) NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  `agency_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('402880055e3b06ad015e3b0b26ba0002', '我对名称为《望京·金茂府》的房源感兴趣，想获得更详细的信息', '402880055de58f1e015de5beb16b0004', '好的，没问题', '2017-09-01 00:00:00', '2017-09-04 00:00:00', '402880055e2bea3a015e2d0b8eb10018', 'Y', '4028800c5d86fa7b015d86fb264b0000');
INSERT INTO `t_message` VALUES ('402880105e376126015e3765c9f70003', '我对名称为《汤臣一品》的房源感兴趣，想获得更详细的信息', '402880055de58f1e015de5a1c5e30000', NULL, '2017-08-31 00:00:00', NULL, '402880105de49f76015de4a0820c0000', 'Y', '4028800c5d86fa7b015d86fb264b0000');
INSERT INTO `t_message` VALUES ('402880105e4ab320015e4aba89720004', '我对《银河名都》感兴趣', '402880055e2bea3a015e2bfb76510001', NULL, '2017-09-04 00:00:00', NULL, '402880105de49f76015de4a0820c0000', 'Y', '4028800c5d86fa7b015d86fb264b0000');
INSERT INTO `t_message` VALUES ('asda212315432', '这楼盘实在是太好了', '402880105da5a937015da5aa81910000', '十分感谢您的赞美！', '2017-08-09 00:00:00', '2017-08-21 00:00:00', '402880105de49f76015de4a0820c0000', 'Y', '4028800c5d86fa7b015d86fb264b0000');

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `monthes` int(11) NULL DEFAULT NULL,
  `emp_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bonus_percent` double NOT NULL,
  `sales` int(11) NULL DEFAULT NULL,
  `salary` double NULL DEFAULT NULL,
  `yearmonth` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mission
-- ----------------------------
INSERT INTO `t_mission` VALUES ('402880635e120c60015e120cf2180000', 6, 8, '402880105d9b25f1015d9b27f4830000', 0.1, 2, 71500, '2017-08');
INSERT INTO `t_mission` VALUES ('402880635e12378e015e1238fdc50000', 6, 8, '402880105da6bc43015da6be325a0000', 0.15, 1, 149800, '2017-08');
INSERT INTO `t_mission` VALUES ('402880635e23aea9015e23af15b60000', 6, 8, '402880105da6bc43015da6c003e40001', 0.1, 0, 30600, '2017-08');
INSERT INTO `t_mission` VALUES ('402880635e37052d015e371150360006', 6, 8, '402880105dbb9591015dbb981e0b0000', 0.1, 0, 3400, '2017-08');
INSERT INTO `t_mission` VALUES ('402880635e3c115a015e3c125c4a0000', 8, 9, '402880105d9b25f1015d9b27f4830000', 0.12, 1, 191400, '2017-09');
INSERT INTO `t_mission` VALUES ('402880635e3c4650015e3c48b3970000', 4, 9, '402880105dc5d69f015dc5d81d0e0000', 0.08, 1, 291400, '2017-09');
INSERT INTO `t_mission` VALUES ('402880635e3c50be015e3c5236690000', 6, 9, '402880105da6bc43015da6be325a0000', 0.1, 1, 128200, '2017-09');
INSERT INTO `t_mission` VALUES ('402880635e3d1f22015e3d22492f0000', 5, 9, '402880105dbb9591015dbb981e0b0000', 0.09, 2, 108700, '2017-09');
INSERT INTO `t_mission` VALUES ('402880635e476a70015e4780cea20002', 5, 9, '402880105da6bc43015da6c003e40001', 0.08, 2, 54080, '2017-09');
INSERT INTO `t_mission` VALUES ('402880635e4c95d4015e4cc22a9f00b6', 4, 9, '402880105dba2970015dba2a02e00000', 0.08, 1, 82864, '2017-09');
INSERT INTO `t_mission` VALUES ('4028ab1c5e4f8aed015e4ff00d240029', 5, 9, '4028ab1c5e4f8aed015e4fe6eae30015', 0.08, 1, 43138.408, '2017-09');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `des` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `des` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `permission_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `house_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `building_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sale_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '销售中',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('1', '4028802e5ddebbaf015ddecd8c8d0001', '4028802e5de08e1e015de08e6d340000', 'A栋一区1-1', '待售中');
INSERT INTO `t_room` VALUES ('402880055e0c649e015e0c6a448e0001', '402880055e0c649e015e0c6990ff0000', '4028802e5e03f68e015e049038a70001', 'A栋', '待售中');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27b90b93005f', '4028802e5ddea86f015ddeaa5d400000', '4028802e5de08e1e015de08e6d340000', 'A栋1区 2—1', '待售中');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27ba9eb70060', '4028802e5ddeceed015ddecf397d0000', '4028802e5e03f68e015e049289570003', 'B栋1区  1-1', '已售');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27c80171009b', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27aabc72005c', 'B栋A区 1—1', '待售中');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27c8e42d009c', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a48a310057', 'A栋2区 1—1', '已售');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27c91a10009d', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a48a310057', 'A栋2区 2—1', '待售中');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27c96ca8009e', '402880055e26374e015e265c35460003', '402880055e26f7c4015e27a559ec0058', 'A栋3区 1—1', '待售中');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27c9bd80009f', '4028802e5ddeceed015ddecf397d0000', '402880055e26f7c4015e27a6c360005a', 'A栋3区 2—1', '已售');
INSERT INTO `t_room` VALUES ('402880055e26f7c4015e27ca128a00a0', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a559ec0058', 'A栋3区 3—1', '销售中');
INSERT INTO `t_room` VALUES ('4028802e5dede03e015dede08ecf0000', '4028802e5ddea86f015ddeaa5d400000', '4028802e5de08e1e015de08e6d340000', 'A栋1区 3—1', '已售');
INSERT INTO `t_room` VALUES ('4028802e5def4140015def42fb670000', '4028802e5ddebbaf015ddecd8c8d0001', '4028802e5dee2e2a015dee31d8d20000', 'A栋1区 4—1', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e07520a015e075736bc0002', '4028802e5ddea86f015ddeaa5d400000', '4028802e5de08e1e015de08e6d340000', '12', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e1426ad015e142c5a6a0001', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', '123啊', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e1748a0015e174930ba0000', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', '5', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e194dc3015e194e57630000', '402880105e14206f015e14286bcb0000', '4028802e5e03f68e015e048fcb510000', 'B栋2区3-1', '已售');
INSERT INTO `t_room` VALUES ('4028802e5e1964d1015e196706580000', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', ' A栋1区1-1', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e1964d1015e196730dc0001', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', ' A栋1区2-1', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e1964d1015e19673e350002', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', ' A栋1区3-1', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e22fc55015e230b585c0000', '402880055e0c649e015e0c6990ff0000', '4028802e5de08e1e015de08e6d340000', '', '待售中');
INSERT INTO `t_room` VALUES ('4028802e5e26d4a3015e26d6db8c0001', '402880055e26374e015e26585fbd0001', '4028802e5de08e1e015de08e6d340000', '儿童大润发要通过银行你家门口，l', '待售中');
INSERT INTO `t_room` VALUES ('402880635e37052d015e370a1f7e0000', '4028802e5ddea86f015ddeaa5d400000', '402880055e2bea3a015e2c962202000d', 'A栋1区 1-1', '已售');
INSERT INTO `t_room` VALUES ('402880635e37052d015e370b51e00001', '402880055e0c649e015e0c6990ff0000', '402880055e2bea3a015e2c962202000d', 'A栋1区 2-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e37052d015e370bb9b50002', '402880055e2bea3a015e2cb1b0810015', '402880055e2bea3a015e2c96fb66000e', 'A栋2区 1-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e37052d015e370c01bf0003', '402880055e2bea3a015e2c9a4c250010', '402880055e2bea3a015e2c96fb66000e', 'A栋2区 2-1', '已售');
INSERT INTO `t_room` VALUES ('402880635e37052d015e370c52f10004', '402880055e26f7c4015e27cd190600a3', '402880055e2bea3a015e2c97a619000f', 'A栋3区 1-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4acacb015e4ad6c1280001', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a7de56005b', 'A栋1区1-1', '已售');
INSERT INTO `t_room` VALUES ('402880635e4acacb015e4ad9addd0006', '402880055e26f7c4015e27cd190600a3', '402880055e26f7c4015e27a6c360005a', 'A栋3区 3-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53bf30005', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  1-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53cf80006', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  1-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53d8c0007', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  1-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53e610008', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  2-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53ece0009', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  2-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53f06000a', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  2-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be53f47000b', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  3-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be54034000c', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  3-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be54080000d', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  3-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be540c0000e', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  4-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be540fb000f', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  4-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be5413b0010', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  4-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be541790011', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  5-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be541b70012', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  5-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4bb18b015e4be542010013', '402880055e0c649e015e0c6990ff0000', '402880055e26f7c4015e27a6c360005a', '浅水湾别墅-A栋3区  5-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbe40510003', '402880055e3fe5f6015e406f6c08001c', '402880635e4c95d4015e4cbd34630001', 'A栋一区 1-1', '已售');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf81d80004', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  1-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf82610005', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  1-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf82980006', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  1-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf82d20007', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  2-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf831e0008', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  2-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf83a20009', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  2-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8410000a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  3-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf848c000b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  3-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf84c2000c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  3-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf84fd000d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  4-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8534000e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  4-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf856d000f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  4-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf85a40010', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  5-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf85cd0011', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  5-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf86100012', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  5-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf86470013', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  6-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf868c0014', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  6-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf86da0015', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  6-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf87290016', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  7-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf875f0017', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  7-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf87960018', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  7-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf87d90019', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  8-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8827001a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  8-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf885e001b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  8-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8895001c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  9-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf88cb001d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  9-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8901001e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  9-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf893c001f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  10-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf89720020', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  10-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf89b50021', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  10-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8a060022', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  11-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8a5c0023', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  11-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8a900024', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  11-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8aca0025', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  12-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8b010026', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  12-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8b3a0027', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  12-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8b700028', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  13-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8bb30029', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  13-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8bf4002a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  13-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8c2d002b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  14-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8c65002c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  14-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8ca6002d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  14-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8cdf002e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  15-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8d15002f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  15-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8d4c0030', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  15-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8d8f0031', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  16-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8dd10032', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  16-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8e0a0033', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  16-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8e410034', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  17-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8e760035', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  17-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8f100036', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  17-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8f560037', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  18-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8f8f0038', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  18-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf8fcf0039', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  18-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9012003a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  19-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf904d003b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  19-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9085003c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  19-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf90bc003d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  20-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf90f3003e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  20-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9128003f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  20-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf91780040', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  21-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf91c60041', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  21-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf92120042', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  21-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf927f0043', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  22-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf92c80044', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  22-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf93080045', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  22-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf933f0046', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  23-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf93cd0047', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  23-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf94110048', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  23-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf94600049', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  24-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf949f004a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  24-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf94d8004b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  24-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9525004c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  25-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf955e004d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  25-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9597004e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  25-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf95cd004f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  26-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf96050050', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  26-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf96520051', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  26-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf96940052', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  27-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf96cd0053', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  27-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf97050054', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  27-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf973c0055', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  28-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf97730056', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  28-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf980a0057', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  28-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf98480058', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  29-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf98880059', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  29-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf98cc005a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  29-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9903005b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  30-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9946005c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  30-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf998e005d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  30-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf99c9005e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  31-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9a00005f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  31-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9a420060', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  31-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9a8b0061', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  32-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9ad80062', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  32-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9b0a0063', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  32-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9b450064', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  33-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9b880065', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  33-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9bbf0066', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  33-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9bf60067', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  34-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9c7c0068', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  34-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9cbd0069', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  34-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9cff006a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  35-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9d38006b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  35-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9d6f006c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  35-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9da6006d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  36-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9de9006e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  36-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9e22006f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  36-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9e580070', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  37-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9e9a0071', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  37-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9edd0072', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  37-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9f130073', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  38-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9f4e0074', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  38-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbf9fdc0075', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  38-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa0130076', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  39-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa04b0077', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  39-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa0da0078', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  39-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa1130079', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  40-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa14e007a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  40-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa182007b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  40-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa1d7007c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  41-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa211007d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  41-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa247007e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  41-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa27f007f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  42-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa2ba0080', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  42-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa2ef0081', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  42-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa3290082', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  43-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa35f0083', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  43-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa3960084', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  43-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa3d10085', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  44-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa41a0086', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  44-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa4510087', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  44-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa4880088', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  45-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa51f0089', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  45-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa571008a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  45-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa5b5008b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  46-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa5e9008c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  46-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa62f008d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  46-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa670008e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  47-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa6a9008f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  47-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa6e10090', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  47-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa71a0091', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  48-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa74c0092', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  48-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa7880093', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  48-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa7be0094', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  49-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa8040095', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  49-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa8400096', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  49-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa8790097', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  50-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa8b20098', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  50-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa8f30099', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  50-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa92e009a', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  51-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa9c5009b', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  51-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfa9fd009c', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  51-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaa3f009d', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  52-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaa84009e', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  52-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaab9009f', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  52-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaaf100a0', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  53-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfab2700a1', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  53-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfab6200a2', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  53-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfab9a00a3', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  54-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfabd000a4', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  54-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfac1100a5', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  54-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfac5500a6', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  55-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfacb900a7', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  55-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfad6600a8', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  55-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfad9800a9', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  56-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfae9600aa', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  56-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaeda00ab', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  56-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaf1100ac', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  57-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaf5300ad', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  57-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfaf9700ae', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  57-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfafcc00af', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  58-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfb00300b0', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  58-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfb03000b1', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  58-3', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfb07400b2', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  59-1', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfb0a800b3', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  59-2', '待售中');
INSERT INTO `t_room` VALUES ('402880635e4c95d4015e4cbfb0e300b4', '402880055e3fe5f6015e4071cff9001f', '402880635e4c95d4015e4cbd34630001', 'A栋一区  59-3', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed690a0019', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  1-1', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed696a001a', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  1-2', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6995001b', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  1-3', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed69cd001c', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  2-1', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6a03001d', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  2-2', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6a31001e', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  2-3', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6a5c001f', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  3-1', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6a8a0020', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  3-2', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6aba0021', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  3-3', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6b1a0022', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  4-1', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6c100023', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  4-2', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6c670024', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  4-3', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6cc00025', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  5-1', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6ceb0026', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  5-2', '待售中');
INSERT INTO `t_room` VALUES ('4028ab1c5e4f8aed015e4fed6d190027', '402880055e26f7c4015e27cd190600a3', '4028ab1c5e4f8aed015e4fecd3840018', '海亮天曾 A栋  5-3', '待售中');

-- ----------------------------
-- Table structure for t_sale
-- ----------------------------
DROP TABLE IF EXISTS `t_sale`;
CREATE TABLE `t_sale`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sale_time` datetime(0) NULL DEFAULT NULL,
  `unit_price` double NULL DEFAULT NULL,
  `room_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `total_cost` double NULL DEFAULT NULL,
  `emp_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale
-- ----------------------------
INSERT INTO `t_sale` VALUES ('402880635e363a1b015e363dedd00000', '402880635e0e0e0e015e0e13a9da0001', '2017-08-31 00:00:00', 4000, '402880055e26f7c4015e27c8e42d009c', NULL, 400000, '402880105d9b25f1015d9b27f4830000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e365244015e365e4c360001', '402880625ddb6329015ddbaa42670002', '2017-08-31 00:00:00', 6000, '402880055e26f7c4015e27c9bd80009f', 0.9, 972000, '402880105da6bc43015da6be325a0000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e36ebd1015e36ecd8d40000', '402880625dc703fe015dc709659e0000', '2017-08-31 00:00:00', 3000, '402880055e26f7c4015e27ca128a00a0', 0.9, 270000, '402880105d9b25f1015d9b27f4830000', '2017-08-31 00:00:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e3c50be015e3c5396f40001', '402880635e36ebd1015e36fa9e9e0006', '2017-09-01 00:00:00', 15000, '4028802e5e194dc3015e194e57630000', 0.8, 3600000, '402880105dc5d69f015dc5d81d0e0000', '2017-09-01 00:00:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e3c6afe015e3c6becc00000', '402880625dceade1015dceb55a760000', '2017-09-01 15:50:59', 5000, '402880055e26f7c4015e27ba9eb70060', NULL, 900000, '402880105d9b25f1015d9b27f4830000', '2017-09-01 15:51:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e476a70015e477fc62f0001', '402880625dced739015dcee583ea0000', '2017-09-03 19:28:30', 2000, '402880635e37052d015e370a1f7e0000', 0.95, 266000, '402880105da6bc43015da6c003e40001', '2017-09-03 19:28:30', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e476a70015e4788b95b0003', '402880635e37052d015e371764710008', '2017-09-03 19:38:16', 5000, '402880055e26f7c4015e27ba9eb70060', NULL, 900000, '402880105dbb9591015dbb981e0b0000', '2017-09-03 19:38:16', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e476a70015e478b37d20004', '402880635e36ebd1015e36f7a5df0003', '2017-09-03 19:41:00', 3000, '402880055e26f7c4015e27c8e42d009c', 0.9, 270000, '402880105dbb9591015dbb981e0b0000', '2017-09-03 19:41:00', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e4bb18b015e4bcbfcb30000', '402880635e365244015e365c0de20000', '2017-09-04 15:30:13', 3000, '402880635e4acacb015e4ad6c1280001', 0.9, 270000, '402880105da6bc43015da6be325a0000', '2017-09-04 15:30:13', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e4bb18b015e4bd546a10003', '402880635e4bb18b015e4bd401730002', '2017-09-04 15:40:22', 3000, '402880635e37052d015e370c01bf0003', NULL, 360000, '402880105da6bc43015da6c003e40001', '2017-09-04 15:40:22', 'Y');
INSERT INTO `t_sale` VALUES ('402880635e4c95d4015e4cc13d8600b5', '402880635e4c95d4015e4cba08ba0000', '2017-09-04 19:58:06', 7600, '402880635e4c95d4015e4cbe40510003', 0.95, 1010800, '402880105dba2970015dba2a02e00000', '2017-09-04 19:58:06', 'Y');
INSERT INTO `t_sale` VALUES ('4028ab1c5e4f8aed015e4fee6ca90028', '4028ab1c5e4f8aed015e4fea74ea0017', '2017-09-05 10:46:19', 2333, '4028ab1c5e4f8aed015e4fed69cd001c', 0.9, 489230.10000000003, '4028ab1c5e4f8aed015e4fe6eae30015', '2017-09-05 10:46:19', 'Y');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `headicon` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/aa.jpg',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('402880055d8c1a49015d8c1cab590000', 'zhouyeNL@qq.com', '18723580244', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', NULL, '昼夜NL', '昼夜', '20170816090814.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055d8c1a49015d8c1dc1cc0001', 'boning@qq.com', '18723580288', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', NULL, '柏凝BN', '柏凝', '20170816092819.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055da2fb26015da2fede9e0000', 'baiye@qq.com', '18779076534', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', NULL, '百叶BY', '白夜', '20170816092921.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055db03591015db03787100000', 'QY@qq.com', '13678902733', 'e10adc3949ba59abbe56e057f20f883e', '880723932', 'qyan', '女', '2017-08-09', '祈言QY', '齐言', '20170816093014.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055db03591015db03af7250001', 'MLG@qq.com', '14778902733', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', '2007-06-19', '穆柳刚M', '穆柳刚', '20170816093212.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055dbb9543015dbb979dab0001', 'KKKK@qq.com', '13678785663', 'e10adc3949ba59abbe56e057f20f883e', 'QQ111', 'KUIHAI', '女', NULL, 'KKKKK', '隗海', '20170816093255.jpg', 'Y');
INSERT INTO `t_user` VALUES ('402880055dcbecc6015dcbef77ce0000', 'xiaoqiongjiu@qq.com', '14779077749', 'e10adc3949ba59abbe56e057f20f883e', '', '', '女', NULL, '萧琼久Q', '萧琼久', '20170816093344.jpg ', 'Y');
INSERT INTO `t_user` VALUES ('402880055e2bea3a015e2d0b8eb10018', 'baimo@bm.com', '18779077235', 'e10adc3949ba59abbe56e057f20f883e', '', '', '女', NULL, '白墨.&', '白墨', '20170901102139.jpg   ', 'Y');
INSERT INTO `t_user` VALUES ('402880105de49f76015de4a0820c0000', '1729340612@qq.com', '18174099445', 'e10adc3949ba59abbe56e057f20f883e', '1729340612', 'z1729340612', '男', '1994-08-15', '小胡子', '小胡子', '20170901111129.jpg ', 'Y');
INSERT INTO `t_user` VALUES ('4028802e5e266a53015e266fcacb0000', '1233@11.com', '18174099334', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', NULL, 'asd', 'asd', '20170901102549.jpg', 'Y');
INSERT INTO `t_user` VALUES ('4028802e5e266a53015e267bb72d0001', '123@11.com', '18174099331', 'e10adc3949ba59abbe56e057f20f883e', '', '', '男', NULL, '灰白', '灰白', '20170901102820.jpg', 'Y');
INSERT INTO `t_user` VALUES ('4028802e5e2d1bbb015e2d1d95470000', '1233@111.com', '18174099441', 'e10adc3949ba59abbe56e057f20f883e', '', '', '女', NULL, '花君', '花君', '20170905103217.jpg', 'Y');

-- ----------------------------
-- Function structure for rno
-- ----------------------------
DROP FUNCTION IF EXISTS `rno`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `rno`() RETURNS int(11)
BEGIN   

SET @rno = @rno + 1;   

RETURN @rno;   

END
;;
delimiter ;

-- ----------------------------
-- Function structure for rno_init
-- ----------------------------
DROP FUNCTION IF EXISTS `rno_init`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `rno_init`() RETURNS int(11)
BEGIN   
SET @rno = 0;
return 0;   
END
;;
delimiter ;

-- ----------------------------
-- Function structure for rno_reset
-- ----------------------------
DROP FUNCTION IF EXISTS `rno_reset`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `rno_reset`() RETURNS int(11)
BEGIN   
SET @rno = 0;   
RETURN 1;   
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

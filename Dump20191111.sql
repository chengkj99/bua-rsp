-- MySQL dump 10.13  Distrib 5.7.28, for osx10.14 (x86_64)
--
-- Host: localhost    Database: bua_rsp
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `booking_name` varchar(45) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `reply` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,184,'核磁共振波谱仪',1,1,'user',1570723200,1570809599,'d','ok','agree'),(2,183,'液相色谱质谱系统',1,1,'user',1570723200,1570809599,'s','ok','paid'),(3,183,'液相色谱质谱系统',1,1,'user',1570723200,1570809599,'s','OK','paid'),(4,183,'液相色谱质谱系统',1,1,'user',1570809600,1570895999,'d','OK','paid'),(5,183,'液相色谱质谱系统',1,1,'user',1571414400,1571673599,'da','ss','reject'),(6,183,'液相色谱质谱系统',1,1,'user',1573401600,1573660799,'k','','notDo'),(7,183,'液相色谱质谱系统',1,1,'user',1572969600,1573055999,'df','','notDo');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'byHour','99'),(2,'byTimes','60'),(3,'byDay','66'),(5,'byHour','97');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `original_price` varchar(25) DEFAULT NULL,
  `firm_model` text,
  `parameter` text,
  `functional_use` text,
  `desc` varchar(30) DEFAULT NULL,
  `contacts` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `img_url` text,
  `owner` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'enable',
  `publisher_id` int(11) DEFAULT NULL,
  `price_value` varchar(45) DEFAULT NULL,
  `price_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (183,'液相色谱质谱系统','360万元','LTQ Orbitrap Discovery','离子原 ESI','用于小分子代谢物、蛋白、农药残留等的检测',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片6.png','刘看山','enable',1,'402','day'),(184,'核磁共振波谱仪','209.8万元','AVANCE III 400','⑴核磁操作频率(1H)：400 MHz ⑵磁场强度： 9.4 Tesla','可用于多肽和蛋白质在溶液中高次构造的解析',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片2.png','刘看山','enable',1,'100','day'),(185,'代谢组学成套设备','167.197万元','GCMS-QP2010E','400兆','可挥发物性有机化合物的检测',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(186,'透射电子显微镜','214.4万元','日本日立公司；H-7650','分辨率：0.2nm (晶格像)；加速电压：40kV ~ 120kV；放大倍率：连续放大模式：x200~x600,000；数码相机型号：Gatan MODEL 832，4K x 2.7K 1100万像素光纤耦合。','广泛应用于生物样品局部切面的超微结构和非生物材料和纳米材料的内部微观结构观察，可观察生命科学领域动植物细胞、病毒、细菌和支原体中的超微结构；对抗原和抗体在超微结构进行精细检测和定位；对植物各种疾病病因进行诊断与研究；观察高分子、表面活性剂、碳纳米管及纳米粒子等形态结构。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片4.png','刘看山','enable',1,NULL,NULL),(187,'扫描电子显微镜','88.86万元','捷克TESCAN公司；5136 SB','放大倍数：4~500,000 ×，二次电子像分辨率：3.5nm，背反射电子像分辨率：4nm ，配有低真空模式LVSTD检测器，可方便快捷地进行高真空扫描电镜模式与低真空扫描电镜模式之间转化，在高真空模式中开展对非导电性样品观察和元素分析，在低真空模式中进行含水和多孔样品观察和研究，得到真实高分辨率二次电子图像。','该电镜广泛应用于生物和物理材料表征特性观察，逐点扫描，获得三维立体图像，观察视野大，景深长，富有立体感。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片5.png','刘看山','enable',1,NULL,NULL),(188,'等温滴定微量热仪','109.68万元','iTC200','本仪器最小可检测热功率2 nW，最小可检测热效应0.125uJ，生物样品最小用量0.4ug，温度范围2 oC - 80 oC，滴定池体积1.43 ml)。','能够获得生物分子相互作用的完整热力学参数，包括结合常数、结合位点数、摩尔结合焓、摩尔结合熵、摩尔恒压热容，和动力学参数',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片6.png','刘看山','enable',1,'400','hour'),(189,'激光共聚焦显微镜','203万元','*_TCS SP5型','1.配备10×，20×，40×，63×高数值孔径物镜。2.覆盖可见光波长范围的激光器，各激光器单独分立。','实现宽均场视野、多通道和高灵敏度检测及生物成像，能够直接升级到超高分辨率的共聚焦。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片7.png','刘看山','enable',1,NULL,NULL),(190,'气质联用仪','88.9万元','AGILENT 5973N','质量数范围：1.6-1050amu，以0.1amu递增','用于在300℃时可挥发的有机物或经衍生后可挥发的有机物的定性、定量分析。例如：饱和烃、多环芳烃、有机酸、醇、醛、酯、酮、脂酯肪酸、挥发脂肪酸酯、芳香化合物、香精、香料、农药、生物碱、衍生糖、类固醇等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片8.png','刘看山','enable',1,NULL,NULL),(191,'液质联用仪','99.56万元','Watersuplc/SQD','uplc/SQD','主要应用于药物代谢及药物动力学研究、临床药理学研究、天然药物（中草药等）开发研究、新生儿筛选、蛋白与肽类的鉴定、残留分析、毒物分析、环境分析－公安、环保、食品、自来水、卫生防疫等行业。液质联用仪的灵敏度高，通量性能好——优异的高流量性能、降低的离子抑制效应、自清洁离子源探针设计和可靠的接口设计，加速了分析速度；使用更简便。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片9.png','刘看山','enable',1,NULL,NULL),(192,'电感耦合等离子发射光谱仪','94.94 万元','Thermo Fisher Scientific\n*_iCAP6000','线性范围宽，3-5个数量级。全谱直读能在短短的30s时间内完成一次多元素分析。','广泛应用于冶金、地质、采矿、石油、轻工、农业、医药、卫生、食品及环境监测等方面的常量及微痕量元素，特别是矿质元素分析。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片10.png','刘看山','enable',1,'1000','day'),(193,'原子吸收分光光度计','41.9万元','日立公司\n火焰/石墨炉_Z-5000','偏振塞曼扣背景，内装8个元素灯，自动调节灯位置，测定方法一次可设定12个元素的分析条件，石墨炉自动进样。','用于冶金、地质、采矿、石油、轻工、农业、医药、卫生、食品及环境监测等方面的常量及微痕量元素。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片11.png','刘看山','enable',1,'100','times'),(194,'全二维高通量分离纯化系统','269.63万元','德国Sepbox公司，Sepbox 2D-250','由一维分离柱、18根捕获柱和6根二维分离柱，蠕动泵、 UV及 ELSD检测器等组成。适合高通量极性、中等极性及非极性成分的分离和纯化。','植物材料中活性成分的高通量提取和纯化，典型馏分的数量达500种，馏分量0.25-2.5mg，纯度可用于结构解析和生物分析。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片12.png','刘看山','enable',1,'200','hour'),(195,'核磁共振谱仪','57','瑞士BRUKER公司，*_peri cam PSI','1.激光：EN60825-1 Class2，波长670nm，最大输出功率1mW，光束直径1mm；2. 扫描头尺寸：22cm×15cm×20cm；3.最大测量范围：约50cm×50cm；4.测量深度：0.5-1mm；5.分辨率：距监测对象25cm时，低、中、高和非常高分辨率步长依次为3mm、2mm、1mm和0.5mm.','1. 化合物定性定量分析； 2. 药物质量标准建立（方法学建立、方法验证）； 3. 可完成中国药典中规定使用液相色谱法进行的大部分测试项目。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片13.png','刘看山','enable',1,NULL,NULL),(196,'液质联用仪','166.4万元','美国THERMO，lcq-fleet','色谱分离，质谱鉴定','主要用于中药现代化研究，提取天然产物的定性和鉴定，药物代谢和机理研究、环境激素的研究等。',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(197,'高压液相色谱仪','57万元','美国waters公司，2695_waters alliance','1 四元梯度输液泵 工作模式：相互独立、电子控制的双柱塞直线驱动装置，双压力传感器反馈回路，无需混合器和阻尼器。2 进样器 2.1自动进样方式。2.2样品瓶数：120\n\n位，由5个样品盘组成。 3光电二极管阵列检测器 3.1波长扫描范围：190～800nm。3.2光源：全程氘灯。4蒸发光散射检测器。5色谱软件 支持多窗口、多任务的操作模式。','1. 化合物定性定量分析； 2. 药物质量标准建立； 3. 可完成中国药典中规定使用液相色谱法进行的大部分测试项目。\n',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(198,'微阵列芯片点样系统','125.5万元 ','博奥公司，晶芯','基因芯片自动点样','主要用于转录水平基因筛查的芯片制备，进行高通量基因探针点样工作',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(199,'液相色谱-串联质谱','110万元','安捷伦科技有限公司\nAglient 1200/6410B','自动进样、二元泵、电喷雾电离源','农药残留、兽药残留等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(200,'液相色谱','40万元','安捷伦科技有限公司，Aglient 1260','自动进样、二元泵、紫外、示差折光检测器','维生素、糖等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(201,'液相色谱','70万元','岛津公司\nLC-20','自动进样、二元泵、紫外、二极管阵列、荧光、蒸发光散射检测器','营养素等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(202,'半制备液相色谱','38万元','热电公司 AS3000','自动进样、二元泵、紫外检测器、自动馏分收集','毫克级分离制备',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(203,'气相色谱仪','38万元','安捷伦科技有限公司\nAglient 1200/6410B','150位自动进样，程序升温，FID、ECD检测器','添加剂、营养素等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(204,'气相色谱质谱仪','70万元','安捷伦科技有限公司\nAglient 7890A/5975C','自动液体或顶空进样，单四级质谱检测','脂肪酸、添加剂等',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(205,'气相色谱质谱仪','100万元','安捷伦科技有限公司，\nAglient7890A/7000C','150位自动进样，串四级质谱检测','食品污染物',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(206,'原子吸收光谱仪','30万元','普析通用 TAS-990','火焰、石墨炉检测','微量元素、重金属',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(207,'原子荧光光谱仪','12万元','北京吉天公司 AFS-9130','自动进样，氢化物发生原子荧光检测','砷、汞',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(208,'全自动定氮仪','20万元','福斯公司 KeeltecTM 8400','自动滴定','定氮',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(209,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量',NULL,'王宗义','13651226099','Wangzongyi001@sina.com\r','图片3.png','刘看山','enable',1,NULL,NULL),(210,'气相色谱仪','29.6万元','美国Agilent','保留时间重现性＜0.008%或＜0.0008min；峰面积重现性＜1%RSD','它除用于定量和定性分析外，还能测定样品在固定相上的分配系数、活度系数、分子量和比表面积等物理化学常数',NULL,'王宗义','13651226099','Wangzongyi001@sina.com','图片3.png','刘看山','enable',1,NULL,NULL),(211,'气相色谱仪','122万元','美国Agilent','保留时间重现性＜0.008%或＜0.0008min；峰面积重现性＜1%RSD','它除用于定量和定性分析外，还能测定样品在固定相上的分配系数、活度系数、分子量和比表面积等物理化学常数','ll','gg','hh','jj','屏幕快照 2018-07-07 下午3.07.47.png','kk','enable',1,NULL,NULL),(214,'dd','11','dd','ss','11','33','444','55','66','','22','enable',1,NULL,NULL),(215,'dss','111','122','33','33','55','66','66','66','','34','enable',1,'66','times');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mail` char(50) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `cname` char(50) DEFAULT NULL,
  `type` char(45) DEFAULT 'publisher',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'admin','88@qq.com','123','888888','管理员','publisher');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `phone` char(45) DEFAULT NULL,
  `mail` char(45) DEFAULT NULL,
  `cname` char(50) DEFAULT NULL,
  `type` char(45) DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user','18000011','666@qq.com',NULL,'user'),(2,'wangzongyi','123456',NULL,NULL,NULL,'user'),(3,'zhangsan','123456',NULL,NULL,NULL,'user'),(8,'lisi','123','123456','123@qq.com','李四','user'),(9,'admin','admin','101020','admin@buarsp.com','管理员','publisher'),(10,'dsaads','123','','','',''),(11,'ddssds','111','','','','user'),(12,'chengkj','111','','','','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11 11:22:52

/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : assistant

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 07/04/2022 00:35:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '$2a$10$4fyd55zuLSi/pw4LaoFHxe9H.MEZzQ/Elz/jnNGi9/fcsVz2JQb6i', NULL);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` int NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `department`(`department`) USING BTREE,
  CONSTRAINT `department` FOREIGN KEY (`department`) REFERENCES `project` (`department`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('doctor01', '$2a$10$hJLRWycQ1eBlTMhXnaX/A.5XfjJg2FaMnUT3h6kOVnblnHPUJU5ge', 'doctor01', 'department02', 'm', 1, 1, NULL);
INSERT INTO `doctor` VALUES ('doctor02', '$2a$10$A9z/E2g0lyvs73y20VsRgu6dCh8.F7DlI4UiOPacYcY.13agk6FTm', 'doctor02', 'department02', 'm', 2, 2, NULL);
INSERT INTO `doctor` VALUES ('doctor03', '$2a$10$2Uk8bAKhv9DkuoviZgawmOwKxCnLJHBOQbE6vhYWTecT4UbPrvtF6', 'doctor03', 'department01', 'm', 3, 3, NULL);
INSERT INTO `doctor` VALUES ('doctor04', '$2a$10$25N/H0OCf.yyXTXxCrZGe.ULj2nggxPVg1I.2GTPvcSKgzTaaQg0m', 'doctor04', 'department03', 'm', 4, 4, NULL);
INSERT INTO `doctor` VALUES ('doctor05', '$2a$10$b49sqi8R.3n6Uzc/uyp1fOQ1TmvEAt.cl6OOh7MQ4a8ziI2DFAAYC', 'doctor05', 'department01', 'm', 5, 5, NULL);
INSERT INTO `doctor` VALUES ('doctor06', '$2a$10$V5cPGfJOh.LV827E7sOYg.6VFXtV4MxmT5J5Nrrgm3G8.PAvSxNWW', 'doctor06', 'department01', 'm', 6, 6, NULL);
INSERT INTO `doctor` VALUES ('doctor07', '$2a$10$9knHCLCqKLzeEHs5aZsH8eCcYFFfyBFPDtSTLGHmL.QL4yP1bZS7G', 'doctor07', 'department03', 'm', 7, 7, NULL);
INSERT INTO `doctor` VALUES ('doctor08', '$2a$10$muSFGORr9Th7RrV8topF0uC0jumQBnkUK8pHFWHYjDpmW6bN0j5Cu', 'doctor08', 'department03', 'm', 8, 8, NULL);
INSERT INTO `doctor` VALUES ('doctor09', '$2a$10$HMCwiLbnNklPJbKpzmj9D.N5KI25OzlzQ1leQRCzNtBUQHlTQd9o.', 'doctor09', 'department03', 'm', 9, 9, NULL);
INSERT INTO `doctor` VALUES ('doctor10', '$2a$10$57/jfx45Po/9RVTdOQU2HO3YPHZk9MyHSo2vqOKAXxAYJKReoDJ5e', 'doctor10', 'department03', 'm', 10, 10, NULL);
INSERT INTO `doctor` VALUES ('doctor11', '$2a$10$D0yiDvzftFN.63mCsylYlurGimgd3s/d/5Ax92Nnrefob2D45rvoa', 'doctor11', 'department03', 'm', 11, 11, NULL);
INSERT INTO `doctor` VALUES ('doctor12', '$2a$10$epyqCM/8s/O6lhbM6Uv9i.0xHUldYrwz6.MhXv0GdxcI9JuU8V4XC', 'doctor12', 'department03', 'm', 12, 12, NULL);
INSERT INTO `doctor` VALUES ('doctor13', '$2a$10$YshTabib9vsxhoLtj2RAi.NRbcBYg4hwvlt.LO8AZUN5sPpKyE1xG', 'doctor13', 'department01', 'm', 13, 13, NULL);
INSERT INTO `doctor` VALUES ('doctor14', '$2a$10$3/twB/okwsUKsN0ZqcT42ebWWuNbE8S9ZR9oAg7sst4EoPmBprUUO', 'doctor14', 'department03', 'm', 14, 14, NULL);
INSERT INTO `doctor` VALUES ('doctor15', '$2a$10$rwQBpTFWGAKlPLBpZZpHluan5Xp6FA5iMd9ZOKRGkW29sBKzfbJEe', 'doctor15', 'department02', 'm', 15, 15, NULL);
INSERT INTO `doctor` VALUES ('doctor16', '$2a$10$0zAkojHLoF85eqAPbllmAONZOGKYzOPSbKiCC42IfK8eiZ7SvnKjS', 'doctor16', 'department01', 'm', 16, 16, NULL);
INSERT INTO `doctor` VALUES ('doctor17', '$2a$10$tD9dxbBVPhysfAN7z36vd.Q/wut7PyggK3SMexAeoShK5ieVFkS12', 'doctor17', 'department02', 'm', 17, 17, NULL);
INSERT INTO `doctor` VALUES ('doctor18', '$2a$10$uoQq7TVDXHRtV8D42cR4JOflBQOrv1.xQ2tipfPS1KeBFtsGQqlZa', 'doctor18', 'department01', 'm', 18, 18, NULL);
INSERT INTO `doctor` VALUES ('doctor19', '$2a$10$S4SXoFJbj2JqtavPjMOVq.nvvPZnmsAcIAMwPV8EcAo.muSfwE0Yy', 'doctor19', 'department01', 'm', 19, 19, NULL);
INSERT INTO `doctor` VALUES ('doctor20', '$2a$10$Hn2c7G5tnNLD4E1Lw7Xi3u7irMA6eh8O8OqTv89z2AgrS/da1K.uq', 'doctor20', 'department02', 'm', 20, 20, NULL);
INSERT INTO `doctor` VALUES ('doctor21', '$2a$10$aAvXD6VK9BGX6PhaH/oz6.GB5cXiepjEOjyntJSl.LIKyxJXWpIkC', 'doctor21', 'department03', 'm', 21, 21, NULL);
INSERT INTO `doctor` VALUES ('doctor22', '$2a$10$1mgynwu/1HUJKVKuD8hJJ.eo3rAD6AZ.KQV34ktZC24lQBvAuNykq', 'doctor22', 'department01', 'm', 22, 22, NULL);
INSERT INTO `doctor` VALUES ('doctor23', '$2a$10$lrEPpH8NR6rSYmKATkj76ufDPgKdeiBBbNgB7rSFXV3sDdH0IFYnS', 'doctor23', 'department03', 'm', 23, 23, NULL);
INSERT INTO `doctor` VALUES ('doctor24', '$2a$10$L/hRdvWNygD3HzN2BPdnU.N8db.btLanfrtAAdYEx8d3N.DGKVGTS', 'doctor24', 'department03', 'm', 24, 24, NULL);
INSERT INTO `doctor` VALUES ('doctor25', '$2a$10$uGnJYxr5Gxef.jpGy766fubc23LQbxmHtxjDfijDcp1hTtiIqTDTi', 'doctor25', 'department01', 'm', 25, 25, NULL);
INSERT INTO `doctor` VALUES ('doctor26', '$2a$10$NmdfdP1n8TwHg2cvpmhuNO1jSuk1jtdUPG6G/06qdKWler4wwyqRC', 'doctor26', 'department01', 'm', 26, 26, NULL);
INSERT INTO `doctor` VALUES ('doctor27', '$2a$10$jINNstIZOB8a599rwr8fHezjokR1E8d5PX.MJXvfjoJvlFZE2aTRy', 'doctor27', 'department01', 'm', 27, 27, NULL);
INSERT INTO `doctor` VALUES ('doctor28', '$2a$10$iF7f3WMyhkXmRFQiepxh8OKDzGR3fI81LaM5SOjKsVS6uKvXZcuf.', 'doctor28', 'department02', 'm', 28, 28, NULL);
INSERT INTO `doctor` VALUES ('doctor29', '$2a$10$F73ckfIKHCjcXikPKUy4y.eg2A5qxysbLGQjzxCevXacuvvzJ1VYG', 'doctor29', 'department02', 'm', 29, 29, NULL);
INSERT INTO `doctor` VALUES ('doctor30', '$2a$10$eLS5niuxIWdYMpS4ZJgg/.rDUMxw.B3158V/TjaqvbT5pbfKwnyIq', 'doctor30', 'department03', 'm', 30, 30, NULL);
INSERT INTO `doctor` VALUES ('doctor31', '$2a$10$3fFWoMrUzbC0vYp4lHZFd.PPSX6SFaaRiJvdi5kryjYJXpjn/aDZK', 'doctor31', 'department01', 'm', 31, 31, NULL);
INSERT INTO `doctor` VALUES ('doctor32', '$2a$10$vIc/QM83BtHePHIPcEKKo.UJLAsdhdcYs9iQru33LeTVGrxo5.lJi', 'doctor32', 'department02', 'm', 32, 32, NULL);
INSERT INTO `doctor` VALUES ('doctor33', '$2a$10$OawlyBclwBCf.a0rhRj1/O88R1tAVKqffZvETyIBK7jgtoy7yqoMG', 'doctor33', 'department03', 'm', 33, 33, NULL);
INSERT INTO `doctor` VALUES ('doctor34', '$2a$10$Dz.hoHXLlwBZekzGmfu05ebj7xMAFW.UJSPfTuv/1li1OFlJ8wEaO', 'doctor34', 'department03', 'm', 34, 34, NULL);
INSERT INTO `doctor` VALUES ('doctor35', '$2a$10$0cfd5e9ETNq0.2Ise1kZq.AdqDQurHoD2RwNNGtoL.Lug0H4vEVCa', 'doctor35', 'department01', 'm', 35, 35, NULL);
INSERT INTO `doctor` VALUES ('doctor36', '$2a$10$B3qedIJ4hESGRUT3DJSuxu47Ia56M72Q4WDZjJ2x/zCQMaI.wD04C', 'doctor36', 'department03', 'm', 36, 36, NULL);
INSERT INTO `doctor` VALUES ('doctor37', '$2a$10$JI29dNFX8s9lj3/uV60mZOVQy8cSmQbPEICwVsn/tvi6682Zk8sfe', 'doctor37', 'department01', 'm', 37, 37, NULL);
INSERT INTO `doctor` VALUES ('doctor38', '$2a$10$E0VDgzYXKzcPKCFQXd4qA.pLo9S9rXDgIc/kYLEHDcR3LDE1kVin2', 'doctor38', 'department03', 'm', 38, 38, NULL);
INSERT INTO `doctor` VALUES ('doctor39', '$2a$10$Qdv/5l9tHtqgXC94mGLM6.e.UZ2o/Ynqwua81kiwSmga5i0CCjXA.', 'doctor39', 'department02', 'm', 39, 39, NULL);
INSERT INTO `doctor` VALUES ('doctor40', '$2a$10$9b5g6e6ofFh4fGX9UldEvOllWr7w.1ICNOBtn4/KyOptvbsggDI3K', 'doctor40', 'department03', 'm', 40, 40, NULL);
INSERT INTO `doctor` VALUES ('doctor41', '$2a$10$5t0JxwUEwgr3qNphgZa10ef3U.qrWow0xlTEmvtp4gcHwABihBKtm', 'doctor41', 'department01', 'm', 41, 41, NULL);
INSERT INTO `doctor` VALUES ('doctor42', '$2a$10$e/AhSP0fiQAdbFGe8XFjR.zLrO7EBZsw1bJCoM./XX5jenn5HNLyW', 'doctor42', 'department02', 'm', 42, 42, NULL);
INSERT INTO `doctor` VALUES ('doctor43', '$2a$10$BAtOKxdR4SxxTlcM04aSCuqONh7QjNcD4XhhQHMzfpZIHnrGCuBB2', 'doctor43', 'department01', 'm', 43, 43, NULL);
INSERT INTO `doctor` VALUES ('doctor44', '$2a$10$UI9wK7MGnI8E2fGrR3usJOzO7SG.QG7IZJ/1EM/VYwj3pR7e7sgx.', 'doctor44', 'department01', 'm', 44, 44, NULL);
INSERT INTO `doctor` VALUES ('doctor45', '$2a$10$TN5lIbXeP/f6q7dVYZeOM.EnaraM8rcZmhubEYqLFpSrgugDAH4ze', 'doctor45', 'department02', 'm', 45, 45, NULL);
INSERT INTO `doctor` VALUES ('doctor46', '$2a$10$0eNTxqAQ3ejhsZuWprl5C.t/cp.lxWtgjjS6cN0AfY1prMsKf9Cm.', 'doctor46', 'department01', 'm', 46, 46, NULL);
INSERT INTO `doctor` VALUES ('doctor47', '$2a$10$3DyUQg5AEvTvp/iQpnnHL.8NpHlw1qsbdf8LKkZyCs1WZWD12MuAi', 'doctor47', 'department01', 'm', 47, 47, NULL);
INSERT INTO `doctor` VALUES ('doctor48', '$2a$10$JsIJs3uZlwboPhxTHfMIU.59Vz2LBk2A8CF1kggWv6eWk5nwBHiW6', 'doctor48', 'department03', 'm', 48, 48, NULL);
INSERT INTO `doctor` VALUES ('doctor49', '$2a$10$mocCwb5BG56Ffu1e3e.8BuGluMp/n6v/gYqUyeMFKd.6dMZBc5Zf6', 'doctor49', 'department01', 'm', 49, 49, NULL);
INSERT INTO `doctor` VALUES ('doctor50', '$2a$10$oqXXLxSNzHmSsSdM3BpHF.Yb2M9gevje8LOFQ7IaK6HUARQ6nS/.S', 'doctor50', 'department02', 'm', 50, 50, NULL);
INSERT INTO `doctor` VALUES ('doctor51', '$2a$10$M/9oHUElm3f46lqg3kr2IOb60GdbwqBsqIyy8Se3Cq2LzPWmHjCHW', 'doctor51', 'department03', 'm', 51, 51, NULL);
INSERT INTO `doctor` VALUES ('doctor52', '$2a$10$7XGlfpHtV01pbWqd.prj9.OGXTKdJXWfkudWutBs4ZSqwE1wcwJsK', 'doctor52', 'department01', 'm', 52, 52, NULL);
INSERT INTO `doctor` VALUES ('doctor53', '$2a$10$bFXVzGQkdO2MaT2qMH.dLOxT5Zn1V/am.ZwgDEnPA8e0BmkqZJp3a', 'doctor53', 'department02', 'm', 53, 53, NULL);
INSERT INTO `doctor` VALUES ('doctor54', '$2a$10$oiOPvnoIp1jqO/QwL61Qp.PYuX8L7jQSB6PCU5jxJ9GkYL/gPiW9C', 'doctor54', 'department01', 'm', 54, 54, NULL);
INSERT INTO `doctor` VALUES ('doctor55', '$2a$10$.zXJg45xAtOKLIQ0mphcK.6GPXP9wcck1l/m5WOFhujqIlNyCe54C', 'doctor55', 'department03', 'm', 55, 55, NULL);
INSERT INTO `doctor` VALUES ('doctor56', '$2a$10$wnKvvEvBkZtm.QoRCVQWuOgRBzSUuE53R6U3nF1/SvI0VYAkITM1m', 'doctor56', 'department02', 'm', 56, 56, NULL);
INSERT INTO `doctor` VALUES ('doctor57', '$2a$10$iZD8V7aj23Imua/Qo42hC.JxdYp1oNOtbUwKf6DwJEPHXaAKAI.Oa', 'doctor57', 'department03', 'm', 57, 57, NULL);
INSERT INTO `doctor` VALUES ('doctor58', '$2a$10$M7btYu8wh1Lh5nba0LSqNuk9P0.kYQ2I80MYjUAqt/82uCk2/Kbb2', 'doctor58', 'department03', 'm', 58, 58, NULL);
INSERT INTO `doctor` VALUES ('doctor59', '$2a$10$THP46yTK.v61FXjMDflYUOjFwuMI6RlW5Gm.CMak5fhAuFbUYd3FK', 'doctor59', 'department01', 'm', 59, 59, NULL);
INSERT INTO `doctor` VALUES ('doctor60', '$2a$10$XenTl6MvfXKOd04g.h/5MuqAZbDqpS7HY/lAx15bZB/mTgUE8lqIe', 'doctor60', 'department02', 'm', 60, 60, NULL);
INSERT INTO `doctor` VALUES ('doctor61', '$2a$10$ujMOowYAycOsWM3UOwmYpe67nvQj/xcRq1BNZ7qyB.WFRKvcLmENG', 'doctor61', 'department01', 'm', 61, 61, NULL);
INSERT INTO `doctor` VALUES ('doctor62', '$2a$10$WGoHucKsIkTsHS8FjVtEDub6SL4WgAZmadHDgFOkDY1AGAaVocE2y', 'doctor62', 'department01', 'm', 62, 62, NULL);
INSERT INTO `doctor` VALUES ('doctor63', '$2a$10$pMy7L3iQ81T5KgFTiZMEQ.u0QbVq7XqITupC7V6vIc8tQ7yjtYJOW', 'doctor63', 'department02', 'm', 63, 63, NULL);
INSERT INTO `doctor` VALUES ('doctor64', '$2a$10$VV5rsyDVlRw1iLsFwujNbOAgIKnRz.AVo9PsW.0ughjZ7xfnjSJUa', 'doctor64', 'department03', 'm', 64, 64, NULL);
INSERT INTO `doctor` VALUES ('doctor65', '$2a$10$cwdisJz1oPUQAiNfkPTr2.ECHm96vWU2s5ckG2tlxCO/oHcNQUYUK', 'doctor65', 'department02', 'm', 65, 65, NULL);
INSERT INTO `doctor` VALUES ('doctor66', '$2a$10$ViwyBQLbu6B3A1rbEU2LDu.9DNmc3XlqJ9ynWPaQ4Y7952efAKANy', 'doctor66', 'department01', 'm', 66, 66, NULL);
INSERT INTO `doctor` VALUES ('doctor67', '$2a$10$J2CjzpFAW/gg/kUo2rGiTeMyh.fZagQCTX9qmR1bAv4khkwQaytYm', 'doctor67', 'department03', 'm', 67, 67, NULL);
INSERT INTO `doctor` VALUES ('doctor68', '$2a$10$t4dddXSaFx0gjZ.8sVQG.OwmtdSCQev02gyocr0L0dP4inzyIMmwC', 'doctor68', 'department02', 'm', 68, 68, NULL);
INSERT INTO `doctor` VALUES ('doctor69', '$2a$10$3bOVnOj5.PHHMOxbQz3naufbyqe2fnZd6QMsSlbOkQkb0nVIc7Awi', 'doctor69', 'department02', 'm', 69, 69, NULL);
INSERT INTO `doctor` VALUES ('doctor70', '$2a$10$iEOeKr9FZaTcyrHNGg2/l.t0es6C90crxVD9EIeddJdooCQuivln2', 'doctor70', 'department02', 'm', 70, 70, NULL);
INSERT INTO `doctor` VALUES ('doctor71', '$2a$10$ov2XPP7cZ.prh62DevSyyuAKWaoeoy6AogPgwKPFYBdYVG4aqTTE6', 'doctor71', 'department03', 'm', 71, 71, NULL);
INSERT INTO `doctor` VALUES ('doctor72', '$2a$10$BeZmqk9cXtp7Mi9fn2vzmeSiXUO47ECe4EKMrqJBbHbAc.TK2zBd2', 'doctor72', 'department01', 'm', 72, 72, NULL);
INSERT INTO `doctor` VALUES ('doctor73', '$2a$10$EeNGjEo6TbZWL4f4ako6CO6G53IIXae3sm6FwbXBCgDVMGuxDYgl.', 'doctor73', 'department01', 'm', 73, 73, NULL);
INSERT INTO `doctor` VALUES ('doctor74', '$2a$10$0qeFVDemdxyNwPruxj8oWOgS6DWrMTAEqju1lN0tAx8zsTqIN5Y0.', 'doctor74', 'department02', 'm', 74, 74, NULL);
INSERT INTO `doctor` VALUES ('doctor75', '$2a$10$2001aDcqyHKRm6oZafVZ1uTTtqm2G4b59Zd48gVmVKHRbE.hrFHOa', 'doctor75', 'department01', 'm', 75, 75, NULL);
INSERT INTO `doctor` VALUES ('doctor76', '$2a$10$L.IF5pMUNhI7U7ikm6QPmOCfrkloYdyy3yWhcZ0VIF8ZiVLqBwh5u', 'doctor76', 'department03', 'm', 76, 76, NULL);
INSERT INTO `doctor` VALUES ('doctor77', '$2a$10$vIod8bTrJN.hOocXM0cOBug.FdNdE7NDb2jCr0xo4t4idKT5.n73K', 'doctor77', 'department03', 'm', 77, 77, NULL);
INSERT INTO `doctor` VALUES ('doctor78', '$2a$10$mpYs1BGi4NV/nQCni2ROKOKF5CxZZMu0odiSZlNg1IjwEkhnF2o7a', 'doctor78', 'department03', 'm', 78, 78, NULL);
INSERT INTO `doctor` VALUES ('doctor79', '$2a$10$0mt4/F8YfF.p5XR473w8OOv2TvjqfEelT0vzCGL5PfK7IlcOyO.TG', 'doctor79', 'department01', 'm', 79, 79, NULL);
INSERT INTO `doctor` VALUES ('doctor80', '$2a$10$l9a1plRoBVSobCHoUtgqyOsBmWEMeOAfkUUJ3cz/oARbIromOeH3m', 'doctor80', 'department01', 'm', 80, 80, NULL);
INSERT INTO `doctor` VALUES ('doctor81', '$2a$10$f01fhXHIDcK9lGCE2CkDQOE2ffdswEPu0N05QbpgGpEIbqx5AIIh2', 'doctor81', 'department03', 'm', 81, 81, NULL);
INSERT INTO `doctor` VALUES ('doctor82', '$2a$10$h3yec6NKog0bu.l0kljBV.5p4WfVer4Y5xRxHqlPw.cVAnRaN1vO2', 'doctor82', 'department03', 'm', 82, 82, NULL);
INSERT INTO `doctor` VALUES ('doctor83', '$2a$10$bOQqjJqTZtgdX54/raDvo.dqh3dp.Kt4vveifqnMcJIm8Z0RZz87q', 'doctor83', 'department01', 'm', 83, 83, NULL);
INSERT INTO `doctor` VALUES ('doctor84', '$2a$10$T3r7Os2UQGd9HGe8nurSf.bgwL6eqBdtc8exQLArfdiftkvPG.x2q', 'doctor84', 'department01', 'm', 84, 84, NULL);
INSERT INTO `doctor` VALUES ('doctor85', '$2a$10$ZBx6HdRo/5ySosGiSivJy.GawuwKMAPAQ8VCp8UXjr56d.31e9JX6', 'doctor85', 'department02', 'm', 85, 85, NULL);
INSERT INTO `doctor` VALUES ('doctor86', '$2a$10$6W6VnUZmLCyeipb2WZ46f.Mu1ybOTcKjPYptwFdFrdGEiAbVsIeXW', 'doctor86', 'department02', 'm', 86, 86, NULL);
INSERT INTO `doctor` VALUES ('doctor87', '$2a$10$z0PqrAVj.QLN6IjVUt5kVezPUt2tE9PlB0RapJxBu4TsFaas7mHjy', 'doctor87', 'department02', 'm', 87, 87, NULL);
INSERT INTO `doctor` VALUES ('doctor88', '$2a$10$O4czeEnf8xKuPd9x8UdAAOCkt/xCRyqJ4U2TsHmjR8952XlgV9o/W', 'doctor88', 'department01', 'm', 88, 88, NULL);
INSERT INTO `doctor` VALUES ('doctor89', '$2a$10$gpSJ7ijFJ1AE0NLoszA5derIkM5InfyJsJu.jWvmW7c42rOmRYW2i', 'doctor89', 'department02', 'm', 89, 89, NULL);
INSERT INTO `doctor` VALUES ('doctor90', '$2a$10$bq5VDtXBo5Ui1NAlXf0TQ.SKY9TJM0QK0kWg3Spm1pgIIFolWGGGu', 'doctor90', 'department03', 'm', 90, 90, NULL);
INSERT INTO `doctor` VALUES ('doctor91', '$2a$10$BIxlRc0D9AI/J6W8kDnscebHAGgZJfBFjnWawl12WL5t1g26cv8xq', 'doctor91', 'department03', 'm', 91, 91, NULL);
INSERT INTO `doctor` VALUES ('doctor92', '$2a$10$ZdSYZZqxXRFiiI1AwoJlg.zcSuUJei1Zw/4CQ10iJywfQ2CMpztfG', 'doctor92', 'department03', 'm', 92, 92, NULL);
INSERT INTO `doctor` VALUES ('doctor93', '$2a$10$QQeYgAlA39VyMKL.E3/GUOQ8aJ.xE6aw.8mfNdP.q14KFhzC2GnmW', 'doctor93', 'department01', 'm', 93, 93, NULL);
INSERT INTO `doctor` VALUES ('doctor94', '$2a$10$Oq2/8KkRy2GHcVPZ9uMwBuRQ76w3bhqZqwQzSkjvf3Bxx9AMB0lFK', 'doctor94', 'department01', 'm', 94, 94, NULL);
INSERT INTO `doctor` VALUES ('doctor95', '$2a$10$sYXHZqMzhUH3ifrEwBiMsOO5kbTDlSMNe18.VFos8Tzy5EeQHP0Su', 'doctor95', 'department01', 'm', 95, 95, NULL);
INSERT INTO `doctor` VALUES ('doctor96', '$2a$10$X9cd/ufvDrBg8Ec11XTlvO5Ux6FpOVT4TuuIypwm78anBLicduGfS', 'doctor96', 'department01', 'm', 96, 96, NULL);
INSERT INTO `doctor` VALUES ('doctor97', '$2a$10$ls/IpP4XmGWIyXhZ0Qm.0.8Zdq9N3TgJEKsYXgQ5rgt9vP8fGZLQi', 'doctor97', 'department03', 'm', 97, 97, NULL);
INSERT INTO `doctor` VALUES ('doctor98', '$2a$10$hGxaF31A7whs.JOZk4qO3e.0dZ7.jv8BTbCLu1Sk1gxhEyjgfHo4a', 'doctor98', 'department01', 'm', 98, 98, NULL);
INSERT INTO `doctor` VALUES ('doctor99', '$2a$10$w2jTskh0bdnLtsywILecneaEnSEBVnLLvlGKMRuEl/4dPazseiq3K', 'doctor99', 'department03', 'm', 99, 99, NULL);

-- ----------------------------
-- Table structure for mapnode
-- ----------------------------
DROP TABLE IF EXISTS `mapnode`;
CREATE TABLE `mapnode`  (
  `nodeId` int NOT NULL,
  `nodeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `nextNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stairNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `elevatorNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `elevatorId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nodeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mapnode
-- ----------------------------
INSERT INTO `mapnode` VALUES (0, NULL, 1, 567, 598, '10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10001, NULL, 1, 315, 230, '10014,10002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10002, NULL, 1, 441, 230, '10001,10003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10003, NULL, 1, 567, 230, '10002,10004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10004, NULL, 1, 693, 230, '10003,10005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10005, NULL, 1, 819, 230, '10004,10006', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10006, NULL, 1, 819, 322, '10005,10007,10015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10007, NULL, 1, 819, 414, '10006,10008,10016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10008, NULL, 1, 819, 506, '10007,10009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10009, NULL, 1, 693, 506, '10008,10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10010, NULL, 1, 567, 506, '10009,10011,0', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10011, NULL, 1, 441, 506, '10010,10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10012, NULL, 1, 315, 506, '10011,10013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10013, NULL, 1, 315, 414, '10012,10014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10014, NULL, 1, 315, 322, '10013,10001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (10015, NULL, 1, 945, 322, '10006', NULL, '20015,30015,40015,50015', '1', NULL);
INSERT INTO `mapnode` VALUES (10016, NULL, 1, 945, 414, '10007', '20016', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20001, NULL, 2, 315, 230, '20014,20002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20002, NULL, 2, 441, 230, '20001,20003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20003, NULL, 2, 567, 230, '20002,20004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20004, NULL, 2, 693, 230, '20003,20005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20005, NULL, 2, 819, 230, '20004,20006', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20006, NULL, 2, 819, 322, '20005,20007,20015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20007, NULL, 2, 819, 414, '20006,20008,20016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20008, NULL, 2, 819, 506, '20007,20009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20009, NULL, 2, 693, 506, '20008,20010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20010, NULL, 2, 567, 506, '20009,20011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20011, NULL, 2, 441, 506, '20010,20012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20012, NULL, 2, 315, 506, '20011,20013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20013, NULL, 2, 315, 414, '20012,20014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20014, NULL, 2, 315, 322, '20013,20001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (20015, NULL, 2, 945, 322, '20006', NULL, '10015,30015,40015,50015', '2', NULL);
INSERT INTO `mapnode` VALUES (20016, NULL, 2, 945, 414, '20007', '10016,30016', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30001, NULL, 3, 315, 230, '30014,30002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30002, NULL, 3, 441, 230, '30001,30003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30003, NULL, 3, 567, 230, '30002,30004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30004, NULL, 3, 693, 230, '30003,30005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30005, NULL, 3, 819, 230, '30004,30006', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30006, NULL, 3, 819, 322, '30005,30007,30015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30007, NULL, 3, 819, 414, '30006,30008,30016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30008, NULL, 3, 819, 506, '30007,30009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30009, NULL, 3, 693, 506, '30008,30010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30010, NULL, 3, 567, 506, '30009,30011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30011, NULL, 3, 441, 506, '30010,30012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30012, NULL, 3, 315, 506, '30011,30013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30013, NULL, 3, 315, 414, '30012,30014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30014, NULL, 3, 315, 322, '30013,30001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (30015, NULL, 3, 945, 322, '30006', NULL, '10015,20015,40015,50015', '3', NULL);
INSERT INTO `mapnode` VALUES (30016, NULL, 3, 945, 414, '30007', '20016,40016', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40001, NULL, 4, 315, 230, '40014,40002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40002, NULL, 4, 441, 230, '40001,40003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40003, NULL, 4, 567, 230, '40002,40004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40004, NULL, 4, 693, 230, '40003,40005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40005, NULL, 4, 819, 230, '40004,40006', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40006, NULL, 4, 819, 322, '40005,40007,40015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40007, NULL, 4, 819, 414, '40006,40008,40016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40008, NULL, 4, 819, 506, '40007,40009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40009, NULL, 4, 693, 506, '40008,40010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40010, NULL, 4, 567, 506, '40009,40011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40011, NULL, 4, 441, 506, '40010,40012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40012, NULL, 4, 315, 506, '40011,40013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40013, NULL, 4, 315, 414, '40012,40014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40014, NULL, 4, 315, 322, '40013,40001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (40015, NULL, 4, 945, 322, '40006', NULL, '10015,20015,30015,50015', '4', NULL);
INSERT INTO `mapnode` VALUES (40016, NULL, 4, 945, 414, '40007', '30016,50016', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50001, NULL, 5, 315, 230, '50014,50002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50002, NULL, 5, 441, 230, '50001,50003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50003, NULL, 5, 567, 230, '50002,50004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50004, NULL, 5, 693, 230, '50003,50005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50005, NULL, 5, 819, 230, '50004,50006', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50006, NULL, 5, 819, 322, '50005,50007,50015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50007, NULL, 5, 819, 414, '50006,50008,50016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50008, NULL, 5, 819, 506, '50007,50009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50009, NULL, 5, 693, 506, '50008,50010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50010, NULL, 5, 567, 506, '50009,50011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50011, NULL, 5, 441, 506, '50010,50012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50012, NULL, 5, 315, 506, '50011,50013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50013, NULL, 5, 315, 414, '50012,50014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50014, NULL, 5, 315, 322, '50013,50001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES (50015, NULL, 5, 945, 322, '50006', NULL, '10015,20015,30015,40015', '5', NULL);
INSERT INTO `mapnode` VALUES (50016, NULL, 5, 945, 414, '50007', '40016', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exception` int NOT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('patient01', '$2a$10$8cNAf9X1KjGvBdX1m2MyEOu97JU4DSvDRDzJ0WZqqdK3Y5.aEHhL2', 'patient01', 'm', 1, '1', 0, NULL);
INSERT INTO `patient` VALUES ('patient02', '$2a$10$Uteqa3.vOpFJZ9UxtQK.y./XrCx9Pe/e6VqqV/RcHClmnlIEh/ukC', 'patient02', 'm', 2, '2', 0, NULL);
INSERT INTO `patient` VALUES ('patient03', '$2a$10$MVc8vNa81Fw5eQDtPC6i8OWx8GXzYud4GvOjKLM29Y95eME/N9enu', 'patient03', 'f', 3, '3', 0, NULL);
INSERT INTO `patient` VALUES ('patient04', '$2a$10$/Xw4xIPee/vupBBEyw8oQemxYWPsREbm4wieVCG6dZoN7qbteKb5e', 'patient04', 'f', 4, '4', 0, NULL);
INSERT INTO `patient` VALUES ('patient05', '$2a$10$pt2GDtkARYjzYZENRbD26OFzyNO2PB0dbXWVp4DCTctHOIAHqtG6a', 'patient05', 'f', 5, '5', 0, NULL);
INSERT INTO `patient` VALUES ('patient06', '$2a$10$51B2gfOPghlonOmfuxqSZOorRDdRLL5FKJoxFC9z0P51uU6A7fPuy', 'patient06', 'm', 6, '6', 0, NULL);
INSERT INTO `patient` VALUES ('patient07', '$2a$10$rKL52vh93L8t7bP1s5OcROC1X8zYbA6yO8AW0C70dvYQ4QurZDtQW', 'patient07', 'm', 7, '7', 0, NULL);
INSERT INTO `patient` VALUES ('patient08', '$2a$10$Z0X383UUa1Khr5t8cFNwvO3ZzJ/ninv0Z2hDPJAviFAkkw8b09Y5K', 'patient08', 'f', 8, '8', 0, NULL);
INSERT INTO `patient` VALUES ('patient09', '$2a$10$cie4H5alN1NPbXx625jEteIIy73u5OQHRJcX4UlF.NTa.QFlixKGu', 'patient09', 'f', 9, '9', 0, NULL);
INSERT INTO `patient` VALUES ('patient10', '$2a$10$cQ48ivkW9uB5XN.ga0y7P.oi5POL7PTMfrQG9q979kN.VuZEOzP6.', 'patient10', 'f', 10, '10', 0, NULL);
INSERT INTO `patient` VALUES ('patient11', '$2a$10$G4Y0I.NRrD.3Ee5viG5hKOVSzoh22oyFz7lYPlmMbb1I6gvRL0TrO', 'patient11', 'm', 11, '11', 0, NULL);
INSERT INTO `patient` VALUES ('patient12', '$2a$10$K1AXEDtSxUHwVbNglkIa8uu5I30lvIHNEyI.nuRCOGGghXP9DqUTC', 'patient12', 'm', 12, '12', 0, NULL);
INSERT INTO `patient` VALUES ('patient13', '$2a$10$/IMmtWM3Kqw0a.nwFEiZm.hOffmmj5UUbyyZGTPVXlT1JpH0c8EA2', 'patient13', 'f', 13, '13', 0, NULL);
INSERT INTO `patient` VALUES ('patient14', '$2a$10$bF6ApLXK43rxts7RzgbKZ.0upZUkAuVX0tuRRu2.0449JtQJgpte6', 'patient14', 'f', 14, '14', 0, NULL);
INSERT INTO `patient` VALUES ('patient15', '$2a$10$7N.SjQ03c4H23XqtAtosjeGX4ndHyY7KXOobc3GBqV6VHyEVUgHri', 'patient15', 'f', 15, '15', 0, NULL);
INSERT INTO `patient` VALUES ('patient16', '$2a$10$wUEMKdOTr/CjNTQ/IpyhVu6JQHFyzInr.o4ph/v/IZGK7bkMNNByC', 'patient16', 'f', 16, '16', 0, NULL);
INSERT INTO `patient` VALUES ('patient17', '$2a$10$mMcHxe1Wn2t0o225uDORXube3Ctmh1mPjhA7nSlE6l5OVLiUWZTHi', 'patient17', 'm', 17, '17', 0, NULL);
INSERT INTO `patient` VALUES ('patient18', '$2a$10$k9rppe1FR8EAlCYuV63aKu/Yt.MJkQss/BW06tN8dfjVhjEMKE13m', 'patient18', 'f', 18, '18', 0, NULL);
INSERT INTO `patient` VALUES ('patient19', '$2a$10$8wrZkcLKxHrnApIo6mGeyu2FcccbEcEZFw./HtHFVE2xVYm/hrA8C', 'patient19', 'm', 19, '19', 0, NULL);
INSERT INTO `patient` VALUES ('patient20', '$2a$10$un9FhQi/gprTtQAcQonm2eVwR5NLy/00cBTBMaZSHcfw6gXT0KqL2', 'patient20', 'm', 20, '20', 0, NULL);
INSERT INTO `patient` VALUES ('patient21', '$2a$10$GGDFWFCbZRcpH5i0vUkCzO/mHC0OJ0mQI2ml4OXImb9j.j5rybUGO', 'patient21', 'm', 21, '21', 0, NULL);
INSERT INTO `patient` VALUES ('patient22', '$2a$10$8ZhILieOicI9gDWzA0.gpeTzudZdIDyVP8BZOehsd3.T1gfxT.giS', 'patient22', 'm', 22, '22', 0, NULL);
INSERT INTO `patient` VALUES ('patient23', '$2a$10$WrOiOZoGwvCJYdzAjVa/3uU7I7gAS7kUwCZTpyCKvpzvnIf2/xKs.', 'patient23', 'm', 23, '23', 0, NULL);
INSERT INTO `patient` VALUES ('patient24', '$2a$10$rCVcbhD73ZpJkfbbYFjfh.3FaxX8hkI8gbhyhmWCAIod4KGxvr.AS', 'patient24', 'm', 24, '24', 0, NULL);
INSERT INTO `patient` VALUES ('patient25', '$2a$10$r3GN4ChNS3dum5gtxhm8qul7KJpsaHxS9vReyULkKmlcHCrGtMFny', 'patient25', 'f', 25, '25', 0, NULL);
INSERT INTO `patient` VALUES ('patient26', '$2a$10$DxSGZZVQ6Ija/8bhng.9AuUQqSDo2fQGRL3ggNgBVAY1FdgfWBE.e', 'patient26', 'm', 26, '26', 0, NULL);
INSERT INTO `patient` VALUES ('patient27', '$2a$10$j4LqdqJNcZgpMBJUnKGvauvDParznqDsd1Q8dEYm/p5JkPx5EfSVa', 'patient27', 'f', 27, '27', 0, NULL);
INSERT INTO `patient` VALUES ('patient28', '$2a$10$FvWgTY7JfdDwuEKl0oi5ve/VHZTLEnNXX/KYzyqbNt6tmbDxGDUFG', 'patient28', 'm', 28, '28', 0, NULL);
INSERT INTO `patient` VALUES ('patient29', '$2a$10$JpXGSGnRvIOJ7PDo.Zut2exMkOn65ymIZ8k4e51eYviwNvTPiS7eO', 'patient29', 'f', 29, '29', 0, NULL);
INSERT INTO `patient` VALUES ('patient30', '$2a$10$kML.18Xy3lqYUaYy45joheEb/VP7nZDbOL0QDe08G0UhPet4YvtT2', 'patient30', 'm', 30, '30', 0, NULL);
INSERT INTO `patient` VALUES ('patient31', '$2a$10$INFuewPtXECX3c88ax4PNev.TIMtQXDIwIgmI/fRMzKwkWjyUxmAq', 'patient31', 'm', 31, '31', 0, NULL);
INSERT INTO `patient` VALUES ('patient32', '$2a$10$Ryu46QdHOviQJTByUdf1E.3tC.6dDKKGJwndFaXWSLyG/hxSBS/ui', 'patient32', 'f', 32, '32', 0, NULL);
INSERT INTO `patient` VALUES ('patient33', '$2a$10$US9i9x1Gbgstuu8JLVTQhuuWkJHCUszxo6B3nLcdMvsJxUD2FaXlm', 'patient33', 'm', 33, '33', 0, NULL);
INSERT INTO `patient` VALUES ('patient34', '$2a$10$NETseLx6MqUh8vXpjp88Y.1bIeYbCs7szva2eeCGhG9uYqaOusPyi', 'patient34', 'f', 34, '34', 0, NULL);
INSERT INTO `patient` VALUES ('patient35', '$2a$10$T4NpYmV9DcB6M0ScSMSwre3RY.w/lfw4/HDUYDdUfVCefNPhJoLmu', 'patient35', 'f', 35, '35', 0, NULL);
INSERT INTO `patient` VALUES ('patient36', '$2a$10$C.g0DviFQnuvGZ0Tv6DZseDg8e4bz/bCpCv1CbW/kcb/4YvDKgRg6', 'patient36', 'f', 36, '36', 0, NULL);
INSERT INTO `patient` VALUES ('patient37', '$2a$10$AFnEmhkRdZGrMHrYIad1UezQ7tCfeJ9m3dXoc.malAdTSAa/mwyx.', 'patient37', 'f', 37, '37', 0, NULL);
INSERT INTO `patient` VALUES ('patient38', '$2a$10$b4W9cyUE.Rxw9JAnnE5nb.ZfENfnyuZQMmTuR54c7jagK87HGEQSC', 'patient38', 'f', 38, '38', 0, NULL);
INSERT INTO `patient` VALUES ('patient39', '$2a$10$3mB1LRVzu79Vsemmb2GoD.0ELtkKbKQZXVVfWSUfsZqxtjA8YX0zi', 'patient39', 'f', 39, '39', 0, NULL);
INSERT INTO `patient` VALUES ('patient40', '$2a$10$NatJcuOeVzzMT2HwY/M1xuxbt1HMXJmLUnGez32imVSjIWBXLipUW', 'patient40', 'm', 40, '40', 0, NULL);
INSERT INTO `patient` VALUES ('patient41', '$2a$10$Ph2SpXdw7EOmR2LUSXsRIuc5ukfSw0Hs6IZLbpH7t3SjrBdZ/jd4K', 'patient41', 'f', 41, '41', 0, NULL);
INSERT INTO `patient` VALUES ('patient42', '$2a$10$IjE3bcKQPDN4Y1T3umHwKOOy1JotpKdK4qXsb/dpkdQsfuJSjisie', 'patient42', 'f', 42, '42', 0, NULL);
INSERT INTO `patient` VALUES ('patient43', '$2a$10$cC2UDYcoNNGDJFybqyxyKuLZCKk1ihmZ7eWS67a/x3VZ2UwXSTKr.', 'patient43', 'm', 43, '43', 0, NULL);
INSERT INTO `patient` VALUES ('patient44', '$2a$10$I4FpnRKImmB0yDHhysGCJut2A7GkawkOwqHFrZ4Zqs7brQ4uavqLW', 'patient44', 'm', 44, '44', 0, NULL);
INSERT INTO `patient` VALUES ('patient45', '$2a$10$BcckqIdJOLAr4RvDW1sYx.hKPdm0RMP4wfn2T9gp.Oy1HKnFOeV2y', 'patient45', 'f', 45, '45', 0, NULL);
INSERT INTO `patient` VALUES ('patient46', '$2a$10$ouGNpCR1GOhGQTyTOy1O3.PwL4my5sClOrjxt1TlM01vf2dPngF7u', 'patient46', 'f', 46, '46', 0, NULL);
INSERT INTO `patient` VALUES ('patient47', '$2a$10$thYPJR7yhU7PV50845pIw.5PwSsvRtYGZNu08DxRgrMB68DkvKXhu', 'patient47', 'm', 47, '47', 0, NULL);
INSERT INTO `patient` VALUES ('patient48', '$2a$10$GqnKk.Qcf6DAmibcOZ1CkOEVT0WCSULBGZGqGwZZn6M3gDGGbmVDa', 'patient48', 'f', 48, '48', 0, NULL);
INSERT INTO `patient` VALUES ('patient49', '$2a$10$VSJP7rav97x.uPGWh4T8WuJ.bfsNDYCrDyOyynz9MZuINbgU22XCS', 'patient49', 'm', 49, '49', 0, NULL);
INSERT INTO `patient` VALUES ('patient50', '$2a$10$I2DL9Xy128UKSvnuoxvioO5eQfuheuvFMsG4RjjXfZQhRF8zeZ812', 'patient50', 'f', 50, '50', 0, NULL);
INSERT INTO `patient` VALUES ('patient51', '$2a$10$3/Fo5MDYVVcstRu4Cfs7M.wlQLWgaQDv7BfyM4nCBSnksIt3v5g6u', 'patient51', 'f', 51, '51', 0, NULL);
INSERT INTO `patient` VALUES ('patient52', '$2a$10$httAI1NSMld34yuhD/drAeBG0n2BGgrkkdjPPdGVE4MbXFnphEbMG', 'patient52', 'm', 52, '52', 0, NULL);
INSERT INTO `patient` VALUES ('patient53', '$2a$10$g4Ej8Vo33brLc/0vqLZ3iOhtn.QGSkZc/tekUIXpK.bK0QijeG5gu', 'patient53', 'm', 53, '53', 0, NULL);
INSERT INTO `patient` VALUES ('patient54', '$2a$10$Kyc.fbREHx3OgbiPKP0odO8KdC4W6w7d4vIbnaeTG5cQoWsq1u8zC', 'patient54', 'm', 54, '54', 0, NULL);
INSERT INTO `patient` VALUES ('patient55', '$2a$10$nVXbtGZqwjo6kuUKGq4Jku5b2GUBceDZsmaOtAE6bLL7fIBBxTujC', 'patient55', 'm', 55, '55', 0, NULL);
INSERT INTO `patient` VALUES ('patient56', '$2a$10$.70Z/OLv0aCQxGNe/JPMmusg.EnxFu4rS9sPyz1XYEqSoel/TzTCC', 'patient56', 'm', 56, '56', 0, NULL);
INSERT INTO `patient` VALUES ('patient57', '$2a$10$00hv.j.fdxf6RZDaHaWj8OA85SWZAE/31282gyaeiHoT/2pFT09Jy', 'patient57', 'f', 57, '57', 0, NULL);
INSERT INTO `patient` VALUES ('patient58', '$2a$10$cuT8BjYME06XE5oPrpdaB.RWak3qA3MNkEzflmOjcwxKLDug1Km4O', 'patient58', 'f', 58, '58', 0, NULL);
INSERT INTO `patient` VALUES ('patient59', '$2a$10$EYqcpxuTPJoywxl1sMsmb.pMwYIxNhZI1wf1/tt2mINV06Qr3po42', 'patient59', 'm', 59, '59', 0, NULL);
INSERT INTO `patient` VALUES ('patient60', '$2a$10$uWHwDHeL4Iokd3fR/K/54eDvJRzKVKvkbsL7ll1MqJtTy3M1EFMu6', 'patient60', 'm', 60, '60', 0, NULL);
INSERT INTO `patient` VALUES ('patient61', '$2a$10$WFaq44cXaAaQsE6O7JBRp.FiQgmspNamTIfGsWZuGlS9qkU44gP4G', 'patient61', 'f', 61, '61', 0, NULL);
INSERT INTO `patient` VALUES ('patient62', '$2a$10$jl5d6YOyT7fGYVQHd6Jpje/iAsTRnofZOHiTAHb2hC1n1eZykfd9a', 'patient62', 'f', 62, '62', 0, NULL);
INSERT INTO `patient` VALUES ('patient63', '$2a$10$uWxQtz/FQzs/9iAuPRCo3.jZVTNODdlL6xjGGUyINQLzK5mLFzZzC', 'patient63', 'f', 63, '63', 0, NULL);
INSERT INTO `patient` VALUES ('patient64', '$2a$10$KMHO4qa4Wmkfx9wQwLQ11ebtI1LrxwythGnpJyl86Ex.IAzQupIP2', 'patient64', 'm', 64, '64', 0, NULL);
INSERT INTO `patient` VALUES ('patient65', '$2a$10$YxKMIri14exJCLKTwoAVhO9zf0aEWJiy1jR5wv2LQ7z.3y4J9/IbO', 'patient65', 'f', 65, '65', 0, NULL);
INSERT INTO `patient` VALUES ('patient66', '$2a$10$hLpnyuM8Zo5qgaAs5w4g8eMPztDxkhWg8GwqYPlimgFEZ4lGNxluW', 'patient66', 'm', 66, '66', 0, NULL);
INSERT INTO `patient` VALUES ('patient67', '$2a$10$6TKdxZibIhwdxwmE95WNAul8ZehspCQrUF14wRuCZs6SHhatNY6xq', 'patient67', 'f', 67, '67', 0, NULL);
INSERT INTO `patient` VALUES ('patient68', '$2a$10$BmoS4R6gp5GSbC0gpY7r1.V7ftGLB5vT5SWeJ2Sn/sVGZtcaTvUFm', 'patient68', 'm', 68, '68', 0, NULL);
INSERT INTO `patient` VALUES ('patient69', '$2a$10$HUJxFq/Lhbu.Or8HSoyGAO.aXmAfEo0lO8IHgiOlVHiStBYWjZ21y', 'patient69', 'm', 69, '69', 0, NULL);
INSERT INTO `patient` VALUES ('patient70', '$2a$10$x7Exl5SXmwX39n1jINu07eiB/HIRdM.nNSc7zLHm78epX9ivDo4ZW', 'patient70', 'm', 70, '70', 0, NULL);
INSERT INTO `patient` VALUES ('patient71', '$2a$10$E4N802IruHU9AkIRHLV3Ke2DWBFcAok.57S9wmABHanQ./NKhl3n6', 'patient71', 'f', 71, '71', 0, NULL);
INSERT INTO `patient` VALUES ('patient72', '$2a$10$FaTwOti.tiKmVavLYCPHG.VNOeRYbIi/eXTFX7LOI4GNuhMTlqxXS', 'patient72', 'm', 72, '72', 0, NULL);
INSERT INTO `patient` VALUES ('patient73', '$2a$10$lhZEMYYO4wG.YPO.9wdTcOoZ1K3SOqSKE.RkyWqjN1/Bg3b81jziu', 'patient73', 'f', 73, '73', 0, NULL);
INSERT INTO `patient` VALUES ('patient74', '$2a$10$3yrMWtKXDJ/xQOsJE/RlJejgCxEhmqzJM6bDXLNrk3Mjh7ynvUyiS', 'patient74', 'm', 74, '74', 0, NULL);
INSERT INTO `patient` VALUES ('patient75', '$2a$10$gtzrdQNF0EuXwnXHlfODq.SZ4GICc8NSJsaa9UgmcMLh5/pa2J0km', 'patient75', 'm', 75, '75', 0, NULL);
INSERT INTO `patient` VALUES ('patient76', '$2a$10$J7cR1nAFBc8WxKNHb6uRQ.oqyMZzNke3q9TS9b03Mq49L/sM2b3Mu', 'patient76', 'f', 76, '76', 0, NULL);
INSERT INTO `patient` VALUES ('patient77', '$2a$10$ISylyggTYZ5K9yLTHwuz1.dJ8ZWEiYlklCDDNkfJKvENjggqUA7Ti', 'patient77', 'm', 77, '77', 0, NULL);
INSERT INTO `patient` VALUES ('patient78', '$2a$10$D4VIt0e0qHEjaWC8oU8mB.JATlxkCCxX39161ALxamb2Qczt9YnMO', 'patient78', 'f', 78, '78', 0, NULL);
INSERT INTO `patient` VALUES ('patient79', '$2a$10$HUlISfU9Q5Cq1Kbj7DR/fuOr83F.YqvNmQBa4fG.5g/ZY.EQvcwCi', 'patient79', 'm', 79, '79', 0, NULL);
INSERT INTO `patient` VALUES ('patient80', '$2a$10$7H8MJXRVj0Ocu9FYo4lJ4uZuNA5ceShEzFGLiPTft4mf1Mp9k9DHS', 'patient80', 'f', 80, '80', 0, NULL);
INSERT INTO `patient` VALUES ('patient81', '$2a$10$EOKhcoWRAj2WuCw6U6b1yej0SspxUsTTwLn2Wwe3a82oppm1NuWre', 'patient81', 'f', 81, '81', 0, NULL);
INSERT INTO `patient` VALUES ('patient82', '$2a$10$gY7NZcj6HqDrDO49YkVWcegY.AXXBw27rC6T46hH39CKfixIlCPPa', 'patient82', 'm', 82, '82', 0, NULL);
INSERT INTO `patient` VALUES ('patient83', '$2a$10$8P96qqlQ1.Z9yrDmvFvFvu0CFWRty4ouA0LQRGehKjRfG2etALyum', 'patient83', 'f', 83, '83', 0, NULL);
INSERT INTO `patient` VALUES ('patient84', '$2a$10$7seat7.CmisdriSWAyIXHuD61xavIGj1F2BoxBn2pVhGGWnGka4jC', 'patient84', 'm', 84, '84', 0, NULL);
INSERT INTO `patient` VALUES ('patient85', '$2a$10$vw6GGSIR7hM4TpjTpyJY5Oe..1DY8uXtl6NECXG6u9s9Rch2i9Lba', 'patient85', 'f', 85, '85', 0, NULL);
INSERT INTO `patient` VALUES ('patient86', '$2a$10$lnCliMApMg7bCKlfMbNixuA33R8i5l3hSbC4fa4HAv0/2EChovbRa', 'patient86', 'm', 86, '86', 0, NULL);
INSERT INTO `patient` VALUES ('patient87', '$2a$10$zBQd8PlSENozaLlC9reeTO7emzUOCHJJ4m4Aq8u8WKQEW6UPdzKrO', 'patient87', 'f', 87, '87', 0, NULL);
INSERT INTO `patient` VALUES ('patient88', '$2a$10$ZnH/VvGZi0.4/xiLIfhoEO0U221cR7ETa10k5HSqYQE.jSHjZwK.6', 'patient88', 'm', 88, '88', 0, NULL);
INSERT INTO `patient` VALUES ('patient89', '$2a$10$ZCbxijgmqkLNpTALiz3ceeJoHjtGWk2Rs.0d8wVLuWfDOcQHrFex.', 'patient89', 'f', 89, '89', 0, NULL);
INSERT INTO `patient` VALUES ('patient90', '$2a$10$wWYpCuwqwLuCw7.N0rQx2.uZ8Z/eGw0H75g72SGn/WVNpXkTHy27G', 'patient90', 'f', 90, '90', 0, NULL);
INSERT INTO `patient` VALUES ('patient91', '$2a$10$b.U5t09t6hRZJubxrvyOJum7ELH7hnIFbIMSlbsqvkR.HN5.IJMKC', 'patient91', 'f', 91, '91', 0, NULL);
INSERT INTO `patient` VALUES ('patient92', '$2a$10$kQ1QYNc1dkiNla4afmk4VO8NuefMH/ddCrSowrXMYOtl6OpAhbcpi', 'patient92', 'f', 92, '92', 0, NULL);
INSERT INTO `patient` VALUES ('patient93', '$2a$10$u9uUkQzGBWxR0aEriSgxPufqAcEehWMwcZTe6cqqkLQXz40cAArn.', 'patient93', 'm', 93, '93', 0, NULL);
INSERT INTO `patient` VALUES ('patient94', '$2a$10$Yvh.KB.t/R7JaWxeXsdIGufM9A9zFp40En4Ay4DvUWVnYZ/KST84e', 'patient94', 'm', 94, '94', 0, NULL);
INSERT INTO `patient` VALUES ('patient95', '$2a$10$TPDOJexwWWxpXO50s0XPM.tBXw0yw/U5FrMC9gRwQpxshP3R4QsQ2', 'patient95', 'm', 95, '95', 0, NULL);
INSERT INTO `patient` VALUES ('patient96', '$2a$10$eMt5Y6ITXzMxRtkiXUVdBeq4sTeKQWVoSgjmPm7Rm3CqCBztIhO5.', 'patient96', 'f', 96, '96', 0, NULL);
INSERT INTO `patient` VALUES ('patient97', '$2a$10$y1NEazfeq9ckKOU5BXq6iu5LLppM0ZDgsu9pfaQMXQcQJTMLY8x.e', 'patient97', 'm', 97, '97', 0, NULL);
INSERT INTO `patient` VALUES ('patient98', '$2a$10$PDzKRh42tJdxrmqhnyy4Ru4ufr1DOBPZRQyqykleAr1VyA2.gifbK', 'patient98', 'f', 98, '98', 0, NULL);
INSERT INTO `patient` VALUES ('patient99', '$2a$10$ndK7s.bq9Eo4/OQMRs8miewVmoivL.Z2nfJtquq7CuEcCssLuLfK.', 'patient99', 'm', 99, '99', 0, NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aveTime` int NOT NULL,
  `nodeId` int NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`project`, `department`) USING BTREE,
  INDEX `nodeId`(`nodeId`) USING BTREE,
  INDEX `department`(`department`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  CONSTRAINT `nodeId` FOREIGN KEY (`nodeId`) REFERENCES `mapnode` (`nodeId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('project1', 'department01', 180000, NULL, NULL);
INSERT INTO `project` VALUES ('project2', 'department02', 240000, NULL, NULL);
INSERT INTO `project` VALUES ('project3', 'department03', 300000, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

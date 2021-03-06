<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.info.Content"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Content content = new Content();
	try {
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "SELECT `title`,`content`,`lastModifyTime` FROM `tbl_cms_contents` WHERE id=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		rs = ps.executeQuery();
		if (rs.next()) {

			content.setTitle(rs.getString("title"));
			content.setContent(rs.getString("content"));
			content.setLastModifyTime(rs.getLong("lastModifyTime"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>预览</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="">
<meta Charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- PM提取meta start -->


<!-- PM提取meta end -->

<link rel="dns-prefetch" href="http://res.nie.netease.com">
<!--[if lt IE 9]>
    <script src="http://res.nie.netease.com/comm/html5/html5shiv.js"></script>
    <![endif]-->

<!-- /* 统一应用文章页公共样式 */ -->
<link rel="stylesheet" href="../js-css/content/art.com.css">
<!-- 引用本页css -->
<!-- jquery mix NIE (最新版本）-->
<script charset="utf-8" src="../js-css/content/jquery(mixNIE).last.js"></script>
<!--lib中的文件，自动合并为一个文件-->

<link type="text/css" rel="stylesheet"
	href="../js-css/content/newDetail_79f84a9.css">
<script defer="true" charset="utf-8" src=""></script>
<style type="text/css">
#NIE-copyRight a {
	text-decoration: none;
}

#NIE-copyRight a:hover {
	text-decoration: underline;
}
</style>
<style type="text/css">
.adbase-ctn {
	background:
		url(http://res.nie.netease.com/comm/js/nie/util/img/loading.png)
		center center no-repeat;
}
</style>
<style type="text/css">
#NIE-topBar .hide, #NIE-topBar-include .hide {
	display: none !important
}

.NIE-topBar-logo, .NIE-topBar-arrIcon i, #NIE-topBar-menu span,
	.NIE-topBar-hot, .NIE-topBar-1st, .NIE-topBar-new, .NIE-topBar-btn {
	background:
		url(http://res.nie.netease.com/comm/nie.topBar/images/sprite-w_7fc7459.png)
		no-repeat
}

.NIE-topBar-arrIcon {
	position: relative;
	top: 4px;
	width: 16px;
	height: 16px;
	display: inline-block;
	background-color: #fff;
	overflow: hidden
}

.NIE-topBar-arrIcon i {
	width: 9px;
	height: 4px;
	float: left;
	margin: 6px 0 0 4px;
	background-position: -103px -101px;
	display: inline-block;
	-webkit-transition: all .2s ease 0s;
	transition: all .2s ease 0s
}

#NIE-topBar, #NIE-topBar-include {
	position: relative;
	z-index: 9999;
	min-width: 1000px;
	height: 40px;
	background: #333;
	line-height: 24px;
	font-family: "Microsoft YaHei", simSun, "Lucida Grande",
		"Lucida Sans Unicode", Arial
}

#NIE-topBar *, #NIE-topBar-include * {
	font-size: 12px;
	font-style: normal
}

#NIE-topBar a, #NIE-topBar-include a {
	color: #999;
	text-decoration: none
}

#NIE-topBar a:hover, #NIE-topBar-include a:hover {
	color: #fff
}

#NIE-topBar ul, #NIE-topBar li, #NIE-topBar-include ul,
	#NIE-topBar-include li {
	margin: 0;
	padding: 0;
	float: left
}

.NIE-topBar-main {
	position: relative;
	z-index: 9999;
	width: 1000px;
	margin: auto
}

.NIE-topBar-logo {
	width: 133px;
	height: 44px;
	display: block;
	float: left;
	margin-top: 6px;
	background:
		url(http://res.nie.netease.com/comm/nie.topBar/images/logo_b5525b7.png)
		no-repeat
}

#NIE-topBar-news {
	position: absolute;
	z-index: 13;
	width: 420px;
	height: 54px;
	left: 125px;
	padding-left: 18px;
	padding-top: 0;
	overflow: hidden;
	display: block
}

#NIE-topBar-news.NIE-topBar-news-hover {
	height: 250px;
	overflow: visible;
	border-color: #1f1f1f
}

#NIE-topBar-news a {
	width: 960px;
	display: block;
	height: 0;
	overflow: hidden;
	z-index: 1;
	-webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, .2);
	-o-box-shadow: 0 2px 4px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 2px 4px rgba(0, 0, 0, .2);
	box-shadow: 0 2px 4px rgba(0, 0, 0, .2)
}

#NIE-topBar-news-close {
	position: absolute;
	top: 63px;
	right: -380px;
	display: block;
	width: 32px;
	height: 32px;
	overflow: hidden;
	background:
		url(http://res.nie.netease.com/comm/nie.topBar/images/sprite-w_7fc7459.png)
		no-repeat -9999px -9999px;
	text-indent: -9999px;
	z-index: 2
}

#NIE-topBar-news.NIE-topBar-news-hover .NIE-topBar-abc-s {
	visibility: hidden
}

#NIE-topBar-news.NIE-topBar-news-hover a {
	position: absolute;
	z-index: 2;
	left: -132px;
	top: 55px;
	height: auto
}

#NIE-topBar-news.NIE-topBar-news-hover a img {
	display: block
}

.NIE-topBar-mid {
	position: absolute;
	z-index: 2;
	right: 230px;
	width: 385px;
	text-align: right
}

#NIE-topBar .NIE-topBar-mid a, #NIE-topBar-include .NIE-topBar-mid a {
	line-height: 40px;
	padding: 0 12px;
	color: #fff;
	display: inline-block
}

#NIE-topBar .NIE-topBar-mid a:hover, #NIE-topBar-include .NIE-topBar-mid a:hover
	{
	color: #ca0b0b
}

#NIE-topBar-menu {
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	color: #999;
	width: 1000px;
	height: 40px;
	overflow: hidden;
	-webkit-transition: height .3s ease 0s;
	-o-transition: height .3s ease 0s;
	-moz-transition: height .3s ease 0s;
	transition: height .3s ease 0s
}

#NIE-topBar-menu span {
	position: absolute;
	width: 108px;
	padding: 8px 0 12px;
	height: 20px;
	line-height: 14px;
	right: 106px;
	background-position: 0 -28px;
	background-repeat: repeat-x;
	padding-left: 15px;
	color: #fff;
	display: inline-block;
	overflow: hidden
}

#NIE-topBar-menu .NIE-table {
	position: absolute;
	top: 40px;
	left: 0;
	background: #262626;
	border-collapse: collapse;
	overflow: hidden;
	width: 100%
}

#NIE-topBar-menu .NIE-table a {
	width: 100px;
	margin-left: 6px;
	line-height: 24px;
	display: inline-block
}

#NIE-topBar-menu .NIE-table a.long {
	width: 125px
}

#NIE-topBar-menu .NIE-table ul {
	list-style: none
}

#NIE-topBar-menu .NIE-table .NIE-nav {
	width: 100%;
	position: relative
}

#NIE-topBar-menu .NIE-table .NIE-nav li {
	width: 110px;
	float: left;
	border-right: 1px solid #eee;
	vertical-align: top
}

#NIE-topBar-menu .NIE-table .NIE-nav .mobi {
	position: absolute;
	left: 387px;
	-webkit-transition: all .3s ease-out
}

#NIE-topBar-menu .NIE-table b {
	line-height: 39px;
	color: #bc2e2e;
	display: block;
	width: 100%;
	height: 39px;
	font-size: 14px;
	text-indent: 20px;
	background: #f7f7f8;
	overflow: hidden;
	clear: both
}

#NIE-topBar-menu b i {
	margin-left: 5px;
	padding: 2px 4px;
	color: #9b9b9b;
	font-style: normal;
	background: #111;
	display: inline
}

#NIE-topBar-menu .NIE-list {
	float: left;
	overflow: hidden;
	width: 100%;
	height: 400px
}

.w1680 #NIE-topBar-menu .NIE-list {
	height: 450px
}

#NIE-topBar-menu .NIE-list li {
	border-right: 1px solid #eee;
	height: 100%;
	float: left;
	padding: 10px 0 0 14px
}

#NIE-topBar-menu .NIE-list .news {
	position: absolute;
	background: #fdfefe;
	left: 545px;
	-webkit-transition: all .3s ease-out;
	top: 39px
}

#NIE-topBar-menu .NIE-list .hot {
	position: absolute;
	background: #fdfefe;
	left: 387px;
	-webkit-transition: all .3s ease-out;
	top: 39px
}

#NIE-topBar-menu .NIE-list .hot a {
	width: 125px
}

.w1680 #NIE-topBar-menu .NIE-list .news div div {
	margin-right: 8px
}

#NIE-topBar-menu .NIE-list .news .long-news {
	width: 133px;
	float: left
}

#NIE-topBar-menu .NIE-list .news .long-news a {
	width: 125px
}

#NIE-topBar-menu .NIE-list .news .short-news {
	float: left;
	width: 106px
}

#NIE-topBar-menu .moreAni .NIE-list .news {
	left: 313px;
	width: 524px !important;
	-webkit-transition: all .3s ease-out
}

#NIE-topBar-menu .moreAni .NIE-list .hot {
	left: 155px;
	border-left: 1px solid #eee;
	box-shadow: -1px 0 1px #eee;
	-webkit-transition: all .3s ease-out
}

#NIE-topBar-menu .moreAni .NIE-nav .mobi {
	left: 155px;
	width: 696px !important;
	border-left: 1px solid #eee;
	box-shadow: -1px 0 1px #eee;
	-webkit-transition: all .3s ease-out
}

#NIE-topBar-menu .NIE-list .NIE-topBar-more {
	width: 20px;
	height: 95px;
	height: 92px\9;
	display: block;
	position: absolute;
	right: 0;
	top: 124px;
	font-size: 12px;
	color: #fff;
	background: #bc2e2e;
	padding-left: 10px;
	line-height: 14px;
	padding-top: 7px;
	border-top-left-radius: 2px;
	border-bottom-left-radius: 2px
}

#NIE-topBar-menu .NIE-list .NIE-topBar-more:hover {
	opacity: .8
}

#NIE-topBar-menu .moreAni .NIE-topBar-more {
	width: 21px;
	height: 23px;
	border-radius: 2px;
	right: 9px;
	top: 163px;
	padding-left: 4px;
	padding-top: 2px;
	height: 20px;
	height: 18px\9
}

.w1680 #NIE-topBar-menu .NIE-list .NIE-topBar-more {
	display: none
}

#NIE-topBar-menu .NIE-table a em {
	font-weight: 400;
	display: block;
	line-height: 24px
}

.NIE-topBar-1st {
	background-position: right -267px
}

.NIE-topBar-hot {
	background-position: right -144px
}

.NIE-topBar-new {
	background-position: right -206px
}

#NIE-topBar-menu.NIE-topBar-menu-hover .NIE-table {
	display: block
}

#NIE-topBar-menu.NIE-topBar-menu-hover {
	height: 505px;
	opacity: .9;
	-webkit-transition: height .4s ease 0s;
	-o-transition: height .4s ease 0s;
	-moz-transition: height .4s ease 0s;
	transition: height .4s ease 0s
}

a.NIE-topBar-btn {
	width: 105px !important;
	height: 18px;
	line-height: 18px !important;
	margin: 5px 0;
	display: inline-block;
	padding-left: 0 !important;
	background-position: 0 -338px;
	text-indent: 25px;
	color: #bc3030 !important
}

a.NIE-topBar-btn:hover {
	
}

.NIE-topBar-ad {
	height: 40px;
	left: 50%
}

.NIE-topBar-main.w1680 {
	width: 1260px
}

.NIE-topBar-main.w1680 #NIE-topBar-menu {
	width: 1260px
}

#NIE-topBar-news {
	height: 54px
}

#NIE-topBar .NIE-topBar-menu-hover, #NIE-topBar-include .NIE-topBar-menu-hover
	{
	z-index: 8
}

.NIE-topBar-ad-big {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
	height: 0;
	overflow: hidden;
	text-align: center
}

#NIE-topBar-menu {
	z-index: 7;
	height: 55px
}

.NIE-topBar-mid {
	z-index: 12;
	width: 250px;
	right: 230px;
	width: 536px
}

.NIE-topBar-logo {
	position: relative;
	z-index: 13 !important
}

#NIE-topBar, #NIE-topBar-include {
	height: 55px;
	background: #fbfbfb
}

.NIE-topBar-logo {
	margin-top: 5px
}

#NIE-topBar-menu .NIE-table {
	top: 55px;
	background: #fdfefe;
	border-top: 1px solid #ececec;
	margin: 0
}

#NIE-topBar-menu span {
	background: 0 0;
	color: #bc2e2e
}

#NIE-topBar-menu .NIE-table {
	display: none
}

#NIE-topBar-menu .NIE-table .last_td, #NIE-topBar-menu .NIE-table .last_th
	{
	border-right: 0
}

#NIE-topBar a, #NIE-topBar-include a {
	color: #626262
}

#NIE-topBar-menu b i {
	background-color: #fbfbfb;
	color: #bc2e2e
}

#NIE-topBar-menu p {
	padding: 0;
	margin: 0;
	margin-left: 6px;
	line-height: 24px;
	margin-bottom: 4px;
	font-weight: 700;
	color: #626262
}

#NIE-topBar a:hover, #NIE-topBar-include a:hover {
	color: #bc2e2e
}

#NIE-topBar-menu.NIE-topBar-menu-hover {
	opacity: .95
}

#NIE-topBar-menu .NIE-table * {
	font-size: 12px
}

#NIE-topBar-menu.NIE-topBar-menu-hover span {
	border-bottom: 3px solid #bc2e2e;
	background-color: #F3F3F3;
	background-image: -webkit-linear-gradient(top, #F3F3F3 0, #FEFEFE 52px);
	background-image: linear-gradient(top, #F3F3F3 0, #FEFEFE 52px)
}

#NIE-topBar-menu span {
	height: 25px;
	height: 26px\0;
	width: 108px;
	padding-top: 15px;
	padding-top: 14px\0;
	transition: background ease-in-out .33s;
	z-index: 20
}

#NIE-topBar .NIE-topBar-mid a, #NIE-topBar-include .NIE-topBar-mid a {
	color: #333;
	line-height: 52px;
	transition: background ease-in-out .33s;
	*line-height: 55px
}

#NIE-topBar .NIE-topBar-mid a:hover, #NIE-topBar-include .NIE-topBar-mid a:hover
	{
	color: #bc2e2e !important;
	border-bottom: 3px solid #bc2e2e;
	background-color: #F3F3F3;
	background-image: -webkit-linear-gradient(top, #F3F3F3 0, #FEFEFE 52px);
	background-image: linear-gradient(top, #F3F3F3 0, #FEFEFE 52px);
	*border-bottom: 0
}

.NIE-topBar-right {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 100px;
	height: 55px;
	overflow: hidden;
	z-index: 9
}

.NIE-topBar-right a {
	color: #333 !important;
	width: 100%;
	text-align: center;
	display: inline-block;
	float: left;
	line-height: 52px;
	transition: background ease-in-out .33s;
	-webkit-transition: background ease-in-out .33s
}

.NIE-topBar-right a:hover {
	color: #bc2e2e !important;
	border-bottom: 3px solid #bc2e2e;
	background-color: #F3F3F3;
	background-image: -webkit-linear-gradient(top, #F3F3F3 0, #FEFEFE 52px);
	background-image: linear-gradient(top, #F3F3F3 0, #FEFEFE 52px);
	*border-bottom: 0
}

.NIE-topBar-right a.fadeUp {
	opacity: 0;
	-webkit-transform: translate3d(0, -70%, 0);
	-webkit-transition: all ease-in-out .5s;
	transform: translate3d(0, -70%, 0);
	transition: all ease-in-out .5s
}

.NIE-topBar-right a.none {
	opacity: 0;
	-webkit-transform: translate3d(0, 70%, 0);
	transform: translate3d(0, 70%, 0)
}

.NIE-topBar-right a.fadeUp2 {
	opacity: 1;
	-webkit-transform: translate3d(0, 0, 0);
	-webkit-transition: all ease-in-out .5s;
	transform: translate3d(0, 0, 0);
	transition: all ease-in-out .5s
}

#news {
	background: url("../img/content/2_2.png");
}

#news:hover {
	background: url("../img/content/2_1.png");
}

#material {
	background: url("../img/content/3_2.png");
}

#material:hover {
	background: url("../img/content/3_1.png");
}

#forum {
	background: url("../img/content/4_2.png");
}

#forum:hover {
	background: url("../img/content/4_1.png");
}

#home {
	background: url("../img/content/1_2.png");
}

#home:hover {
	background: url("../img/content/1_1.png");
}

.nav {
	width: 100%;
	height: 81px;
	background: url(../img/content/bg_Navigator.png) no-repeat center 0
}

.menu li {
	width: 163px;
	height: 81px;
	float: left;
	margin: 5px 13px;
}

.menu a {
	display: block;
	width: 163px;
	height: 81px;
	text-indent: 100px;
	white-space: nowrap;
	overflow: hidden;
}

.menu, .menu li {
	padding: 0;
	margin: 0px;
}

.menu {
	width: 1300px;
	-margin: 0;
	list-style-type: none;
	-float: right;
	margin-left: 39%
}

.test-top {
	height: 55px;
	background: #FBFBFB none repeat scroll 0% 0%;
}

#NIE-topBar *, #NIE-topBar-include * {
	font-size: 12px;
	font-style: normal;
}

.test-top-main {
	position: relative;
	z-index: 9999;
	width: 1165px;
	margin: auto;
}

.test-top-logo {
	width: 158px;
	height: 64px;
	display: block;
	float: left;
	margin-top: 7px;
	margin-left: 0%;
	background: transparent url(../img/content/top_corp.png) no-repeat
		scroll 0% 0%;
}

.test-topBar-mid {
	z-index: 12;
	right: 230px;
	width: 536px;
	position: absolute;
	text-align: right;
	-font-size: 12px;
	font-style: normal;
	line-height: 52px;
	-color: #333;
	-transition: background 0.33s ease-in-out 0s;
}

.test-topBar-mid a {
	line-height: 52px;
	color: #333;
	transition: background 0.33s ease-in-out 0s;
	display: inline-block;
	padding: 0px 12px;
	text-decoration: none;
}

.test-foot {
	font-size: 12px;
	text-decoration: none;
	color: #A0A0A0;
	padding: 35px 0px 60px;
}

body {
	color: rgb(248, 244, 245);
}

body {
	width: 100%;
	min-height: 1305px !important;
	font-family: "微软雅黑";
	color: #737C86;
	background-color: #2C0524 !important
}

* {
	margin: 0px;
	padding: 0px;
}
</style>
</head>


<body>

	<!--[if lt IE 7]>
    <div style="position:absoulute;left:0;top:0;width:100%;height:50px;background:rgb(255,255,233);color:rgb(30,84,148);border-bottom:1px solid rgb(230,230,198);text-align:center;line-height:50px;font-size:12px;">您使用的浏览器版本过低，可能会影响到您浏览本网页，建议您升级您的浏览器。</div>
    <![endif]-->




	<!-- 新闻详情 start -->
	<div class="nav">
		<div class="test-top-main" id="NIE-topBar-main">
			<a class="test-top-logo" href="#"></a>
		</div>
		<ul class="menu">
			<li><a id="home"></a></li>
			<li><a id="news"></a></li>
			<li><a id="material"></a></li>
			<li><a id="forum"></a></li>
		</ul>
	</div>
	<!--This is Git Project-->
	<div class="wrap"
		style="background: transparent url(../img/content/bg_1.jpg) no-repeat scroll center 0px;">
		<div class="right-wrap">
			<div class="content-wrap" style="margin-left: 0%;">
				<div class="content_title" style="background: url(../img/content/title_bg.png) no-repeat;">
					<div style="background: url(../img/content/title.png) no-repeat;" class="title"></div>
					<span>当前位置：官网首页&gt; 新闻中心</span>
				</div>
				<div id="NIE-art">
					<!-- <h1 class="artTitle">神魔战歌攻略： 如何完美通关英灵试炼40层</h1> -->
					<h1 class="artTitle"><%=content.getTitle()%></h1>
					<!-- <span class="artDate">2015-11-13</span> -->
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String timeStr = sdf.format(content.getLastModifyTime());
					%>
					<span class="artDate"><%=timeStr%></span>
					<div class="artText">
						<%=content.getContent()%>
					</div>
				</div>
				<!-- 分享 start -->
				<div id="NIE-share" class="jltx-share"></div>
				<!-- 分享 end   -->
				<div class=""
					style="background: transparent url(../img/content/top.png) no-repeat scroll 0% 0%; width: 43px; height: 133px; right: 9%; top: 62%; position: fixed;">
					<a href="#" style="width: 43px; height: 133px; display: block;"></a>
				</div>
				<!--此乃底部-->
			</div>
			<div id="" style="background-color: black;" class="test-foot">
				<p id="NIE-copyRight-corp"
					style="width: 100%; text-align: center; margin: 0 auto; padding: 15px 0 0 0; font-size: 12px; font-family: &amp; #39; 宋体 &amp;#39;; line-height: 20px; display: block; position: relative;">
					<span
						style="position: relative; vertical-align: top; top: 4px; display: inline-block; position: relative;">
						<a style="width: 224px; height: 28px; padding-right: 15px; display: inline-block; cursor: pointer; background: url(../img/content/corp.png) no-repeat"></a>
					</span> <span
						style="text-align: left; display: inline-block; padding-left: 6px;">
						<span id="ncp-l1"> <a style="color: #A0A0A0;">相关法律</a> - <a
							style="color: #A0A0A0;">翔通游戏</a> - <a style="color: #A0A0A0;">联系我们</a>
							- <a style="color: #A0A0A0;">商务合作</a>
					</span> <br> <span id="ncp-l2">翔通游戏 创造精彩世界</span>
					</span>
				</p>
			</div>
		</div>
	</div>
	<!-- 新闻详情 end -->
</body>
</html>
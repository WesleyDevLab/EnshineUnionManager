﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsManager.aspx.cs" Inherits="EnshineUnionManager.GoodsManager" %>

<%@ Register Src="~/MenuList.ascx" TagPrefix="uc1" TagName="MenuList" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<!--<![endif]-->
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<meta name="description" content="" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta name="author" content="" />
	<!-- Bootstrap Stylesheet -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" media="screen" />
	<!-- Uniform Stylesheet -->
	<link rel="stylesheet" href="plugins/uniform/css/uniform.default.css" />
	<!-- Main Layout Stylesheet -->
	<link rel="stylesheet" href="assets/css/fonts/icomoon/style.css" media="screen" />
	<link rel="stylesheet" href="assets/css/main-style.css" media="screen" />

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
	<title>益生联盟数据平台 Web Client Search Platform </title>
</head>
<body>
	<form id="form1" runat="server">


		<div id="wrapper">
			<header id="header" class="navbar navbar-inverse">
				<div class="navbar-inner">
					<div class="container">
						<div class="brand-wrap pull-left">
							<div class="brand-img">
								<a class="brand" href="#">管理后台
								</a>
							</div>
						</div>

						<div id="header-right" class="clearfix">

							<div id="dropdown-lists">
								<a class="item" href="#">
									<span class="item-icon"><i class="icon-exclamation-sign"></i></span>
									<span id="spClientName" runat="server"></span>

								</a>

							</div>

							<div id="header-functions" class="pull-right">
								<div id="user-info" class="clearfix">
									今天是： <span id="spNowTime" runat="server"></span>
								</div>
								<div id="logout-ribbon">
									<a href="javascript:LoginOut('UserLogin','');"><i class="icon-off"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>

			<div id="content-wrap">
				<div id="content">
					<div id="content-outer">
						<div id="content-inner">
							<uc1:MenuList runat="server" ID="MenuList" />

							<section id="main" class="clearfix">
								<div id="main-header" class="page-header">
									<ul class="breadcrumb">
										<li>
											<i class="icon-home"></i>益生联盟数据平台 Home
                                        <span class="divider">&raquo;</span>
										</li>
										<li>
											<a href="#">益生联盟数据平台 Web Client Search</a>
										</li>
									</ul>
									<div class="widget-box">
										<h1>
											<i class="icon-zoom-in"></i>商品列表查询 <span>This is the place where Search started</span>
										</h1>
										<br />
										<div class="widget-content nopadding">
											<table class="table table-bordered table-striped" style="width: auto; margin: 0 auto">

												<tbody>
													<tr class="odd gradeX">

														<td>商品名称：</td>
														<td>
															<input id="txtGoodsInfo" runat="server" width="200" class="text-info" type="text" /></td>
														<td>商品分类：</td>
														<td class="auto-style1">
															<asp:DropDownList ID="drpGoodsSort" runat="server"></asp:DropDownList>
														</td>
													</tr>
													<tr class="odd gradeC">
														<td>商品状态：</td>
														<td>
															<asp:DropDownList ID="drpGoodStatus" runat="server">
																<asp:ListItem Value="商品状态">商品状态</asp:ListItem>
																<asp:ListItem Value="Y">上架商品</asp:ListItem>
																<asp:ListItem Value="N">下架商品</asp:ListItem>
															</asp:DropDownList>
														</td>

														<td>商品条码：</td>
														<td class="auto-style1">
															<input id="txtGoodSku" runat="server" width="200" class="text-info" type="text" /></td>
													</tr>
													<tr>
														<td colspan="4">
															<input type="button" class="btn btn-info" id="btnSearch" value="查询" />
															<input type="button" class="btn btn-info" id="btnResrtSearch" runat="server"
																style="width: 80px; height: 30px;" value="清除" />
															<span style="color: red">（友情提示：可选择多条件进行查询。）</span> </td>

													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<h1>
										<i class="icon-list"></i>商品信息一览 <span>This is the place where Search Result started</span>
									</h1>
								</div>
								<!--库存余量查询数据一览内容-->
								<div id="main-content">
									<div class="tab-content">
										<!--分页-->
										<div id="showPage" style="width: 650px; margin: 0 auto; display: none" class="pages">
											<div style="float: left">
												<a id="first" class="pages">首页</a>
												<a id="prev" class="pages">上页</a>
												<a id="next" class="pages">下页</a>
												<a id="last" class="pages">尾页</a>
												跳转到第<input type="text" id="txtGoPage" style="width: 45px; height: 15px; border: 1px solid" />
												页
											</div>
											<div style="margin: 0; float: left">
												&nbsp;<input type="button" class="pages btn btn-info" id="go" value="跳转" />
												&nbsp; 共<span id="SumCount"></span> 条数据，每页<span id="ItemCount"></span> 条，
												 当前<span id="Index"></span>/<span id="PageCount"></span>页
											</div>
										</div>
										<!--我的产品档案一览-->
										<div id="live" class="tab-pane active">
											<div class='row-fluid'>
												<div class='span12 widget'>
													<div class='widget-header'>
														<span class='title'>
															<i class='icol-blog'></i>商品信息管理
														</span>
														<div style='float: right; padding-top: 4px; padding-right: 4px;'>
															<input type='button' class='btn  btn-primary' value='新商品添加'
																onclick="window.location.href = 'GoodsAdd.aspx?mid=<%=Request["mid"]%>&type=<%=Request["type"]%>	'" />
														</div>
													</div>
													<div class='widget-content summary-list'>
														<div class='row-fluid' style='padding-top: 2px;'>
															<div class='span12 section divScrool'>
																<table class='table table-bordered table-striped'>
																	<thead>
																		<tr>
																			<th>编辑</th>
																			<th>普通/推荐商品</th>
                                                                            <th>上下架商品</th>
																			<th>商品标题</th>
																			<th>商品分类</th>
																			<th>商品条码</th>
																			<th>商品价格</th>
																			<th>商品成本价格</th>
																			<th>商品库存数量</th>
																			<th>商品内容</th>
																			<th>商品图片</th>
																			
																			<th>是否首页</th>
																			<th>特价促销商品</th>
																<%--			<th>积分兑换商品</th>--%>
																			<th>到期时间</th>
																			<th>添加时间</th>
																		</tr>
																	</thead>
																	<tbody id="divShowGoodsManager">
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>

			<footer id="footer">
				<div class="footer-left">益生联盟数据平台  Web Client Search </div>
				<div class="footer-right">
					<p>Copyright 2016©正益移动科技有限公司. All Rights Reserved.</p>
				</div>
			</footer>

		</div>

		<!-- Core Scripts -->
		<script src="assets/js/jquery-1.8.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>

		<!-- Template Script -->
		<script src="assets/js/template.js"></script>

		<!-- Uniform Script -->
		<script src="plugins/uniform/jquery.uniform.min.js"></script>


		<link href="plugins/msgbox/jquery.msgbox.css" rel="stylesheet" />
		<script src="plugins/msgbox/jquery.msgbox.min.js"></script>
		<script src="assets/js/SeachCommon.js"></script>

		<p id="back-to-top">
			<a href="#top" title="返回顶部">
				<img src="assets/images/top_arrow.png" style="border: 0;" /></a>
		</p>
	</form>

</body>
</html>

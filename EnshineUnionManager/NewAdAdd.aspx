﻿<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="NewAdAdd.aspx.cs" Inherits="EnshineUnionManager.NewAdAdd" %>
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
	 <link href="assets/css/jquery.datetimepicker.css" rel="stylesheet" />
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
		<script charset="utf-8" type="text/javascript" src="../kindeditor/kindeditor.js"></script>
	  <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
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
								<a class="brand" href="#">
									 管理后台
								</a>
							</div>
						</div>

						<div id="header-right" class="clearfix"  >

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

										<!--查询条件-->
									<div class="widget-box">
										<h1>
											<i class="icon-zoom-in"></i>广告信息添加 <span>This is the place where Search started</span>
										</h1>
										<br />
														<div id="live" class="tab-pane active">
											 <div class='row-fluid'>
												  <div class='span12 widget'>
													   <div class='widget-header'>
															<span class='title'>
																 <i class='icol-blog'></i>广告信息管理
															</span>
																						  <div style='float: right; padding-top: 4px; padding-right: 4px;'> 
																		   <input type='button' class='btn  btn-primary'  value='广告列表管理' 
																						onclick="window.location.href = 'AdManager.aspx?mid=<%=Request["mid"]%>'" />  
                       </div>
													   </div>
													  						<div class="widget-content nopadding">
											<table class="table table-bordered table-striped">
												<tbody>
													<tr class="odd gradeX">
																	<td  style="width:150px;">广告标题：</td>
														<td colspan="3" style="text-align:left"   >	
																			<input id="txtTitle" runat="server"  class="span8" type="text" />
														 </td>
													</tr>
                                                   	<tr class="odd gradeX">
																	<td  style="width:150px;">广告厂商：</td>
														<td  style="text-align:left"   >	
																			<input id="txtCompany" runat="server"  class="span3" type="text" />
														 </td>
																																																									<td>是否首页显示 ：</td>
															<td>
																		<asp:DropDownList ID="drpSetIndex" Width="200" runat="server">
																			<asp:ListItem Value="-是否首页显示-"></asp:ListItem>
																			<asp:ListItem Value="Y">是</asp:ListItem>
																			<asp:ListItem Value="N">否</asp:ListItem>
																		</asp:DropDownList></td>
													</tr>				
													 
                                                   	<tr class="odd gradeX">
																	<td  style="width:150px;">商品编码;</td>
														<td  style="text-align:left"   >	
																			<input id="txtGoodsCode" runat="server"  class="span3" type="text" /></td>
															<td>&nbsp;</td>
															<td>
																		&nbsp;</td>
													</tr>				
													 
													<tr class="odd gradeC">							<td> 广告内容：</td>
														<td colspan="3" style="text-align:left"   >							 
														<textarea id="txtFckContent" runat="server" style="width: 670px; height: 100px;"></textarea>
															</td>
													</tr>
									 
											<tr class="odd gradeC">
																<td style="width:85px">广告图片：</td>
														<td   style="text-align:left"   >	
																	<input type="file"  runat="server"  style=" height:26px; width: 220px;" onchange="PhotoType();"
																 id="fUpLoad" />
																<input type="hidden" id="HFurl" runat="server" /> 		 
															<asp:Button ID="iUpLoad"  CssClass="btn btn-info" Text="上传" runat="server" OnClick="iUpLoad_Click"/>					
															<br /><strong>允许上传广告图片格式:GIF、JPG、JPEG、BMP<br />
											&nbsp;单张广告图片上传不能超过4096KB(4M)</strong>		<br />	 <br />	 
														<span style="color:red;font-weight:bold">友情提示：	</span>									 <br />
															<strong>第一步：先点击浏览选择要上传的案例图片，然后点击上传按钮进行上传。<br />	 上传成功会出现提示，右边则显示出上传的广告图片。<br />
											<br />
											第二部：然后进行添加信息。最后点击确定，则上传广告图片和信息添加成功。</strong>
														</td>
														<td  >预览广告图片:</td>
									   <td><img  id="iShowPhoto" src="~/assets/images/nophoto.gif"
													 runat="server"  style="width:197px;height:197px;" /></td>
									   
													</tr>
																		<tr class="even gradeX" >  

													<td colspan="4">
										
															<asp:Button ID="btnAddAd"  Width="80"  CssClass="btn btn-info" Text="添加" runat="server" OnClick="btnAddAd_Click" />					

														 &nbsp;&nbsp;&nbsp;			
														<asp:HiddenField ID="hfDel" runat="server" />
															<asp:Button ID="btnUpdateAd" Width="80"   CssClass="btn btn-info" Text="修改" runat="server" OnClick="btnUpdateAd_Click" />					
																			 &nbsp;&nbsp;&nbsp;	
														<input type="button" class="btn btn-info" id="btnReset"			 runat="server"
																style="width: 80px; height: 30px; " value="清除" />	
													</td>
													</tr>
												</tbody>
											</table>
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
		  <script src="assets/js/setup.js"></script>

		  <!-- Customizer, remove if not needed -->
		  <script src="assets/js/customizer.js"></script>

		  <!-- Uniform Script -->
		  <script src="plugins/uniform/jquery.uniform.min.js"></script>

		  <!--Daterangepicker Script-->
		  <script src="assets/js/jquery.datetimepicker.js"></script>
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

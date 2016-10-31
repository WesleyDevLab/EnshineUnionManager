﻿using Aspose.Cells;
using EnshineUnionManager.model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnshineUnionManager
{
	public partial class CoCheckExport : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				HttpCookie getCookies = Request.Cookies["UserLogin"];
				if (getCookies != null)
				{
					spClientName.InnerHtml = "【" + Server.UrlDecode(getCookies["ClientName"].ToString()) + "】 Welcome To 益生联盟数据平台";

					string[] Day = new string[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
					var hour = string.Empty;
					if (DateTime.Now.Hour > 12)
					{
						hour = "下午" + DateTime.Now.Hour + "\n时";
					}
					else { hour = "上午" + DateTime.Now.Hour + "\n时"; }
					spNowTime.InnerText = DateTime.Now.ToString("yyyy年MM月dd日") + "\n" + Day[Convert.ToInt16(DateTime.Now.DayOfWeek)] + "\n" + hour; ;
					using (EnshineUnionDataContext db = new EnshineUnionDataContext())
					{
						var getShop = (from p in db.shopset select new { p.shopCode, p.shopname }).ToList();
						drpShopSet.DataTextField = "shopname";
						drpShopSet.DataValueField = "shopCode";
						drpShopSet.DataSource = getShop;
						drpShopSet.DataBind();
						drpShopSet.Items.Insert(0, new ListItem("县域门店"));
					}
				}
				else
				{
					ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('请登录在进行查询。');window.location.href='Login.aspx';</script>");
				}
			
				}
		}

		protected void btnExportExcel_ServerClick(object sender, EventArgs e)
		{
			HttpCookie getCookies = Request.Cookies["UserLogin"];
			if (getCookies != null)
			{
				//var timeSearch = string.Empty;
				//if (string.IsNullOrEmpty(txtTimeSelect.Value.Trim()))
				//{
				//	timeSearch = "NowMonth";
				//}
				//else
				//{
				//	timeSearch = txtTimeSelect.Value.Trim();
				//}
				var getMemberExtractData = SearchDataClass.GetSearchSaleCheckData(drpShopSet.SelectedValue, txtTimeSelect.Value.Trim());
				//创建一个workbookdesigner对象
				WorkbookDesigner designer = new WorkbookDesigner();
				//制定报表模板
				designer.Open(Server.MapPath(@"model\cocheckreport.xls"));
				//设置实体类对象
				designer.SetDataSource("Export", getMemberExtractData);
				//根据数据源处理生成报表内容
				designer.Process();
				//客户端保存的文件名
				string fileName = HttpUtility.UrlEncode("厂家核对报表导出") + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
				designer.Save(fileName, SaveType.OpenInExcel, FileFormatType.Excel2003, Response);
				Response.Flush();
				Response.Close();
				designer = null;
				Response.End();
			}
		}
	}
}
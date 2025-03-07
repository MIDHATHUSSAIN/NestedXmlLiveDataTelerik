using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Net;
using System.Xml;
using System.IO;
using System.Xml.Linq;

public partial class Default : System.Web.UI.Page 
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadialPointer pointer = (RadialPointer)RadRadialGauge1.Pointer;
            RadialPointer pointer1 = (RadialPointer)RadRadialGauge2.Pointer;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://81.8.164.237/wtgwebservice/wtgwebservice.asmx/GetWtgStatus");
            request.Method = "GET";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            using (Stream stream = response.GetResponseStream())
            using (StreamReader reader = new StreamReader(stream))
            {
                string a = reader.ReadToEnd();
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(a);

              string xmlInnerText = xmlDoc.InnerText;
                XmlDocument xmlDocc = new XmlDocument();
                xmlDocc.LoadXml(xmlInnerText);

                XmlNode spotValuesNode = xmlDocc.SelectSingleNode("WTGs");
                XmlNodeList wtgs = spotValuesNode.SelectNodes("WTG");

                one.Attributes["title"] ="WTG" + wtgs[0].Attributes["ID"].Value +"\n" + "Wind" + wtgs[0].Attributes["Wind"].Value + "\n" +"Power" + wtgs[0].Attributes["Power"].Value;
                two.Attributes["title"] = "WTG" + wtgs[1].Attributes["ID"].Value + "\n" + "Wind" + wtgs[1].Attributes["Wind"].Value + "\n" + "Power" + wtgs[1].Attributes["Power"].Value;
                three.Attributes["title"] = "WTG" + wtgs[2].Attributes["ID"].Value + "\n" + "Wind" + wtgs[2].Attributes["Wind"].Value + "\n" + "Power" + wtgs[2].Attributes["Power"].Value;

                pointer.Value = Convert.ToDecimal(wtgs[0].Attributes["Wind"].Value);

                pointer1.Value = Convert.ToDecimal(wtgs[1].Attributes["Wind"].Value);



            }
        }


    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {

        RadialPointer pointer = (RadialPointer)RadRadialGauge1.Pointer;
        RadialPointer pointer1 = (RadialPointer)RadRadialGauge2.Pointer;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://81.8.164.237/wtgwebservice/wtgwebservice.asmx/GetWtgStatus");
        request.Method = "GET";
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            string a = reader.ReadToEnd();
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(a);

            string xmlInnerText = xmlDoc.InnerText;
            XmlDocument xmlDocc = new XmlDocument();
            xmlDocc.LoadXml(xmlInnerText);

            XmlNode spotValuesNode = xmlDocc.SelectSingleNode("WTGs");
            XmlNodeList wtgs = spotValuesNode.SelectNodes("WTG");

            one.Attributes["title"] = "WTG" + wtgs[0].Attributes["ID"].Value + "\n" + "Wind" + wtgs[0].Attributes["Wind"].Value + "\n" + "Power" + wtgs[0].Attributes["Power"].Value;
            two.Attributes["title"] = "WTG" + wtgs[1].Attributes["ID"].Value + "\n" + "Wind" + wtgs[1].Attributes["Wind"].Value + "\n" + "Power" + wtgs[1].Attributes["Power"].Value;
            three.Attributes["title"] = "WTG" + wtgs[2].Attributes["ID"].Value + "\n" + "Wind" + wtgs[2].Attributes["Wind"].Value + "\n" + "Power" + wtgs[2].Attributes["Power"].Value;

            pointer.Value = Convert.ToDecimal(wtgs[0].Attributes["Wind"].Value);

            pointer1.Value = Convert.ToDecimal(wtgs[1].Attributes["Wind"].Value);



        }

        UpdatePanle1.Update();
        UpdatePanel2.Update();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace AspModel.Handles
{
    /// <summary>
    /// GetData 的摘要说明
    /// </summary>
    public class GetData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {


            string CMD = context.Request.Form["CMD"];
            if (CMD == "submit1")
            {
                string TextBox1value = context.Request.Form["TextBox1value"];
                string username = context.Request.Form["username"];
                string ConferenceName = context.Request.Form["ConferenceName"];


                //ConferenceName = URLDecoder.decode(ConferenceName, "utf-8");
                

                context.Response.Write(Serialize(new { Data = "true" }));
            }
        }

        public string Serialize(object obj)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(obj);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
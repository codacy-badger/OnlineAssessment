using System;
using ExceptionManagers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessment
{
    public partial class EmptyRepeater : System.Web.UI.UserControl
    {
        public static String RepeatTitle = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitle.Text = RepeatTitle;
        }
        
    }
}
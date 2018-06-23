<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "image/Jpeg";

        System.Drawing.Bitmap image = new System.Drawing.Bitmap(120, 40);
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(image);
        
        Random rand = new Random();
        int iRan = rand.Next();
        string sKey = VSW.Lib.Global.Security.MD5(iRan.ToString());
        string randString = sKey.Substring(0, 2) + iRan.ToString()[0];

        g.FillRectangle(System.Drawing.Brushes.WhiteSmoke, 0, 0, 120, 40);
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.Default;
        g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;

        for (int i = 0; i < randString.Length; i++)
        {
            System.Drawing.Font drawFont = new System.Drawing.Font("Arial", 18, System.Drawing.FontStyle.Italic | (rand.Next() % 2 == 0 ? System.Drawing.FontStyle.Bold : System.Drawing.FontStyle.Regular));
            
            g.DrawString(randString.Substring(i, 1), drawFont, System.Drawing.Brushes.Black, i * 35 + 10, rand.Next() % 12);

            for (int j = 0; j < 15; j++)
            {
                System.Drawing.Point pt = new System.Drawing.Point(rand.Next() % 120, rand.Next() % 35);
                g.DrawEllipse(System.Drawing.Pens.LightSteelBlue, pt.X, pt.Y, rand.Next() % 15 + 1, rand.Next() % 15 + 1);
            }
        }

        sKey = HttpContext.Current.Request.UserHostAddress + "." + string.Format("yyyy.MM.dd.hh", DateTime.Now) + "." + randString;
        HttpContext.Current.Response.Cookies["Confirm_Ran"].Value =VSW.Core.Global.CryptoString.Encrypt(sKey);
        image.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        g.Dispose();
        image.Dispose();
    }
    
</script>
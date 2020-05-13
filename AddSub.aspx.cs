using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADRIJA_AddSub : System.Web.UI.Page
{
    int range = 10;
    int oper;
    int pos;
    int correctResult;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        range =int.Parse(TextBox5.Text);
    }
    private void formQuestion()
    {
        Random r = new Random();
        oper = r.Next(1, 3);
       
        if (oper == 1)
        {
            Label2.Text = "+";
        }
        else { Label2.Text = "-"; }

        pos = r.Next(1, 4);

        switch (pos)

        {
            case 1:
                resetfield();
                TextBox1.BackColor = System.Drawing.Color.Yellow;
                TextBox2.BackColor = System.Drawing.Color.GreenYellow;
                TextBox3.BackColor = System.Drawing.Color.GreenYellow;
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
                setNum(pos, oper);
                TextBox1.Focus();
                break;
            case 2:
                resetfield();
                TextBox2.BackColor = System.Drawing.Color.Yellow;
                TextBox1.BackColor = System.Drawing.Color.GreenYellow;
                TextBox3.BackColor = System.Drawing.Color.GreenYellow;
                TextBox1.Enabled = false;
                TextBox3.Enabled = false;
                setNum(pos, oper);
                TextBox2.Focus();
                break;
            default:
                resetfield();
                TextBox3.BackColor = System.Drawing.Color.Yellow;
                TextBox1.BackColor = System.Drawing.Color.GreenYellow;
                TextBox2.BackColor = System.Drawing.Color.GreenYellow;
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                setNum(pos, oper);
                TextBox3.Focus();

                break;
        }

    }
    private void setNum(int a,int op)
    {
        
        Random r = new Random();
        int num1;
        int num2;
        Boolean ok = false;
        switch (a)

        {
            case 1:
                do
                {
                    num1 = r.Next(0, range);
                    num2 = r.Next(0, range);
                    if (op == 1)
                    {
                        if (num2 > num1) { ok = true; correctResult = num2 - num1; }
                    }
                    else
                    {
                        ok = true;
                        correctResult = num2 + num1;
                    }
                    
                } while (!ok);

                TextBox2.Text = num1.ToString();
                TextBox3.Text = num2.ToString();
               
                break;
            case 2:
                do
                {
                    num1 = r.Next(0, range);
                    num2 = r.Next(0, range);
                    if (op == 1)
                    {
                        if (num2 > num1) { ok = true; correctResult = num2 - num1; }
                    }
                    else
                    {
                        if (num1 > num2) { ok = true; correctResult = num1 - num2; }
                    }

                } while (!ok);
                TextBox1.Text = num1.ToString();
                TextBox3.Text = num2.ToString();
                
                break;
            default:
                do
                {
                    num1 = r.Next(0, range);
                    num2 = r.Next(0, range);
                    if (op == 1)
                    {
                        ok = true;
                        correctResult = num2 + num1;
                    }
                    else
                    {
                        if (num1 > num2) { ok = true; correctResult = num1 - num2; }
                    }

                } while (!ok);

                TextBox1.Text = num1.ToString();
                TextBox2.Text = num2.ToString();
               
                break;

        }
        Label6.Text = correctResult.ToString();


    }
    private void resetfield()
    {
        TextBox1.Enabled = true;
        TextBox2.Enabled = true;
        TextBox3.Enabled = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox1.BackColor = System.Drawing.Color.White;
        TextBox2.BackColor = System.Drawing.Color.White;
        TextBox3.BackColor = System.Drawing.Color.White;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        formQuestion();
        Image2.Visible = true;
    }

   
    private void resultEffect()
    {
       

        if (getResult())
        {
            Label1.Text = (int.Parse(Label1.Text) + 1).ToString();
            Label3.Text = (int.Parse(Label3.Text) + 1).ToString();
            Image1.ImageUrl = "/Adrija/img/sm.png";
            Image2.ImageUrl = "/Adrija/img/check.jpg";
        }
        else
        {
            Label1.Text = (int.Parse(Label1.Text) - 1).ToString();
            Label4.Text = (int.Parse(Label4.Text) + 1).ToString();
            Image1.ImageUrl = "/Adrija/img/sad.png";
            Image2.ImageUrl = "/Adrija/img/cross.png";
        }

      
        
    }

    private int resetImage()
    {
        //To be called from an async process
        //Task<int> task = new Task<int>(resetImage);
        //task.Start();
        //int count = await task;

        Thread.Sleep(3000);
        Image1.ImageUrl = "/Adrija/img/sad.png";
        return 0;
    }
   

    public Boolean getResult()
    {
        Boolean result = false;

        Label7.Text = TextBox1.Text;
        Label8.Text = TextBox2.Text;
        Label9.Text = TextBox3.Text;
        Label5.Text = Label2.Text;
        Label13.Text = "=";

       // Label6.Text = correctResult.ToString();

        int rlt = Int32.Parse(TextBox3.Text);
        if (Label2.Text=="+")
        {
            if(rlt == (Int32.Parse(TextBox1.Text) + Int32.Parse(TextBox2.Text)) )
            {
                result = true;
               
            }
           
        }
        else
        {
            if (rlt == (Int32.Parse(TextBox1.Text) - Int32.Parse(TextBox2.Text)))
            {
                result = true;
               
            }
           
            //Label6.Text = (Int32.Parse(TextBox4.Text) - Int32.Parse(TextBox6.Text)).ToString();
        }

        
        return result;
    }



    

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label10.Text = "(" + Label6.Text + ")";
        Label11.Text = "";
        Label12.Text = "";
        resultEffect();
        formQuestion();
        

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Label11.Text = "(" + Label6.Text + ")";
        Label10.Text = "";
        Label12.Text = "";
        resultEffect();
        formQuestion();
       
    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        Label12.Text = "(" + Label6.Text + ")";
        Label10.Text = "";
        Label11.Text = "";

        resultEffect();
        formQuestion();
       

    }
  
}
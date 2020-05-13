<%@ Page Title="" Language="C#" MasterPageFile="~/ADRIJA/MasterPageWhatsApp.master" AutoEventWireup="true" CodeFile="AddSub.aspx.cs" Inherits="ADRIJA_AddSub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        var a = 0;
        setInterval(function () {
            a = a + 1;
            if (a > 0) {
                document.getElementById('<%=Image1.ClientID%>').setAttribute('src', 'http://math.mycomputech.in/Adrija/img/normal.png');
                a = 0;
            }
        }, 4000);
        function getres() {
            var result = document.getElementById('<%=TextBox3.ClientID%>').value
            var num1 = document.getElementById('<%=TextBox1.ClientID%>').value
            var num2 = document.getElementById('<%=TextBox2.ClientID%>').value
            if (document.getElementById('<%=Label2.ClientID%>').innerText == '+') {

                if (parseInt(result, 10) == (parseInt(num1, 10) + parseInt(num2, 10))) { var msg = new SpeechSynthesisUtterance('Thats correct'); window.speechSynthesis.speak(msg); }
                else { var msg = new SpeechSynthesisUtterance('That was wrong'); window.speechSynthesis.speak(msg); }
            }
            else {
                if (parseInt(result, 10) == (parseInt(num1, 10) - parseInt(num2, 10))) { var msg = new SpeechSynthesisUtterance('Thats correct'); window.speechSynthesis.speak(msg); }
                else { var msg = new SpeechSynthesisUtterance('That was wrong'); window.speechSynthesis.speak(msg); }
            }
        }

    </script>
    <style type="text/css">
        .img1:hover {
            /*Start the shake animation and make the animation last for 0.5 seconds*/
            animation: shake 0.5s;
            /*When the animation is finished, start again*/
            animation-iteration-count: infinite;
        }

        @keyframes shake {
            0% {
                transform: translate(1px, 1px) rotate(0deg);
            }

            10% {
                transform: translate(-1px, -2px) rotate(-1deg);
            }

            20% {
                transform: translate(-3px, 0px) rotate(1deg);
            }

            30% {
                transform: translate(3px, 2px) rotate(0deg);
            }

            40% {
                transform: translate(1px, -1px) rotate(1deg);
            }

            50% {
                transform: translate(-1px, 2px) rotate(-1deg);
            }

            60% {
                transform: translate(-3px, 1px) rotate(0deg);
            }

            70% {
                transform: translate(3px, 1px) rotate(-1deg);
            }

            80% {
                transform: translate(-1px, -1px) rotate(1deg);
            }

            90% {
                transform: translate(1px, 2px) rotate(0deg);
            }

            100% {
                transform: translate(1px, -2px) rotate(-1deg);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="col-12 col-s-12">
                <p style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 40px;">
                    
                    
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control-inline" Style="text-align: center" Text="10" TextMode="Number" Width="90px" />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="START" />
                    
                    <span style="float:right">
                        Marks:
                    <asp:Label ID="Label1" runat="server" Text="0" ForeColor="#000099" Font-Bold="True"></asp:Label>
                    &nbsp;&nbsp;&nbsp;Correct:
                    <asp:Label ID="Label3" runat="server" Text="0" ForeColor="#006600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;Wrong:
                    <asp:Label ID="Label4" runat="server" Text="0" ForeColor="Red"></asp:Label>
                    </span>
                        
                    <hr />
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" onchange="getres()" CssClass="form-control-inline" Font-Size="50" Height="200" OnTextChanged="TextBox1_TextChanged" Style="text-align: center" TextMode="Number" Width="20%"></asp:TextBox>
                    <span style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 100px;">
                        <asp:Label ID="Label2" runat="server" Font-Size="100" Style="padding: 40px" Text="+"></asp:Label>
                    </span>
                    <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" onchange="getres()" CssClass="form-control-inline" Font-Size="50" Height="200" OnTextChanged="TextBox2_TextChanged" Style="text-align: center" TextMode="Number" Width="20%"></asp:TextBox>
                    <span style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 100px; padding: 40px">= </span>
                    <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" onchange="getres()" CssClass="form-control-inline" Font-Size="50" Height="200" OnTextChanged="TextBox3_TextChanged" Style="text-align: center" TextMode="Number" Width="20%"></asp:TextBox>
                    <hr />
                    <p style="text-align: center">
                        <asp:image ID="Image1" class="img1" runat="server" Width="300px" Height="300px" ImageUrl="~/ADRIJA/img/normal.png" />
                    </p>

                    <span style="float:left; vertical-align:central">

                    <asp:label ID="Label7" runat="server" Font-Size="50" Style="padding: 20px" Text=""/>
                    <asp:label ID="Label10" runat="server" Font-Size="50" Style="padding: 20px" Text="" ForeColor="#339933"/>
                    <asp:label ID="Label5" runat="server" Font-Size="50" Style="padding: 20px" Text=""/>
                    <asp:label ID="Label8" runat="server" Font-Size="50" Style="padding: 20px" Text=""/>
                    <asp:label ID="Label11" runat="server" Font-Size="50" Style="padding: 20px" Text="" ForeColor="#339933"/>
                    <asp:label ID="Label13" runat="server" Font-Size="50" Style="padding: 20px" Text=""/>
                    <asp:label ID="Label9" runat="server" Font-Size="50" Style="padding: 20px" Text=""/>
                    <asp:label ID="Label6" runat="server" Visible="false" Text=""/>
                    <asp:label ID="Label12" runat="server" Font-Size="50" Style="padding: 20px" Text="" ForeColor="#339933"/>
                       <asp:image ID="Image2" Visible="false" runat="server" Width="50px" Height="50px" />
                        </span> 
                </p>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


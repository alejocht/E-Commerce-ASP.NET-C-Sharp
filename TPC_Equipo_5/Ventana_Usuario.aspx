<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="~/Ventana_Usuario.aspx.cs" Inherits="TPC_Equipo_5.Ventana_Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100" >
        <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: 25rem; border-color:#c32a2a; height:30rem;">
            <div class="d-flex justify-content-center">
                <%--hay que cambiar imagen --%>
            </div>
            <div class="text-center fs-1 fw-bold">
                <img  style="height: 50px" src="https://i.imgur.com/9E31weS.png" alt="OverCloaked">     
                Login
            </div>
            <div class="input-group mt-4">
                <div class="input-group-text " style="background-color: #c32a2a">
                    <img src="/assets/person.svg"
                        alt="usurname-icon"
                        style="height: 1rem;" />
                </div>
                <asp:TextBox ID="TxtUser" CssClass="form-control" type="text" runat="server" placeholder="nombre de usuario"></asp:TextBox>
            </div>
            <div class="input-group mt-1" >
                <div class="input-group-text" style="background-color: #c32a2a">
                    <img src="/assets/key.svg"
                        alt="usurname-icon"
                        style="height: 1rem;" />
                </div>
                <asp:TextBox ID="TxtPass" CssClass="form-control" type="password" placeholder="Clave" runat="server"></asp:TextBox>
            </div>
            <div class="d-flex justify-content-around mt-1">
                <div class="d-flex align-items-center gap-1">
                    <input class="form-check-input" type="checkbox" />
                    <div class="pt-1" style="font-size:0.9rem">Remember me</div>
                </div>
                <div class="pt-1">
                    <a href="#" class="text-decoration-none fw-semibold fst-italic" style="font-size:0.9rem; color: #c32a2a">Forgot your password?</a>
                </div>
            </div>
                <div>
                    <asp:Button class="btn text-white w-100 mt-4" ID="Btn_login" style="background-color:#c32a2a" Text="Login" runat="server" OnClick="Btn_login_Click" />

                </div>
                <div class="d-flex gap-1 justify-content-center mt-1">
                    <div>No tenes cuenta?</div>
                    <a href="RegistroUsuario.aspx"class="text-decoration-none  fw-semibold"style=" color: #c32a2a">Crear cuenta</a>
                </div>
        </div>
    </div>
</asp:Content>

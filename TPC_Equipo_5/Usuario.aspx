<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="TPC_Equipo_5.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100" style="background-color: whitesmoke">
        <div class="bg-white p-5 rounded-5 text-secondary" style="width: 25rem; height:30rem;">
            <div class="d-flex justify-content-center">
                <img  style="height: 50px" src="https://i.imgur.com/9ffo48f.png" alt="OverCloaked">
                <%--hay que cambiar imagen --%>
            </div>
            <div class="text-center fs-1 fw-bold">Login</div>
            <div class="input-group mt-4">
                <div class="input-group-text " style="background-color: #c32a2a">
                    <img src="/assets/person.svg"
                        alt="usurname-icon"
                        style="height: 1rem;" />
                </div>
                <input class="form-control" type="text" placeholder="Nombre de usuario" />
            </div>
            <div class="input-group mt-1" >
                <div class="input-group-text" style="background-color: #c32a2a">
                    <img src="/assets/key.svg"
                        alt="usurname-icon"
                        style="height: 1rem;" />
                </div>
                <input class="form-control" type="password" placeholder="Clave" />
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
                <div class="btn text-white w-100 mt-4" style="background-color:#c32a2a">Login</div>
                <div class="d-flex gap-1 justify-content-center mt-1">
                    <div>Don´t have an account?</div>
                    <a href="#"class="text-decoration-none  fw-semibold"style=" color: #c32a2a">Register</a>
                </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPC_Equipo_5.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h1>Ha ocurrido un error imprevisto :(</h1>
    <hr />
    <h4>Descripcion del error: </h4>
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <hr />
    <p >Desea volver a navegar?</p>
    <a href="default.aspx">Click Aqui</a>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/siteAdmin.Master" CodeBehind="AgregarCategoria.aspx.cs" Inherits="TPC_Equipo_5.AgregarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row g-3">
            <div class="col">
                <label class="form-label">Nombre de la categoria</label>
                <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        <div class="row">
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnCancelarProducto" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelarProducto_Click" />
            </div>
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAgregarProducto_Click"></asp:Button>
            </div>
        </div>
    <div style="padding: 100px 10px;">
    </div>
        </div>
</asp:Content>
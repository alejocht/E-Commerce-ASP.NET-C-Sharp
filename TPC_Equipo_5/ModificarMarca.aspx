<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/siteAdmin.Master" CodeBehind="ModificarMarca.aspx.cs" Inherits="TPC_Equipo_5.ModificarMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row g-3">
            <div class="col">
                <label class="form-label">Nombre de la marca</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        <div class="row">
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnCancelarProducto" runat="server" Text="Cancelar" CssClass="btn btn-secondary" onclick="btnCancelarProducto_Click" />
            </div>
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar" CssClass="btn btn-success" onclick="btnAgregarProducto_Click"></asp:Button>
            </div>
            <div class="col m-2 p-lg-4">
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" onclick="BtnEliminar_Click" ></asp:Button>
            </div>
        </div>
    <div style="padding: 100px 10px;">
    </div>
        </div>
</asp:Content>

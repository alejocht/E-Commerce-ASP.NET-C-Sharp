<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="DetallePedidoAdmin.aspx.cs" Inherits="TPC_Equipo_5.DetallePedidoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col d-flex justify-content-space-between">
                <h1>PEDIDO #</h1>
            </div>
            <div class="col">
                <asp:Label ID="lblNumeroPedido" runat="server" CssClass="h1" Text="XXXX"></asp:Label>
            </div>
        </div>
        <div class="container" style="background-color: #1b1f23; margin: 15px; padding-top: 10px; padding-bottom: 10px; border-radius: 10px;">
            <div class="row">
                <div class="col">
                    <h5>Nombre de usuario:</h5>
                </div>
                <div class="col">
                    <asp:Label ID="lblUsuario" runat="server" CssClass="h5" Text="Nombre del cliente"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h5>Método de pago:</h5>
                </div>
                <div class="col">
                    <asp:Label ID="lblMetodoPago" runat="server" CssClass="h5" Text="Forma de pago"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h5>Fecha de pedido:</h5>
                </div>
                <div class="col">
                    <asp:Label ID="lblFecha" runat="server" CssClass="h5" Text="Fecha del pedido"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h5>Estado:</h5>
                </div>
                <div class="col">
                    <asp:Label ID="lblEstado" runat="server" CssClass="h5" Text="Estado del pedido"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h2>Lista de Productos:</h2>
            </div>
        </div>
        <div class="container" style="background-color: #1b1f23; margin: 15px; padding-top: 10px; padding-bottom: 10px; border-radius: 10px;">
        </div>
        <div class="row">
            <div class="col">
                <h2>Total $</h2>
            </div>
        </div>
    </div>
</asp:Content>

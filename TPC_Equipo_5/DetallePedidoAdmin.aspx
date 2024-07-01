<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="DetallePedidoAdmin.aspx.cs" Inherits="TPC_Equipo_5.DetallePedidoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col">
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
                    <h5>Estado del pedido:</h5>
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
            <div class="row">
                <div class="col">
                    <h5>Producto</h5>
                </div>
                <div class="col">
                    <h5>Cantidad</h5>
                </div>
                <div class="col">
                    <h5>Precio unitario</h5>
                </div>
                <div class="col">
                    <h5>Total</h5>
                </div>
            </div>
            <asp:Repeater ID="RepeaterProductosxPedido" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblProducto" runat="server" CssClass="h6" Text="Nombre del producto"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblCantidad" runat="server" CssClass="h6" Text="Cantidad"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblPrecio" runat="server" CssClass="h6" Text="Precio unitario"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblTotalProducto" runat="server" CssClass="h6" Text="Total"></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row">
            <div class="col">
                <h2>Total $</h2>
            </div>
        </div>
        <div class="container text-end">
            <h5>Modificar estado del pedido</h5>
            <div class="row" style="margin-top: 20px">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Pedido" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
            </div>
            <div class="row" style="margin-top: 10px">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar Pedido" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
            </div>
        </div>
    </div>
</asp:Content>

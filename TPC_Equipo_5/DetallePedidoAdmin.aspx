<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="DetallePedidoAdmin.aspx.cs" Inherits="TPC_Equipo_5.DetallePedidoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
                <asp:Label ID="lblNumeroPedido" runat="server" CssClass="h1" Text="XXXX"></asp:Label>
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
            <div class="row" style="margin-bottom: 20px; padding: 10px 20px;">
                <div class="col-5">
                    <h5>Producto</h5>
                </div>
                <div class="col-2 text-center">
                    <h5>Marca</h5>
                </div>
                <div class="col text-center">
                    <h5>Cantidad</h5>
                </div>
                <div class="col text-end">
                    <h5>Precio unitario</h5>
                </div>
            </div>
            <asp:Repeater ID="RepProductosxPedido" runat="server">
                <ItemTemplate>
                    <div class="row align-items-center" style="padding: 2px 20px;">
                        <div class="col-5">
                            <h6>- <%#Eval("producto.nombre")%></h6>
                        </div>
                        <div class="col-2 text-center">
                            <h6><%#Eval("producto.marca.nombre")%></h6>
                        </div>
                        <div class="col text-center">
                            <h6><%#Eval("Cantidad")%></h6>
                        </div>
                        <div class="col text-end">
                            <h6>$ <%#Eval("producto.precio")%></h6>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row">
            <div class="col text-end">
                <asp:Label ID="lblTotal" runat="server" CssClass="h2" Text="Total"></asp:Label>
            </div>
        </div>
        <div class="container text-start">
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

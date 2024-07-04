<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="pedidosAdmin.aspx.cs" Inherits="TPC_Equipo_5.pedidosAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">LISTA DE PEDIDOS</h1>
            </div>
        </div>
        <div class="row">
        </div>
        <div class="row" style="padding: 30px 10px; align-items: end;">
            <div class="col-6">
                <div class="row">
                    <div class="col">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar por nombre" Style="background-color: #1b1f23; color: white;"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnBusqueda" runat="server" Text="Buscar" CssClass="btn btn-outline-light" OnClick="btnBusqueda_Click" />
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="dropdown text-end">
                    <asp:CheckBox ID="ChkCompletados" runat="server" Text="Filtrar Completados" style="margin-right: 20px;" OnCheckedChanged="ChkCompletados_CheckedChanged" AutoPostBack="true"/>
                    <asp:DropDownList ID="ddlOrdenar" runat="server" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged" AutoPostBack="true"
                        aria-label="Por defecto" CssClass="btn dropdown-menu-end btn-dark"
                        Style="background-color: #1b1f23; width: 30%;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col" >
                    <asp:RadioButtonList ID="rblFiltroBusqueda" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="N° Pedido" style="margin-right: 20px;" />
                        <asp:ListItem Text="Cliente" style="margin-right: 20px;" />
                        <asp:ListItem Text="Fecha" style="margin-right: 20px;" />
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="dgvPedidos" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPedidos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="N° Pedido" DataField="id" />
                        <asp:BoundField HeaderText="Cliente" DataField="usuario.usuario" />
                        <asp:BoundField HeaderText="Fecha" DataField="fecha" />
                        <asp:BoundField HeaderText="Método de pago" DataField="metodoPago.nombre" />
                        <asp:BoundField HeaderText="Estado" DataField="estadoPedido.nombre" />
                        <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row" style="padding: 20px 10px;">
            <div class="col-2">
                <asp:Button ID="btnAnterior" runat="server" Text="Anterior" CssClass="btn btn-outline-light" />
                <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-outline-light" />
            </div>
            <div class="col-6 align-content-center">
                <asp:Label ID="lblPagina" runat="server" Text="Página: X" CssClass="form-label"></asp:Label>
                <asp:Label ID="lblTotal" runat="server" Text=" de XX" CssClass="form-label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
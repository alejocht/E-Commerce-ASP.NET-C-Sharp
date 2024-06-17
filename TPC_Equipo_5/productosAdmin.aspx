﻿<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="productosAdmin.aspx.cs" Inherits="TPC_Equipo_5.productosAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col-12">
                <h1 class="text-center">LISTA DE PRODUCTOS</h1>
            </div>
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
                    <asp:DropDownList ID="ddlOrdenar" runat="server" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged" AutoPostBack="true"
                        aria-label="Default select example" CssClass="btn dropdown-toggle"
                        Style="background-color: #1b1f23; width: 30%;">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="dgvProductos" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Precio" DataField="precio" />
                        <asp:BoundField HeaderText="Stock" DataField="stock" />
                        <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Detalle" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row" style="padding: 20px 10px;">
            <div class="col-4">
                <asp:Button ID="btnAnterior" runat="server" Text="Anterior" CssClass="btn btn-outline-light" />
                <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-outline-light" />
            </div>
            <div class="col-4 text-center">
                <asp:Label ID="lblPagina" runat="server" Text="Página: 1" CssClass="form-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text=" de 10" CssClass="form-label"></asp:Label>
            </div>
            <div class="col-4 text-end">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar producto" CssClass="btn btn-outline-light" />
            </div>
        </div>
    </div>

</asp:Content>

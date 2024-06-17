﻿<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="pedidosAdmin.aspx.cs" Inherits="TPC_Equipo_5.pedidosAdmin" %>
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
        <div class="col-md-12">
            <asp:GridView ID="dgvPedidos" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPedidos_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="id" />
                    <asp:BoundField HeaderText="Precio" DataField="fecha" />
                    <asp:BoundField HeaderText="Stock" DataField="estado" />
                    <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>


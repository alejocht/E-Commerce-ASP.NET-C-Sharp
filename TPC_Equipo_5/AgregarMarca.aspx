﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/siteAdmin.Master" CodeBehind="AgregarMarca.aspx.cs" Inherits="TPC_Equipo_5.AgregarMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row g-3">
            <div class="form-floating mb-3 col">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" minlength="1" MaxLength="80" required="true"></asp:TextBox>
                <label id="lblMarca" for="txtNombre" class="form-label">Nombre de la marca</label>
                </div>
            </div>
        <div class="row">
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" formnovalidate="true"/>
            </div>
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAgregar_Click"></asp:Button>
            </div>
        </div>
    <div style="padding: 100px 10px;">
    </div>
        </div>
</asp:Content>

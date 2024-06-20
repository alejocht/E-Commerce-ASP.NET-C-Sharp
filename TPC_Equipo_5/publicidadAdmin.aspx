<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="publicidadAdmin.aspx.cs" Inherits="TPC_Equipo_5.publicidadAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div>
                <h1 class="text-center">PUBLICIDAD</h1>
            </div>
        </div>
        <div class="row">
            <div>
                <h3>Pantalla Principal</h3>
            </div>
        </div>
        <div class="row" style="display: flex; justify-content: center;">
            <div class="card" style="max-width: 75%;">
                <div class="row">
                    <div class="col-md-8">
                        <asp:Image ID="imgDetallePublicidad1" runat="server" CssClass="img-thumbnail" ImageUrl="https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png" />
                    </div>
                    <div class="col-md-4">
                        <div class="card-body align-items-end">
                            <div class="row">
                                <h4 class="card-title">Publicidad N°1</h4>
                            </div>
                            <div class="row">
                                <asp:Button ID="btnVisualizarPublicidad" runat="server" Text="Visualizar" CssClass="btn btn-dark" />
                            </div>
                            <div class="row">
                                <asp:Button ID="btnModificarPublicidad" runat="server" Text="Cambiar" CssClass="btn btn-dark" />
                            </div>
                            <div class="row">
                                <asp:Button ID="btnEliminarPublicidad" runat="server" Text="Eliminar" CssClass="btn btn-dark" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

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
            <asp:Repeater ID="RepeaterPublicidad" runat="server">
                <ItemTemplate>
                    <div class="card" style="max-width: 85%; background-color: #1b1f23; margin: 15px; padding-top: 10px; padding-bottom: 10px; border-radius: 10px;">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Image ID="imgDetallePublicidad" runat="server" CssClass="img-thumbnail" ImageUrl="https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png" />
                            </div>
                            <div class="col-md-7 text-white">
                                <div class="card-header">
                                    <asp:Label ID="lblPublicidad" runat="server" CssClass="h4" Text="Publicidad N° XX"></asp:Label>
                                </div>
                                <div class="card-body align-items-end">
                                    <div class="row" style="padding-top: 10px;">
                                        <h6>URL Imagen publicitaria</h6>
                                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control h-75" Text="https://image.png" OnTextChanged="txtImagenUrl_TextChanged"></asp:TextBox>
                                    </div>
                                    <div class="row" style="padding-top: 20px;">
                                        <asp:Button ID="btnModificarPublicidad" runat="server" Text="Cambiar" CssClass="btn btn-success" />
                                    </div>
                                    <div class="row" style="padding-top: 10px;">
                                        <asp:Button ID="btnEliminarPublicidad" runat="server" Text="Eliminar" CssClass="btn btn-danger" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

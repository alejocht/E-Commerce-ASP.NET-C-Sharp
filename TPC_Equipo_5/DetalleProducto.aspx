<%@ Page Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Equipo_5.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerDetalle">
        <div class="row">
            <div class="col col-lg-2">
                <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="Back_Click" CssClass="btn btn-danger btn-sm m-2" />
            </div>
            <div class="col">
                <asp:Image ID="ImagenProducto" runat="server" CssClass="img-fluid" onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'"/>
            </div>
            <div class="col">
                <div class="container">
                    <div>
                        <asp:Label ID="lblNombre" runat="server" CssClass="h1"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblDescripcion" runat="server" CssClass="h4"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblPrecio" runat="server" CssClass="h6"></asp:Label>
                    </div>
                    <div>
                        <asp:Button ID="BtnAgregarAlCarrito" runat="server" Text="Agregar al Carrito" CssClass="btn btn-success m-3" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
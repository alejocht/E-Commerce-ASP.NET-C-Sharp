<%@ Page Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Equipo_5.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerDetalle">
        <div class="row">
            <div class="col-md-5">
                <asp:Image ID="ImagenProducto" runat="server" CssClass="w-100, h-100" onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'"/>
            </div>
            <div class="col-md-7">
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
                        <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="Back_Click" CssClass="btn btn-danger btn-sm" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
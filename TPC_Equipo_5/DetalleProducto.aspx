<%@ Page Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Equipo_5.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerDetalle">
        <div class="row">
            <div class="col-md-5">
                <img src="img\91a192b77d77a80a4b7e9768877d.jpg" alt="Alternate Text" class="w-100 h-100" />
            </div>
            <div class="col-md-7">
                <div class="container">
                    <div>
                        <asp:Label ID="lblNombre" runat="server" Text="Titulo" CssClass="h1"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblDescripcion" runat="server" Text="Este es un buen producto." CssClass="h4"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblPrecio" runat="server" Text="$###,##" CssClass="h6"></asp:Label>
                    </div>
                        <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="Back_Click" CssClass="btn btn-danger btn-sm" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
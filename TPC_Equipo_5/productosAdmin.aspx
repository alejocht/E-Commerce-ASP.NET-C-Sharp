<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="productosAdmin.aspx.cs" Inherits="TPC_Equipo_5.productosAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">Lista de productos</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="dgvProductos" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Precio" DataField="precio" />
                        <asp:BoundField HeaderText="Stock" DataField="stock" />
                        <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

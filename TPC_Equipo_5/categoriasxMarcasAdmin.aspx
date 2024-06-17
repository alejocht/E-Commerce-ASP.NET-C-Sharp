<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="categoriasxMarcasAdmin.aspx.cs" Inherits="TPC_Equipo_5.categoriasxMarcasAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">LISTA DE CATEGORÍAS</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="dgvCategorias" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvCategorias_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="id" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">LISTA DE MARCAS</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="dgvMarcas" runat="server" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvMarcas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

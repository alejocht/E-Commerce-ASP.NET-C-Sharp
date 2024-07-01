<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/siteAdmin.Master" CodeBehind="AgregarProducto.aspx.cs" Inherits="TPC_Equipo_5.AgregarProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <div class="row g-3">
            <div class="col">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>

                <label class="form-label">Precio</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <label class="form-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="Multiline" CssClass="form-control" Rows="5"></asp:TextBox>

                <label class="form-label">Stock</label>
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>

                <asp:Label ID="Label1" runat="server" Text="Categoría" CssClass="form-label" />
                <asp:DropDownList ID="DDLCategoria" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>

                <asp:Label ID="Label2" runat="server" Text="Marca" CssClass="form-label" />
                <asp:DropDownList ID="DDLMarca" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>
            </div>
            <div class="col-6 d-flex flex-wrap">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <label class="form-label">Imagen URL</label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged">
                        </asp:TextBox>
                        <asp:Image ID="imgProducto" runat="server" CssClass="img-thumbnail mt-4"
                            ImageUrl="https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png"
                            AutoPostBack="true" />
                        <div class="mt-2">
                            <asp:Button ID="btnAgregarImagen" Text="Agregar Imagen" runat="server" CssClass="btn btn-success" OnClick="btnAgregarImagen_Click" />
                        </div>


                        <div class="m-lg-2">
                            <asp:GridView ID="dgv_ImgProductos" runat="server" DataKeyNames="ID" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" OnRowDataBound="dgv_ImgProductos_RowDataBound" OnSelectedIndexChanged="dgv_ImgProductos_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField HeaderText="Imagenes seleccionadas" DataField="imagenUrl" />
                                    <asp:CommandField ShowSelectButton="true" SelectText="Quitar" HeaderText="" />
                                </Columns>
                            </asp:GridView>
                        </div>


                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

        </div>
        <div class="row">
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
            </div>
            <div class="col m-2 p-lg-4">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAgregar_Click"></asp:Button>
            </div>
        </div>
    </div>
    <div style="padding: 100px 10px;">
    </div>
</asp:Content>

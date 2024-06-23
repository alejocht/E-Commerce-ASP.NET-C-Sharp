<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="productosAdmin.aspx.cs" Inherits="TPC_Equipo_5.productosAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
    <%--<script>
        $(document).ready(function () {
            $('#BtnDetalleProducto').click(function () {
                $('#modalDetalleProducto').modal('show');
            });
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="row">
            <div class="col-12">
                <h1 class="text-center">LISTA DE PRODUCTOS</h1>
            </div>
        </div>
        <div class="row" style="padding: 30px 10px; align-items: end;">
            <div class="col-6">
                <div class="row">
                    <div class="col">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar por nombre" Style="background-color: #1b1f23; color: white;"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnBusqueda" runat="server" Text="Buscar" CssClass="btn btn-outline-light" OnClick="btnBusqueda_Click" />
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="dropdown text-end">
                    <asp:DropDownList ID="ddlOrdenar" runat="server" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged" AutoPostBack="true"
                        aria-label="Por defecto" CssClass="btn dropdown-menu-end btn-dark"
                        Style="background-color: #1b1f23; width: 30%;">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="dgvProductos" runat="server" CssClass="table table-dark table-bordered" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="id" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Precio" DataField="precio" />
                        <asp:BoundField HeaderText="Stock" DataField="stock" />
                        <%--
                        <asp:TemplateField HeaderText="Detalle">
                            <ItemTemplate>
                                <asp:Button ID="BtnDetalleProducto" runat="server" Text="Seleccionar" CssClass="btn btn-info"
                                    data-bs-toggle="modal" data-bs-target="#modalDetalleProducto" OnClick="BtnDetalleProducto_Click"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                            --%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row" style="padding: 20px 10px;">
            <div class="col-2">
                <asp:Button ID="btnAnterior" runat="server" Text="Anterior" CssClass="btn btn-outline-light" />
                <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-outline-light" />
            </div>
            <div class="col-6 align-content-center">
                <asp:Label ID="lblPagina" runat="server" Text="Página: X" CssClass="form-label"></asp:Label>
                <asp:Label ID="lblTotal" runat="server" Text=" de XX" CssClass="form-label"></asp:Label>
            </div>
            </div>
        </div>
            <div class="col-4 text-end">
                <asp:Button ID="btnAgregarProducto" type="button" runat="server" Text="Agregar Producto" class="btn btn-outline-light" OnClick="btnAgregarProducto_Click"/>
            </div>
    <%--    
    </div>
    </div>

    <div class="modal fade modal-lg" id="modalAgregarProducto" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Agregar producto</h5>
                    <asp:Button ID="btnCerrarProducto" runat="server" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Cerrar" OnClick="btnCerrarProducto_Click" />
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col">
                            <label class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>

                            <label class="form-label">Precio</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-text">.00</span>
                            </div>

                            <label class="form-label">Descripción</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="Multiline" CssClass="form-control" Rows="3"></asp:TextBox>

                            <label class="form-label">Stock</label>
                            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col d-flex flex-wrap">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <label class="form-label">Imagen URL</label>
                                    <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged">
                                    </asp:TextBox>
                                    <asp:Image ID="imgProducto" runat="server" CssClass="img-thumbnail" ImageUrl="https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>--%>
                    <%--<div class="row g-3">
                        <div class="col">
                            <asp:Label ID="lblCategoria" runat="server" Text="Categoría" CssClass="form-label" />
                            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblMarca" runat="server" Text="Marca" CssClass="form-label" />
                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCancelarProducto" runat="server" Text="Cancelar" CssClass="btn btn-secondary" data-bs-dismiss="modal" OnClick="btnCancelarProducto_Click" />
                    <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar" CssClass="btn btn-danger" OnClick="btnAgregarProducto_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>--%>

    <%--<div class="modal fade modal-lg" id="modalDetalleProducto" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Modificar producto</h5>
                    <asp:Button ID="btnDetalleProducto" runat="server" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Cerrar" />
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upDetalleProducto" runat="server">
                        <ContentTemplate>
                            <div class="row g-3">
                                <div class="col">
                                    <label class="form-label">Nombre</label>
                                    <asp:TextBox ID="txtDetalleNombre" runat="server" CssClass="form-control"></asp:TextBox>

                                    <label class="form-label">Precio</label>
                                    <div class="input-group">
                                        <span class="input-group-text">$</span>
                                        <asp:TextBox ID="txtDetallePrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                        <span class="input-group-text">.00</span>
                                    </div>

                                    <label class="form-label">Descripción</label>
                                    <asp:TextBox ID="txtDetalleDescripcion" runat="server" TextMode="Multiline" CssClass="form-control" Rows="3"></asp:TextBox>

                                    <label class="form-label">Stock</label>
                                    <asp:TextBox ID="txtDetalleStock" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col d-flex flex-wrap">
                                    <label class="form-label">Imagen URL</label>
                                    <asp:TextBox ID="txtDetalleImagenUrl" runat="server" CssClass="form-control" AutoPostBack="true">
                                    </asp:TextBox>
                                    <asp:Image ID="imgDetalleProducto" runat="server" CssClass="img-thumbnail" ImageUrl="https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png" />
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col">
                                    <asp:Label ID="lblDetalleCategoria" runat="server" Text="Categoría" CssClass="form-label" />
                                    <asp:DropDownList ID="ddlDetalleCategoria" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblDetalleMarca" runat="server" Text="Marca" CssClass="form-label" />
                                    <asp:DropDownList ID="ddlDetalleMarca" runat="server" CssClass="form-select" aria-label="Default"></asp:DropDownList>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dgvProductos" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnDetalleCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="btnDetalleModificar" runat="server" Text="Modificar" CssClass="btn btn-warning"></asp:Button>
                    <asp:Button ID="btnDetalleEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger"></asp:Button>
                </div>
            </div>
        </div>
    </div>--%>

</asp:Content>

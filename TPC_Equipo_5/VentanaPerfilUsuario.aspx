<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="VentanaPerfilUsuario.aspx.cs" Inherits="TPC_Equipo_5.VentanaPerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePerfilUsuario.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center" id="containerPrincipal">
        <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: 80rem; border-color: #c32a2a;">
            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h1>Mi Cuenta</h1>
                    </div>
                    <div class="col text-end align-content-center">
                        <asp:Label ID="LblBienvenidaUsuario" runat="server" CssClass="h2" Text="Bienvenido Usuario x"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="card-body" style="min-height: 300px;">
                <div class="d-flex align-items-start">
                    <div class="nav flex-column nav-pills me-5 col-3" id="navUsuario" role="tablist" aria-orientation="vertical">
                        <button class="nav-link btn-link active fs-4" id="v-pills-inicio-tab" data-bs-toggle="pill" data-bs-target="#v-pills-inicio" type="button" role="tab" aria-controls="v-pills-inicio" aria-selected="true">Inicio</button>
                        <button class="nav-link btn-link fs-4" id="v-pills-mispedidos-tab" data-bs-toggle="pill" data-bs-target="#v-pills-mispedidos" type="button" role="tab" aria-controls="v-pills-mispedidos" aria-selected="false">Pedidos</button>
                        <button class="nav-link btn-link fs-4" id="v-pills-misdatos-tab" data-bs-toggle="pill" data-bs-target="#v-pills-misdatos" type="button" role="tab" aria-controls="v-pills-misdatos" aria-selected="false">Mis Datos</button>
                        <button class="nav-link btn-link fs-4" id="v-pills-midireccion-tab" data-bs-toggle="pill" data-bs-target="#v-pills-midireccion" type="button" role="tab" aria-controls="v-pills-midireccion" aria-selected="false">Mi dirección</button>
                    </div>
                    <div class="tab-content col" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-inicio" role="tabpanel" aria-labelledby="v-pills-inicio-tab" tabindex="0">
                            <h2 style="margin-bottom: 20px;">Inicio</h2>
                            <h4>En esta ventana usted podrá navegar en las distintas secciones disponibles para, consultas de pedidos, modificación de datos, entre otras cosas.</h4>
                        </div>
                        <div class="tab-pane fade" id="v-pills-mispedidos" role="tabpanel" aria-labelledby="v-pills-mispedidos-tab" tabindex="0">
                            <h2 style="margin-bottom: 20px;">Mis pedidos</h2>
                            <% if (listaLecturaPedido != null && listaLecturaPedido.Count() > 0)
                                {%>
                            <asp:GridView ID="dgvPedidosUsuario" runat="server" DataKeyNames="id" CssClass="table table-bordered" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPedidosUsuario_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField HeaderText="N° Pedido" DataField="id" />
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha" />
                                    <asp:BoundField HeaderText="Estado" DataField="estadoPedido.nombre" />
                                    <asp:CommandField SelectText="Ver detalles" ShowSelectButton="true" />
                                </Columns>
                            </asp:GridView>
                            <%
                                }
                                else
                                 {%>

                                <h4>Todavia no tienes compras hechas para visualizar un pedido.</h4>

                            <%
                                }%>
                        </div>
                        <div class="tab-pane fade" id="v-pills-misdatos" role="tabpanel" aria-labelledby="v-pills-misdatos-tab" tabindex="0">
                            <h2 style="margin-bottom: 20px;">Datos Personales</h2>
                            <div class="row">
                                <div class="col">
                                    <h4>Nombres:</h4>
                                    <h4>Apellidos:</h4>
                                    <h4>Email:</h4>
                                    <h4>Telefono:</h4>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <asp:Label ID="LblNombre" runat="server" Text="Nombre" CssClass="h4"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="LblApellido" runat="server" Text="Apellido" CssClass="h4"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="h4"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="LblTelefono" runat="server" Text="Telefono" CssClass="h4"></asp:Label>
                                    </div>
                                </div>
                                <asp:Button ID="btnModificarDatosPersonales" Style="margin-top: 10px;" runat="server" Text="Modificar Datos Personales" CssClass="btn btn-dark" OnClick="btnModificarDatosPersonales_Click" />
                                <h2 style="margin: 20px 0 20px 0;">Datos de Usuario</h2>
                                <div class="row">
                                    <div class="col">
                                        <h4>Usuario:</h4>
                                        <h4>Contraseña:</h4>
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <asp:Label ID="LblUsuario" runat="server" Text="Usuario" CssClass="h4"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label ID="LblPassword" runat="server" Text="Contraseña" CssClass="h4"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnModificarDatosUsuario" Style="margin-top: 10px;" runat="server" Text="Modificar Datos de Usuario" CssClass="btn btn-dark" OnClick="btnModificarDatosUsuario_Click" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-midireccion" role="tabpanel" aria-labelledby="v-pills-midireccion-tab" tabindex="0">
                            <h2 style="margin-bottom: 20px;">Mi Dirección</h2>
                            <div class="row">
                                <div class="col">
                                    <h4>Dirección:</h4>
                                    <h4>provincia:</h4>
                                    <h4>Ciudad:</h4>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <asp:Label ID="LblDireccion" runat="server" Text="Calle" CssClass="h4"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="LblProvincia" runat="server" Text="Provincia" CssClass="h4"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="LblCiudad" runat="server" Text="Ciudad" CssClass="h4"></asp:Label>
                                    </div>
                                </div>
                                <asp:Button ID="btnModificarDireccion" Style="margin-top: 10px;" runat="server" Text="Modificar Dirección" CssClass="btn btn-dark" OnClick="btnModificarDireccion_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer text-end">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalCerrarSesion">
                    Cerrar Sesión
                </button>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalCerrarSesion" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Cerrar Sesión</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    ¿Está seguro de que desea cerrar sesión? Se perderá el progreso no guardado.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn btn-danger" OnClick="btnCerrarSesion_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

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
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" />
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
                            <h2 style="margin-bottom: 20px;">Mis Datos</h2>
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
                                <button type="button" class="btn btn-dark" style="margin-top: 10px" data-bs-toggle="modal" data-bs-target="#modalModificarMisDatos">
                                    Modificar Mis Datos Personales
                                </button>
                                <h2 style="margin-top: 20px;">Mi Cuenta</h2>
                                <div class="row" style="margin-top: 20px;">
                                    <div class="col">
                                        <h4>Usuario:</h4>
                                        <h4>Contraseña:</h4>
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <asp:Label ID="LblUsuario" runat="server" Text="Usuario" CssClass="h4"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label ID="lblPassword" runat="server" Text="******" CssClass="h4"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <button type="button" class="btn btn-dark" style="margin-top: 10px" data-bs-toggle="modal" data-bs-target="#modalModificarMiCuenta">
                                    Modificar Mi Cuenta
                                </button>
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
                                <button type="button" class="btn btn-dark" style="margin-top: 10px" data-bs-toggle="modal" data-bs-target="#modalModificarMiDireccion">
                                    Modificar Mi Dirección
                                </button>
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
    <div class="modal fade" id="modalModificarMisDatos" tabindex="-1" aria-hidden="False">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Modificar Mis Datos</h5>
                </div>
                <div class="modal-body">
                    <div class="container" style="margin-top: 20px;">
                        <div class="row">
                            <div class="col">
                                <h6>Nombre:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Apellido:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Email:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Telefono:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnModificarMisDatos" runat="server" Text="Confirmar" CssClass="btn btn-success" OnClick="btnModificarMisDatos_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalModificarMiCuenta" tabindex="-1" aria-hidden="False">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Modificar Mi Cuenta</h5>
                </div>
                <div class="modal-body">
                    <div class="container" style="margin-top: 20px;">
                        <div class="row">
                            <div class="col">
                                <h6>Usuario:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Contraseña:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Repetir Contraseña:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtRepetirPassword" runat="server" CssClass="form-control h6" TextMode="Password" required="true"></asp:TextBox>
                                <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnMOdificarUsuario" runat="server" Text="Confirmar" CssClass="btn btn-success" OnClick="btnModificarUsuario_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalModificarMiDireccion" tabindex="-1" aria-hidden="False">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Modificar Mi Dirección</h5>
                </div>
                <div class="modal-body">
                    <div class="container" style="margin-top: 20px;">
                        <div class="row">
                            <div class="col">
                                <h6>Dirección:</h6>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control h6" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Provincia:</h6>
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control h6" AppendDataBoundItems="true"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h6>Ciudad:</h6>
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control h6" AppendDataBoundItems="true"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnModificarDireccion" runat="server" Text="Confirmar" CssClass="btn btn-success" OnClick="btnModificarMiDireccion_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalCerrarSesion" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5">Cerrar Sesión</h5>
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

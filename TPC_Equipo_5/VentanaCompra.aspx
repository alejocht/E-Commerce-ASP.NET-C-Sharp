<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="VentanaCompra.aspx.cs" Inherits="TPC_Equipo_5.VentanaCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%//Rquerido para usar update panel %>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <contenttemplate>
            <div class="container d-flex justify-content-center align-items-center ">
                <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: auto; border-color: #c32a2a; height: auto;">
                    <div class="row">
                        <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                            <%switch (Pagina)
                                {
                                    case 1:%>
                            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 33%; background-color: #c32a2a;"></div>
                            <%break;
                                case 2:%>
                            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 66%; background-color: #c32a2a;"></div>
                            <%break;
                                case 3:%>
                            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 100%; background-color: #c32a2a;"></div>
                            <%break;
                                }
%>
                        </div>

                        <div class="text-center mt-3">
                            <img style="height: 50px" src="https://i.imgur.com/9E31weS.png" alt="OverCloaked">
                        </div>

                    </div>



                    <hr />

                    <%if (Pagina == 3)
                        {%>
                    <div class="text-center fs-1 fw-bold mt-3">
                        <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                        Resumen
                    </div>

                    <div class="container mt-3">
                        <div class="row">
                            <asp:Repeater runat="server" ID="repCarrito">
                                <itemtemplate>
                                    <div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-4">
                                                    <img src="<%#Eval("imagenPrincipal")%>" class="card-img-top" alt="Image description" onerror="this.src='https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'">
                                                </div>
                                                <div class="col text-start p-md-5">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div>
                                                                    <label>Articulo: <%#Eval("Nombre")%> </label>
                                                                </div>
                                                                <div>
                                                                    <label>Descripcion: <%#Eval("Descripcion")%> </label>

                                                                </div>
                                                                <div>
                                                                    <label>Precio: $ <%#Eval("Precio")%> </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="container text-start">
                                                        <div class="row">
                                                            <label>cantidad: </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="width: 90%; margin-inline: 10%;" />
                                </itemtemplate>
                            </asp:Repeater>
                        </div>
                        <div class="text-end">
                            <div class="container" id="containerResumenCompra">
                                <div class="row">
                                    <div class="col">
                                        <div>
                                            <asp:Label ID="lblSubTotal" runat="server" Text="Subtotal: xxxx" CssClass="p" />
                                        </div>
                                        <div>
                                            <asp:Label ID="lblEnvio" runat="server" Text="Envio: xxxx" CssClass="p" />
                                        </div>
                                        <div>
                                            <asp:Label ID="lblTotalCompra" runat="server" Text="Total: $xxxx" CssClass="h4" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <%}
%>

                        <%if (Pagina == 2)
                            { %><div class="text-center fs-1 fw-bold mt-3">
                                <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                                Metodo de pago
                            </div>
                        <div class=" mt-1 input-group mt-3">

                            <div class="input-group-text" style="background-color: #c32a2a; width: auto; color: white">
                                <label>Como quieres abonar?</label>
                            </div>
                            <div class="d-flex align-items-center gap-4 ms-2 ">

                                <div class="pt-1" style="font-size: 0.9rem">
                                    <label>Transferencia bancaria 💵</label>
                                    <asp:RadioButton ID="Transferencia" runat="server" CssClass="form-check-input" GroupName="Metodo_de_pago" OnCheckedChanged="Transferencia_CheckedChanged" AutoPostBack="true" />
                                </div>

                                <div class="pt-1" style="font-size: 0.9rem">
                                    <label>Mercado Pago </label>
                                    <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />

                                    <asp:RadioButton ID="Mp" runat="server" CssClass="form-check-input mb-auto" GroupName="Metodo_de_pago" AutoPostBack="true" />
                                </div>
                            </div>
                        </div>
                        <%} %>

                        <%if (Pagina == 1)
                            {  %>
                        <div class="text-center fs-1 fw-bold mt-3">
                            <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                            A donde lo enviamos?
                        </div>
                        <div class="row mt-3">
                            <div class="col">

                                <div class="input-group mt-1">
                                    <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                        <label>Direccion de envio</label>
                                    </div>
                                    <asp:TextBox CssClass="form-control" Style="flex: none; width: 40%;" runat="server" ID="Txt_Calle_R" />
                                </div>
                            </div>
                        </div>
                        <div class="input-group mt-1">
                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke; width: 5.3rem">
                                <label>Email</label>
                            </div>
                            <asp:TextBox ID="Txt_Email" CssClass="form-control" Style="flex: none; width: 40%;" runat="server" />
                        </div>
                        <%} %>
                        <%if (Transferencia.Checked && Pagina == 2)

                            { %>
                        <div class="row text-center align-content-center">
                            <div>
                                Nombre: Ovcloaked SA
                            </div>
                            <div>
                                Alias: Ovcloaked.compra.pago
                            </div>
                            <div>
                                Cbu:3226545311100003697079
                            </div>
                            <div>
                                <div>
                                    Carga aqui tu comprobante de pago

                                </div>
                                <div>
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" Style="background-color: #c32a2a color()" />
                                    <asp:Button ID="BtnSubir" Text="Subir archivo" OnClick="BtnSubir_Click" runat="server" />
                                </div>
                            </div>

                        </div>
                        <%} %>

                        <%if (Mp.Checked && Pagina == 2)
                            { %>
                        <div class="text-center fs-1 fw-bold">
                            <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />
                            Mercado Pago 
                                 <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />
                            <div class="row">
                                <div>
                                    PROXIMAMENTE!
                                </div>
                            </div>
                        </div>
                        <%}
                        %>
                        <div class="row">
                            <div class="text-start mt-3 col-6">
                                <div class=" ">
                                    <asp:Button ID="BtnAtras" runat="server" Text="Atras" CssClass="btn btn-primary" OnClick="BtnAtras_Click" Style="background-color: black; color: whitesmoke;" />
                                </div>
                            </div>

                            <%if (Pagina > 2)
                                { %>
                            <div class="text-end mt-3 col-6">
                                <div class=" ">
                                    <asp:Button ID="btnconfirmar" runat="server" Text="CONFIRMAR COMPRA" CssClass="btn btn-primary" OnClick="btnconfirmar_Click" Style="background-color: #c32a2a; color: whitesmoke;" />
                                </div>
                            </div>
                            <%}
                                else
                                { %>
                            <div class="text-end mt-3 col-6">
                                <div class=" ">
                                    <asp:Button ID="BtnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-primary" OnClick="BtnSiguiente_Click" Style="background-color: black; color: whitesmoke;" />
                                </div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>


        </contenttemplate>
    </asp:UpdatePanel>
    
</asp:Content>


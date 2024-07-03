<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="VentanaCompra.aspx.cs" Inherits="TPC_Equipo_5.VentanaCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%//Rquerido para usar update panel %>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container d-flex justify-content-center align-items-center ">
                <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: auto; border-color: #c32a2a; height: auto;">
                    <%switch (cambiopag)
                        {
                            case 1:%>
                    <div class="text-center">
                        <img style="height: 50px" src="https://i.imgur.com/9E31weS.png" alt="OverCloaked">
                        <div class="progress mt-2" role="progressbar" aria-label="Basic example" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar" style="width: 33%"></div>
                        </div>

                        <% break;
                            case 2:%>

                        <div class="text-center">
                            <img style="height: 50px" src="https://i.imgur.com/9E31weS.png" alt="OverCloaked">
                            <div class="progress mt-2" role="progressbar" aria-label="Basic example" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">
                                <div class="progress-bar" style="width: 66%"></div>
                            </div>


                            <% break;
                                case 3:%>
                            <div class="text-center">
                                <img style="height: 50px" src="https://i.imgur.com/9E31weS.png" alt="OverCloaked">
                                <div class="progress mt-2" role="progressbar" aria-label="Basic example" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar" style="width: 100%"></div>
                                </div>
                                <%break;
                                        default: break;
                                    }%>

                                <hr />
                            </div>
                            <%if (cambiopag == 1)
                                {  %>
                            <div class="text-center fs-1 fw-bold">
                                <img style="height: 3rem; width: 3rem;" src="/assets/truck.svg" />
                                Datos de envio 
                            </div>

                            <div class="container">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="dropdown mt-2">
                                            <asp:DropDownList ID="DdlProvincias" runat="server" OnSelectedIndexChanged="DdlProvincias_SelectedIndexChanged" AutoPostBack="true"
                                                aria-label="Default select example" CssClass="btn btn-secondary dropdown-toggle" Style="background-color: #c32a2a; color: whitesmoke;">
                                                <asp:ListItem Value="Provincia"> Provincia </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="dropdown mt-2">
                                            <asp:DropDownList ID="DdlLocalidad" runat="server"
                                                aria-label="Default select example" CssClass="btn btn-secondary dropdown-toggle" Style="background-color: #c32a2a; color: whitesmoke;">
                                                <asp:ListItem Value="Localidad"> Localidad </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>CP</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Cp" />                                                  
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Calle</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Calle" /> 
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Numero</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Num"/> 
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Piso</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Piso" /> 
                                            <asp:RequiredFieldValidator CssClass="validation" ErrorMessage="Campo requerido" ControlToValidate="Txt_Piso" runat="server" />
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <%} %>
                            <%if (cambiopag == 2)
                                {  %>
                            <div class="text-center fs-1 fw-bold">
                                <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                                Resumen
                            </div>

                            <div class="container mt-3">
                                <div class="row">
                                    <asp:Repeater runat="server" ID="repCarrito">
                                        <ItemTemplate>
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
                                                            <div class="container">
                                                                <div class="row">

                                                                    <div class="col-6 text-end">
                                                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" CommandArgument='<%# Eval("ID") %>' CommandName="IdArticulo" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="container text-end">
                                                                <div class="row">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="width: 90%; margin-inline: 10%;" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>


                                <div class=" mt-1 input-group mt-3">

                                    <div class="input-group-text" style="background-color: #c32a2a; width: auto; color: white">
                                        <label>Metodo de pago</label>
                                    </div>
                                    <div class="d-flex align-items-center gap-4 ms-2 ">

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            <label>Transferencia bancaria 💵</label>
                                            <asp:RadioButton ID="Tansf" runat="server" CssClass="form-check-input" OnCheckedChanged="Tansf_CheckedChanged" GroupName="Metodo_de_pago" />

                                        </div>

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            <label>Mercado Pago </label>
                                            <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />

                                            <asp:RadioButton ID="Mp" runat="server" CssClass="form-check-input mb-auto" OnCheckedChanged="Mp_CheckedChanged" GroupName="Metodo_de_pago" />
                                        </div>
                                    </div>


                                </div>
                                <div class="input-group mt-1">
                                    <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke; width: 5.3rem">
                                        <label>Email</label>
                                    </div>
                                    <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" /> 
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Provincia</label>
                                            </div>
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Localidad</label>
                                            </div>
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>

                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>CP</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Cp_R" /> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Calle</label>
                                            </div>
                                           <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Calle_R" /> 
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Numero</label>
                                            </div>
                                           <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Num_R" /> 
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Piso</label>
                                            </div>
                                           <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" ID="Txt_Piso_R" /> 
                                        </div>
                                    </div>
                                    <div>

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Comentario:</label>
                                            </div>
                                            <asp:TextBox CssClass="form-control" style="flex: none; width: 40%;" runat="server" /> 
                                        </div>

                                    </div>

                                </div>

                            </div>

                            <%} %>
                            <%if (cambiopag == 3)
                                {  %>

                            <%if (Trasferencia == true)
                                {%>

                            <div class="text-center fs-1 fw-bold">
                                💵Trasferencia Bancaria💵
                            </div>
                            <div class="row align-content-center">
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
                                    </div>
                                </div>

                            </div>
                            <%}
                                else if (Mercadopago == true)
                                {
                            %>
                            <div class="text-center fs-1 fw-bold">
                                <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />
                                Mercado Pago 
                                 <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />
                                <div class="row">
                                    <div>
                                        EN BREVES SERAS REDIRECCIONADO A MERCADO PAGO PARA REALIZAR EL PAGO!
                                    </div>
                                </div>
                            </div>
                            <%}
                                else
                                {
                                    ;%>
                            <div class="text-center fs-1 fw-bold">
                                Seleccione un metodo de pagos antes de continuar
                            </div>
                            <%} %>

                            <%} %>
                            <div class="row mt-5">
                                <div class=" col-6 align-items-start">
                                    <asp:Button ID="btnAtras" runat="server" Text="Atras" CssClass="btn btn-secondary dropdown-toggle" OnClick="btnAtras_Click" Style="background-color: black; color: whitesmoke;" />
                                </div>
                                <%if (cambiopag < 3 || Trasferencia == true || Mercadopago == true)
                                    { %>
                                <div class="col-6 ">
                                    <div class=" ">
                                        <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-secondary dropdown-toggle" OnClick="btnSiguiente_Click" Style="background-color: black; color: whitesmoke;" />

                                    </div>
                                </div>

                                <%} %>
                            </div>
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


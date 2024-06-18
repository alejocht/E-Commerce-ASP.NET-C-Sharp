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
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Calle</label>
                                            </div>
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Numero</label>
                                            </div>
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>
                                    <div class="col-4">

                                        <div class="input-group mt-1">
                                            <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke;">
                                                <label>Piso</label>
                                            </div>
                                            <input class="form-control" type="text" style="flex: none; width: 40%;" />
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <%} %>
                            <%if (cambiopag == 2)
                                {  %>
                            <div class="text-center fs-1 fw-bold">
                                <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                                Metodo de pago
                            </div>

                            <div class="container">
                                <div class=" mt-1 input-group">
                                    <div class="d-flex align-items-center gap-4 ms-2 ">

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            
                                            <asp:Button ID="btnTrasferencia" runat="server" Text="Transferencia bancaria 💵" CssClass="btn btn-primary" style="background-color: #c32a2a; color: whitesmoke;" OnClick="btnTrasferencia_Click" />
                                       

                                        </div>

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            <asp:Button ID="Button1" runat="server" Text="Mercado Pago" CssClass="btn btn-primary" style="background-color: #c32a2a; color: whitesmoke;" />                                                                              
                                        </div>
                                    </div>

                                </div>
                            <%} %>
                            <%if (cambiopag == 3)
                                {  %>
                            <div class="text-center fs-1 fw-bold">
                                <img style="height: 3rem; width: 3rem;" src="/assets/cash-coin.svg" />
                                Datos de pago
                            </div>

                            <div class="container">
                                <div class=" mt-1 input-group">

                                    <div class="input-group-text" style="background-color: #c32a2a; width: auto; color: white">
                                        <label>Metodo de pago</label>
                                    </div>
                                    <div class="d-flex align-items-center gap-4 ms-2 ">

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            <label>Transferencia bancaria 💵</label>
                                            <asp:RadioButton ID="RadioButton1" runat="server" CssClass="form-check-input" Style="background-color: whitesmoke;" />

                                        </div>

                                        <div class="pt-1" style="font-size: 0.9rem">
                                            <label>Mercado Pago </label>
                                            <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/3913/PNG/512/mercadopago_logo_icon_248494.png" runat="server" Style="width: 2rem; height: 2rem;" />

                                            <asp:RadioButton ID="RadioButton2" runat="server" CssClass="form-check-input mb-auto" Style="background-color: whitesmoke;" />
                                        </div>
                                    </div>


                                </div>
                                <div class="input-group mt-1">
                                    <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke; width: 5.3rem">
                                        <label>Email</label>
                                    </div>
                                    <input class="form-control " type="text" placeholder="Example@gmail.com" />
                                </div>
                            </div>
                            <%} %>
                            <div class="row mt-5">
                                <div class=" col-6 align-items-start">
                                    <asp:Button ID="btnAtras" runat="server" Text="Atras" CssClass="btn btn-secondary dropdown-toggle" OnClick="btnAtras_Click" Style="background-color: black; color: whitesmoke;" />
                                </div>
                                <div class="col-6 align-content-end">
                                    <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-secondary dropdown-toggle" OnClick="btnSiguiente_Click" Style="background-color: black; color: whitesmoke;" />
                                </div>
                            </div>
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

